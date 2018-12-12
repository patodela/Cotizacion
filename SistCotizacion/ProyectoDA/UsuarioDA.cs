using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime;
using System.Text;
using System.Threading.Tasks;


namespace ProyectoDA
{
    public class UsuarioDA
    {
        private ConexionSQL Conexion = new ConexionSQL();
        private SqlDataReader leer;
        DataTable dt = new DataTable();
        SqlCommand comando = new SqlCommand();
        public  bool bError = false;
        public string sError = string.Empty;


        public DataTable ObtenerUsuarios()
        {
            try
            {
                comando.Connection = Conexion.AbrirConexion();
                comando.CommandText = "obtener_Usuarios";
                comando.CommandType = CommandType.StoredProcedure;
                leer = comando.ExecuteReader();
                dt.Load(leer);
                Conexion.CerrarConexion();
                return dt;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }

        public DataTable existeUsuario(string usuario, string pass)
        { 
            try
            {
                comando.Connection = Conexion.AbrirConexion();
                comando.CommandText = "sp_existe_usuario";
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@sUsuario", usuario));
                comando.Parameters.Add(new SqlParameter("@sPass", pass));
                leer = comando.ExecuteReader();
                dt.Load(leer);
                Conexion.CerrarConexion();
                return dt;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }            
        }

        /// <summary>
        /// Verifica si existe el usuario y si esta activo 
        /// </summary>
        /// <returns>true si existe, false si no existe o esta inactivo, var sError indica motivo </returns>
        //public bool existeUsuario(string usuario, string pass)
        //{

        //    bError = false;
        //    sError = string.Empty;

        //    bool existe = false;
        //    try
        //    {

        //        //string[] Cn = Properties.Settings.Default.sConexion.Split(';');
        //        //string Pass = Properties.Settings.Default.sPassConexion;
        //        ConexionSQL oSql = new ConexionSQL();
        //        List<SqlParameter> lp = new List<SqlParameter>();
        //        SqlParameter p = new SqlParameter("@sUsuario", SqlDbType.VarChar, 10);
        //        p.Value = usuario;
        //        lp.Add(p);
        //        p = new SqlParameter("@sPasswd", SqlDbType.VarChar, 15);
        //        p.Value = pass;
        //        lp.Add(p);

        //        lp = Conexion.EjecutarSp("sp_busca_usuario", lp);

        //        if (Conexion.bError) //usuario no existe
        //        {
        //            bError = true;
        //            existe = false;
        //            sError = Conexion.sError;
        //        }
        //        else // existe
        //        {
        //            existe = true;
        //            sError = Conexion.sError;

        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        bError = true;
        //        sError = ex.Message;
        //        existe = false;
        //    }

        //    return existe;
        //}
    }
}
