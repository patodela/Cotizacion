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

       
    }
}
