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
            DataTable dtUsuario = new DataTable();
            string usuario = txt_usuario.Text.Trim();
            string pass = txtPassword.Text.Trim();

            UsuarioBL ubl = new UsuarioBL();
            dtUsuario = ubl.existeUsuario(usuario, pass);
            if (dtUsuario.Rows.Count >= 1 )
            {
                if (bool.Parse(dtUsuario.Rows[0]["activo"].ToString()))
                {
                    Response.Redirect(@"\index.aspx");

                }
                else {
                    //mostrar mensaje usuario no activo
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Usuario no se encuentra activo para iniciar sesión.')", true);
                }
            }
            else
            {
                //no existe
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Usuario no se encuentra registrado en el sistema.')", true);
            }


        }
    }
}