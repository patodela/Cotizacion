using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoDA;
using SistCotizacion.Master;

namespace SistCotizacion.Usuarios
{
    public partial class Users : PContenidoPostLogin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Buscar();
            }
        }

        protected void btnBuscarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                Buscar();
            }
            catch (Exception ex)
            {
                MostrarError(ex.Message);
            }
        }

        private void Buscar()
        {
            try
            {
                string vNombre = txtNombreUsuario.Text;
                int vEstado = int.Parse(dwlEstado.SelectedValue);
                UsuarioDA usr = new UsuarioDA();
                griUsuario.DataSource = usr.ObtenerUsuarios((MSSQLSUL.Seguridad.Usuario)Session["Usuario"], vNombre, vEstado);
                griUsuario.DataBind();


            }
            catch (Exception ex)
            {
                MostrarError(ex.Message);
                //throw new Exception(ex.Message);
            }

        }
    }
}