using MSSQLSUL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MSSQLSUL.Seguridad;

namespace ProyectoDA
{
    public class OrganizadorDA
    {

     
        public int id_org { get; set; }
        public String cod_org { get; set; }
        public String descripcion { get; set; }
        private MSSQLSUL.Seguridad.Usuario UsrConn { get; set; }

    
        public OrganizadorDA(MSSQLSUL.Seguridad.Usuario _usrConn) {
            UsrConn = _usrConn;
        }

       public DataTable GetOrganizador()
        {
      

            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }

            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("Select * from dbo.organizador", ref vError, vParaMetros: null,vTimeoutConexion: 90,vEsProcedimiento:false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al consultar tabla Organizador.<br/>" + ex.Message, ex);
            }
        }


        public DataTable GetDescripcionSKU(nombreTabla nameTabla)
        {


            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }

            try
            {
               
                string vError = "";
                DataTable vResp = vCon.Ejecutar("Select * from "+ nameTabla.ToString(), ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al consultar tabla "+nameTabla.ToString()+".<br/>" + ex.Message, ex);
            }
        }

        public void Upd_Organizador_Familia(nombreTabla _tipoTabla,int idOrganizacion,string descripcion, string codLetra = null)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }            
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@sUsuario", UsrConn.id_usuario);
            vParam.Add("@organizador",(int)_tipoTabla);
            vParam.Add("@id_org", idOrganizacion);
            vParam.Add("@descripcion", descripcion);
            vParam.Add("@codFam", codLetra);
            vParam.Add("@sError", null);

            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_UPD_Organizador_Familia]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }

        }

        public DataTable GetGrupo() {

            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }

            try
            {
                string sQuery = "SELECT FORMAT([id_grupo],'00') AS id_grupo,[nombre_grupo],[fecha_upd],[id_usuario] FROM[impexcom_cotizacion].[dbo].[var_principal_grupo]";
                string vError = "";
                DataTable vResp = vCon.Ejecutar(sQuery, ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error en la funcion GetGrupo .<br/>" + ex.Message, ex);
            }


        }

        public void Inserta_Descripcion_SKU(nombreTabla _tipoTabla, string descripcion,string codLetra = null)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@IDUsuario", UsrConn.id_usuario);
            vParam.Add("@tipoTabla", _tipoTabla);      
            vParam.Add("@descripcion", descripcion);
            vParam.Add("@codFamily", codLetra);
            vParam.Add("@sError", null);

            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_INSERT_descrp_MantenedorSKU]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }

        }

        
       public DataTable CountRegistroTabla(nombreTabla _tipoTabla, string codLetra = null)
        {


            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }

            try
            {
                string query = string.Empty;
                if (_tipoTabla.ToString().Equals(nombreTabla.VAR_IDENTI_COMBINACION_1.ToString()) || _tipoTabla.ToString().Equals(nombreTabla.VAR_CUANTI_COMBINACION_1.ToString()))
                {
                    query = "SELECT ISNULL(MAX(CAST(right(cod_comb_1,len(cod_comb_1)-1)AS INT)),0) as cant  FROM[dbo].[" + _tipoTabla.ToString()+"] WHERE cod_letra = '"+ codLetra + "'";
                }
                else if(_tipoTabla.ToString().Equals(nombreTabla.VAR_IDENTI_COMBINACION_2) || _tipoTabla.ToString().Equals(nombreTabla.VAR_CUANTI_COMBINACION_2.ToString()))
                {
                    query = "SELECT ISNULL(MAX(right(cod_comb_2,len(cod_comb_2)-1)),0) as cant  FROM[dbo].[" + _tipoTabla.ToString() + "] WHERE cod_letra = '" + codLetra + "'";
                }
                else if (_tipoTabla.Equals(nombreTabla.FAMILIA))
                {
                    query = "SELECT count(*) FROM FAMILIA where cod_org ='"+ codLetra +"'";
                }
                else
                {
                    query =  "select count(*) from " + _tipoTabla.ToString();
                }

                string vError = "";
                DataTable vResp = vCon.Ejecutar(query, ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al obtener cantidad de registros en tabla "+ _tipoTabla.ToString()+".<br/>" + ex.Message, ex);
            }
        }
    }
}
