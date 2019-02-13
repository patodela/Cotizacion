using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSSQLSUL.Seguridad;

namespace SistCotizacion
{
    public partial class NavContenido : System.Web.UI.MasterPage
    {     

        public MSSQLSUL.Seguridad.Usuario UsuarioConectado
        {

            get { return (MSSQLSUL.Seguridad.Usuario)Session["Usuario"]; }
            set { Session["Usuario"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UsuarioConectado != null && UsuarioConectado.EstadoUsuario == EstadoUsuario.Logeado)
            {
                lblUsuario.Text = UsuarioConectado.NombreUsuario;
            }
            else
            {
                Session.Clear();
                Response.Redirect("~/Login.aspx");
            }

        }

        protected void lblCerrarSesion_Click(object sender, EventArgs e)
        {


            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        public void MostrarError(String vMensaje, String vTitulo = "Error", System.Exception vException = null)
        {
            MostrarMensaje(vMensaje, vTitulo);
            String vMsj = "";
            String vStack = String.Empty;
            if (vException != null)
            {
                vStack = vException.StackTrace;
                while (vException != null)
                {
                    vMsj += vException.Message + "<br/>";
                    vException = vException.InnerException;
                }
            }
        }

        public void MostrarMensajeCuidado(String vMensaje, String vTitulo = "Información")
        {
            litMensajeTitulo.Text = vTitulo;
            litMensajeTexto.Text = vMensaje;
            mpeMensaje.Show();
            //mpeEspera.Hide();
        }


        public void MostrarMensaje(String vMensaje, String vTitulo = "Información")
        {
            litMensajeTitulo.Text = vTitulo;
            litMensajeTexto.Text = vMensaje;
            mpeMensaje.Show();
            //mpeEspera.Hide();
        }
    }
}