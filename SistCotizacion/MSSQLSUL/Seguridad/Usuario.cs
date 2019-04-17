using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MSSQLSUL.Seguridad
{
    public class Usuario
    {
        public static SqlConnectionStringBuilder builder;

        public String StringConexion { get; set; }
        public String NombreUsuario { get; set; }
        public String Clave { get; set; }
        private EstadoUsuario vEstado;       
        private string codUsuario { get; set; }
        private string sPasswd { get; set; }
        public int id_usuario { get; set; }
        private int id_tipo_usuario { get; set; }
        private string cod_usuario { get; set; }
        private string pwd_usuario { get; set; }
        private DateTime fecha_ingreso { get; set; }
        private bool activo { get; set; }
        private DateTime fecha_actualizacion { get; set; }
        public string Rol { get; } 
        public string ClaveRol { get; }
        public EstadoUsuario EstadoUsuario 
        {
            get
            {
                return vEstado;
            }
        }

        public Usuario(String vUser, String vPass)
        {
            // Tenemos que crear el string de conexion primero
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            builder.DataSource = "204.93.168.25";
            builder.InitialCatalog = "impexcom_cotizacion";
            builder.UserID = "impexcom_sistema";
            builder.Password = "Abc123456";
            StringConexion = builder.ConnectionString;

            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(this);

            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }
            Dictionary<string, object> vParam = new Dictionary<string, object>();



            vParam.Add("@sUsuario", vUser);
            vParam.Add("@sPass", vPass);
            //vParam.Add("P_NOMBRE_ROL", "");// OUT

            try
            {
                //aca tengo que ver si existe el usuario en BD
                string vError = "";
                DataTable vResp = vCon.Ejecutar("sp_existe_usuario", ref vError, vParaMetros: vParam);
                if (vResp.Rows.Count > 0)
                {
                    vEstado = EstadoUsuario.Logeado;
                    id_usuario = int.Parse(vResp.Rows[0]["id_usuario"].ToString());
                    id_tipo_usuario = int.Parse(vResp.Rows[0]["id_tipo_usuario"].ToString());
                    NombreUsuario = vResp.Rows[0]["nombre"].ToString();
                    cod_usuario = vResp.Rows[0]["cod_usuario"].ToString();
                    pwd_usuario = vResp.Rows[0]["pwd_usuario"].ToString();
                    fecha_ingreso = DateTime.Parse(vResp.Rows[0]["fecha_ingreso"].ToString());
                    activo = bool.Parse(vResp.Rows[0]["activo"].ToString());
                    fecha_actualizacion = DateTime.Parse(vResp.Rows[0]["fecha_actualizacion"].ToString());
                    
                }
                else
                {
                    vEstado = EstadoUsuario.NoLogeado; //No pudo ingresar                    
                }


                vCon.Confirmar();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo validar el inicio de sesión.<br/>" + ex.Message, ex);
            }
        }
    }
}
