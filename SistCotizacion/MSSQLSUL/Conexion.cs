using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MSSQLSUL
{
    public class Conexion
    {
        private SqlConnection _Con;
        private SqlTransaction _Tran;
        private Boolean vTranInterna;
        private int vNivelRecursivo;
        private const int TIMEOUT_CONEXION = 90;
        private Seguridad.Usuario vUser;

        public Conexion(Seguridad.Usuario vUsuario)
        {
            if (vUsuario == null)
            {
                throw new Exception("No se puede crear la conexión porque no se ha provisto una cadena de conexión válida.");
            }
            else
            {
                vUser = vUsuario;
                _Con = new SqlConnection(vUser.StringConexion);
                vNivelRecursivo = 0;
            }
        }

        ~Conexion()
        {
            if (_Tran != null)
            { //como hay transaccion
                Deshacer();
            }
            if ((_Con != null) && (_Con.State == ConnectionState.Open))
            {
                try
                {
                    _Con.Close();
                    _Con.Dispose();
                }
                catch (Exception ex)
                {
                    //en caso de que falle esta instruccion lña conexion ya se encuentra cerrada y no se le avisa al usuario ya que es intruccion interna
                }
            }
        }

        /// <summary>
        /// Ejecuta funcion que retorna numero con parametros de entrada sin parametros de salida.
        /// </summary>
        /// <param name="vProcAlmacenado"></param>
        /// <param name="vParaMetros"></param>
        /// <param name="vTimeoutConexion"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        public Decimal ExecNumber(String vProcAlmacenado,
                                   ref String vPErrMsg,
                                   Dictionary<String, Object> vParaMetros = null,
                                   int vTimeoutConexion = TIMEOUT_CONEXION)
        {

            SqlCommand cmdTmp = new SqlCommand(vProcAlmacenado) { CommandType = CommandType.StoredProcedure, Connection = _Con };

            //Aqui abriremos la conexion. Cuando vNivelRecursivo  es cero es porque esta es la ejecucion que se nos ordenó.
            //Toda ejecucion extra es nuestra, ya que somos nosotros los que necesitamos hacerla,
            //y como usaremos la misma funcion para ejecutar, revisaremos tambien el nivel de recursividad para evitar 
            //cerrar la conexion a la base de datos y asi mantener la transacción.
            //Así, la vez que nos solicitan ejecutar el procedimiento SP_X por ejemplo
            //tendremos un nivel de llamada recursiva, luego al asignar el rol tendremos un nivel=2.
            vNivelRecursivo++;

            if (_Tran == null)
            {
                IniciarTransaccion(true);
            }
            cmdTmp.Transaction = _Tran;
            cmdTmp.CommandTimeout = vTimeoutConexion;
            try
            {
                SqlCommandBuilder.DeriveParameters(cmdTmp);
            }
            catch (Exception ex)
            {
                Deshacer();
                throw new Exception("No se pudo obtener infor (macion del procedimiento almacenado. Nombre SP: " + vProcAlmacenado, ex);
            }

            if (vParaMetros != null)
            {
                //tenemos argumentos que preparar para el sp.
                foreach (String vClave in vParaMetros.Keys)
                {
                    String vClaveMay = vClave.ToUpper();
                    if (cmdTmp.Parameters[vClaveMay].Direction == ParameterDirection.Input |
                       cmdTmp.Parameters[vClaveMay].Direction == ParameterDirection.InputOutput)
                    {
                        cmdTmp.Parameters[vClaveMay].Value = vParaMetros[vClave];
                    }
                }
            }

            try
            {
                cmdTmp.ExecuteNonQuery();
                return decimal.Parse(cmdTmp.Parameters["RESULT"].Value.ToString());

                // Procesaremos todos los parametros que sean de salida.
                foreach (SqlParameter vParam in cmdTmp.Parameters)
                {
                    if (vParam.Direction == ParameterDirection.Output |
                       vParam.Direction == ParameterDirection.InputOutput)
                    {
                        if (vParaMetros.ContainsKey(vParam.ParameterName))
                        {
                            vParaMetros[vParam.ParameterName] = vParam.Value;
                        }
                    }
                }

                //    Esto procesa el mensaje de Salida 
                if (!String.IsNullOrEmpty(vPErrMsg))
                {
                    // Estamos preguntando por el valor de retorno de este parametro
                    if (String.IsNullOrEmpty(cmdTmp.Parameters[vPErrMsg].Value.ToString()) || cmdTmp.Parameters[vPErrMsg].Value.ToString().ToUpper() == "NULL")
                    {
                        vPErrMsg = String.Empty;
                    }
                    else
                    {
                        vPErrMsg = cmdTmp.Parameters[vPErrMsg].Value.ToString();
                    }
                    //else no importa ya que no nos pidieron perguntar por él.
                }

                //    En este punto realizaremos el commit solo y solo si estamos en el nivel uno de recursividad.
                if (vTranInterna & vNivelRecursivo == 1)
                {
                    Confirmar();
                    //Luego disminuiremos un nivel de recursividad antes de retornar
                    vNivelRecursivo--;
                }
            }
            catch (Exception ex)
            {
                Deshacer();
                throw new ApplicationException("No se pudo realizar la operacion.", ex);
            }






        }

        public DataTable Ejecutar(String vProcAlmacenado, ref String vPErrMsg, Dictionary<String, Object> vParaMetros = null,
                                                int vTimeoutConexion = TIMEOUT_CONEXION,
                                                Boolean vEsProcedimiento = true)
        {
            SqlCommand cmdTmp = new SqlCommand(vProcAlmacenado);
            DataTable dt = new DataTable();
            cmdTmp.Connection = _Con;

            //Aqui abriremos la conexion. Cuando vNivelRecursivo  es cero es porque esta es la ejecucion que se nos ordenó.
            //Toda ejecucion extra es nuestra, ya que somos nosotros los que necesitamos hacerla,
            //y como usaremos la misma funcion para ejecutar, revisaremos tambien el nivel de recursividad para evitar 
            //cerrar la conexion a la base de datos y asi mantener la transacción.
            //Así, la vez que nos solicitan ejecutar el procedimiento SP_X por ejemplo
            //tendremos un nivel de llamada recursiva, luego al asignar el rol tendremos un nivel=2.
            vNivelRecursivo++;

            if (_Tran == null)
            {
                IniciarTransaccion(true);
            }
            cmdTmp.Transaction = _Tran;
            cmdTmp.CommandTimeout = vTimeoutConexion;

            if (vEsProcedimiento)
            {
                cmdTmp.CommandType = CommandType.StoredProcedure;
                try
                {
                    SqlCommandBuilder.DeriveParameters(cmdTmp);
                }
                catch (Exception ex)
                {
                    Deshacer();
                    throw new Exception(String.Format("No se pudo obtener infor (macion del procedimiento almacenado. Nombre SP: {0}.:::.{1}", vProcAlmacenado, ex.Message), ex);
                }

                if (vParaMetros != null)
                {
                    //tenemos argumentos que preparar para el sp.
                    foreach (String vClave in vParaMetros.Keys)
                    {
                        if (cmdTmp.Parameters[vClave].Direction == ParameterDirection.Input |
                           cmdTmp.Parameters[vClave].Direction == ParameterDirection.InputOutput)
                        {
                            cmdTmp.Parameters[vClave].Value = vParaMetros[vClave];
                        }
                    }
                }
                else
                {
                    cmdTmp.CommandType = CommandType.Text;
                }
            }

            try
            {
                SqlDataAdapter dtd = new SqlDataAdapter(cmdTmp);
                dtd.Fill(dt);

                //Procesaremos todos los parametros que sean de salida.
                foreach (SqlParameter vParam in cmdTmp.Parameters)
                {
                    if (vParam.Direction == ParameterDirection.Output |
                       vParam.Direction == ParameterDirection.InputOutput)
                    {
                        if (vParaMetros.ContainsKey(vParam.ParameterName))
                        {
                            vParaMetros[vParam.ParameterName] = vParam.Value;
                        }
                    }
                }

                //Esto procesa el mensaje de Salida 
                if (!String.IsNullOrEmpty(vPErrMsg))
                {
                    //Estamos preguntando por el valor de retorno de este parametro
                    if (String.IsNullOrEmpty(cmdTmp.Parameters[vPErrMsg].Value.ToString())
                    || cmdTmp.Parameters[vPErrMsg].Value.ToString().ToUpper() == "NULL")
                    {
                        vPErrMsg = String.Empty;
                    }
                    else
                    {
                        vPErrMsg = cmdTmp.Parameters[vPErrMsg].Value.ToString();
                    }
                    //else no importa ya que no nos pidieron perguntar por él.
                }

                //En este punto realizaremos el commit solo y solo si estamos en el nivel uno de recursividad.
                if (vTranInterna & vNivelRecursivo == 1)
                {
                    Confirmar();
                }

                //Luego disminuiremos un nivel de recursividad antes de retornar
                vNivelRecursivo--;

                return dt;
            }
            catch (Exception ex)
            {
                Deshacer();
                throw new ApplicationException(ex.Message);
            }
        }



        //public DataTable EjecutarXml(String vProcAlmacenado ,XmlDocument ds_xml ){
        //    Dim cmdTmp As SqlCommand
        //    Dim dt As New System.Data.DataTable
        //    cmdTmp.CommandType = Data.CommandType.StoredProcedure
        //    cmdTmp = New SqlCommand("GDR.PKG_CLIENTE.GetActionType")
        //    cmdTmp.Connection = _Con




        //    if (_Tran == null) {
        //        IniciarTransaccion(True)
        //    }
        //    cmdTmp.Transaction = _Tran

        //    try {
        //        Dim oraCommand As SqlCommand
        //        Dim param_xml As XmlDocument
        //        param_xml = ds_xml
        //        Dim _Con As SqlConnection


        //        cmdTmp.Parameters.Add("xml_document_i", Devart.Data.Sql.SqlDbType.Xml, param_xml, Data.ParameterDirection.Input)



        //        Dim result = New Devart.Data.Sql.SqlParameter()
        //        result.ParameterName = "action_i"
        //        result.Direction = Data.ParameterDirection.Output
        //        result.SqlDbType = Devart.Data.Sql.SqlDbType.VarChar
        //        result.Size = 256
        //        cmdTmp.Parameters.Add(result)

        //        cmdTmp.ExecuteNonQuery()



        //        // if (vTranInterna And vNivelRecursivo = 1) {
        //        Confirmar()
        //        //  }


        //    catch(Exception ex) { 
        //        Deshacer()
        //        throw newApplicationException("No se pudo realizar la operacion.", ex)
        //    }
        //}


        public void IniciarTransaccion(Boolean vTransaccionInterna = false)
        {
            _Con.Open();//Abrimos la conexion, importante que no se cierre hasta despues del commit o del rollback.
            _Tran = _Con.BeginTransaction(IsolationLevel.ReadCommitted);
            vTranInterna = vTransaccionInterna;
            string vError = "";
            if (vUser != null && !String.IsNullOrEmpty(vUser.Rol))
            {
                Ejecutar(String.Format("SET ROLE {0} IDENTIFIED BY {1}", vUser.Rol, vUser.ClaveRol), ref vError, vEsProcedimiento: false);
            }
        }

        public void Deshacer()
        {
            try
            {
                _Tran.Rollback();
                _Con.Close();
            }
            catch (Exception ex)
            {
                //algo salio mal .
                //Es probable que se haya realizado ya la llamda a esta rutina por
                //lo que el rollback y el close ya se realizaron.
            }
        }

        public void Confirmar()
        {
            try
            {
                _Tran.Commit();
                _Con.Close();
            }
            catch (Exception ex)
            {
                //Algo salio mal.
                if (_Con.State != ConnectionState.Closed)
                {
                    _Con.Close();
                }
            }
        }



    }
}

