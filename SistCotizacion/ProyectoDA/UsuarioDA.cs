using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime;
using System.Text;
using System.Threading.Tasks;
using MSSQLSUL;


namespace ProyectoDA
{
    public class UsuarioDA
    {
        //private ConexionSQL Conexion = new ConexionSQL();
        private SqlDataReader leer;
        DataTable dt = new DataTable();
        SqlCommand comando = new SqlCommand();
        public bool bError = false;
        public string sError = string.Empty;


        public DataTable ObtenerUsuarios(MSSQLSUL.Seguridad.Usuario vUsuario, string pNombreUsuario, int pEstado)
        {
            DataTable vTabla = new DataTable();
            try
            {
                Conexion vCon = new Conexion(vUsuario);
                Dictionary<string, object> vParam = new Dictionary<string, object>();

                vParam.Add("@sNombreUsuario", pNombreUsuario);
                vParam.Add("@iEsatdo", pEstado);


                string vError = "";
                vTabla = vCon.Ejecutar("sp_obtener_Usuarios", ref vError, vParam);


            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return vTabla;

        }
    }
}
