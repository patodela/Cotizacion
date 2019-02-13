using MSSQLSUL.Seguridad;
using ProyectoBL;
using System;
using System.Data;
using System.Web.UI;

namespace SistCotizacion
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            try
            {
                MSSQLSUL.Seguridad.Usuario vUsuario = new MSSQLSUL.Seguridad.Usuario(txt_usuario.Text, txtPassword.Text);

                if (vUsuario != null)
                {
                    switch (vUsuario.EstadoUsuario)
                    {
                        case EstadoUsuario.Logeado:
                            Session["Usuario"] = vUsuario;
                            Response.Redirect("/index.aspx", false);
                            break;
                        case EstadoUsuario.NoLogeado:
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Ingreso no válido.";
                            break;
                        case EstadoUsuario.PassExpirado:
                            //En este caso debemos pedir que cambie el password.
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Su contraseña Expiro, Por favor cambiela.";
                            break;
                    }


                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }


        }

        private void CerrarSession()
        {
            Session.Clear();
            Session.RemoveAll();
        }


        protected void Ingresar(Object sender, EventArgs e)
        {

            try
            {
                MSSQLSUL.Seguridad.Usuario vUsuario = new MSSQLSUL.Seguridad.Usuario(txt_usuario.Text, txtPassword.Text);

                if (vUsuario != null)
                {
                    switch (vUsuario.EstadoUsuario)
                    {
                        case EstadoUsuario.Logeado:
                            Session["Usuario"] = vUsuario;
                            Response.Redirect("/Principal.aspx", false);
                            break;
                        case EstadoUsuario.NoLogeado:
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Ingreso no válido.";
                            break;
                        case EstadoUsuario.PassExpirado:
                            //En este caso debemos pedir que cambie el password.
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Su contraseña Expiro, Por favor cambiela.";
                            break;
                    }


                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }


    }
}