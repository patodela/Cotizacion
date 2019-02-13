using System;
using System.Collections.Generic;
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
        private int P_ID_USUARIO;
        private int P_DIAS_EXPIRACION;
        private String P_MSJ_EXPIRACION;
        private String P_HOST_SMTP;
        private String P_NOMBRE_ROL;
        private String P_CLAVE_ROL;

        public EstadoUsuario EstadoUsuario
        {
            get
            {
                return vEstado;
            }
        }

        public int ID
        {
            get
            {
                return P_ID_USUARIO;
            }
        }
        public int DiasExpiracion
        {
            get
            {
                return P_DIAS_EXPIRACION;
            }
        }

        public String MensajeExpiracion
        {
            get
            {
                return P_MSJ_EXPIRACION;
            }
        }

        public String HostSMTP
        {
            get
            {
                return P_HOST_SMTP;
            }
        }

        public String Rol
        {
            get
            {
                return P_NOMBRE_ROL;
            }
        }

        public String ClaveRol
        {
            get
            {
                return P_CLAVE_ROL;
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

            //TextBox5.Text = builder.ConnectionString;​        



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
            //Dictionary<string,object> vParam = new Dictionary<string,object>();



            //     vParam.Add("P_APLICACION", 23);
            //     vParam.Add("P_USUARIO_RED", ""); //IN VARCHAR2,
            //     vParam.Add("P_USUARIO_SISTEMA", vUser);

            //     vParam.Add("P_ID_USUARIO", 0);//OUT NUMBER,
            //     vParam.Add("P_DIAS_EXPIRACION", 0);//OUT NUMBER,
            //     vParam.Add("P_HOST_SMTP", "") ;//OUT VARCHAR2,
            //     vParam.Add("P_MSJ_EXPIRACION", ""); //OUT VARCHAR2,
            //     vParam.Add("P_NOMBRE_ROL", ""); //OUT VARCHAR2,
            //     vParam.Add("P_CLAVE_ROL", "") ;//OUT VARCHAR2,


            try
            {
                //    string vError = "";
                //    int vResp = int.Parse((vCon.ExecNumber("SA.FX_CONECTAR", ref vError,vParaMetros:vParam).ToString()));

                //    vEstado = (EstadoUsuario)vResp;
                //    switch(vEstado){
                //        case EstadoUsuario.NoLogeado: //No pudo ingresar
                //            break;
                //        case EstadoUsuario.Logeado: //Acceso Correcto
                //            P_NOMBRE_ROL = vParam["P_NOMBRE_ROL"].ToString();
                //            P_CLAVE_ROL = vParam["P_CLAVE_ROL"].ToString();

                //            P_ID_USUARIO = int.Parse(vParam["P_ID_USUARIO"].ToString());
                //            P_DIAS_EXPIRACION =  int.Parse(vParam["P_DIAS_EXPIRACION"].ToString());
                //            P_HOST_SMTP = vParam["P_HOST_SMTP"].ToString();
                //            break;
                //        case EstadoUsuario.PassExpirado: //Clave Expirada
                //            P_MSJ_EXPIRACION = vParam["P_MSJ_EXPIRACION"].ToString();
                //            break;
                //}
                vEstado = EstadoUsuario.Logeado;
                vCon.Confirmar();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo validar el inicio de sesión.<br/>" + ex.Message, ex);
            }
        }
    }
}
