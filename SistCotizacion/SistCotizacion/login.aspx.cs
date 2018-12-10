using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;


namespace SistCotizacion
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string usuario = txt_usuario.Text.Trim();
            string pass = txtPassword.Text.Trim();

            UsuarioBL ubl = new UsuarioBL(usuario,pass);
            if (ubl.existeUsuario())
            {
                Response.Redirect(@"\index.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ubl.sError.Replace("'","")+"')", true);
            }


        }
    }
}