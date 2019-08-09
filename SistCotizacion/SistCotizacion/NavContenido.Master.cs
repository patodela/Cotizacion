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

            if (!Page.IsPostBack)
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


        }

        protected void lblCerrarSesion_Click(object sender, EventArgs e)
        {


            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        public void MostrarError(String vMensaje, String vTitulo = "Error", System.Exception vException = null)
        {
           
            String vMsj = "";
            String vStack = String.Empty;
            if (vException != null)
            {
                vStack = vException.StackTrace;
                //while (vException != null)
                //{
                //    vMsj += vException.Message + "<br/>";
                //    vException = vException.InnerException;
                //}

                vMsj = vException.Message + "<br/>";
                vMsj += vStack;
            }
            vMensaje = vMensaje + "<br/>" + vMsj;
            MostrarMensaje(vMensaje, vTitulo);

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

        public void MostrarMensajeRedirect(String vMensaje, string Url, String vTitulo = "Información")
        {
            litMensajeTitulo.Text = vTitulo;
            litMensajeTexto.Text = vMensaje;
            //btnAceptarRedirect.PostBackUrl = Url;
            //btnAceptarRedirect.Attributes.Add("formnovalidate", "formnovalidate");
            //btnAceptarRedirect.Visible = true;
            //btnAceptarMensaje.Visible = false;
            mpeMensaje.Show();
        }
    }
}