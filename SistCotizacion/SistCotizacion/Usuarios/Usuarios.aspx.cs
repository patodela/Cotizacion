using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoDA;
using SistCotizacion.Master;

namespace SistCotizacion.Usuario
{
    public partial class Usuarios : PContenidoPostLogin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Buscar();
                //llenarFiltros();
                //txtNombreUsuario.text
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
                //int numerosolicitud = -1;
                //String vnumSolicitud = string.IsNullOrEmpty(txtNTickets.Text) ? "0" : txtNTickets.Text;

                //numerosolicitud = string.IsNullOrEmpty(vnumSolicitud) ? 0 : int.Parse(vnumSolicitud);

                //numerosolicitud = int.Parse(vnumSolicitud);             

                //DateTime vtxtFechaInicio = Convert.ToDateTime(txtFechaInicio.Text);
                //DateTime vtxtfechaFin = Convert.ToDateTime(txtFechaFin.Text);
                //int vclasificacion = int.Parse(dwlFClasificacion.SelectedValue);
                //string vNombre = txtNombreUsuario.Text; 
                //int vEstado = int.Parse(dwlEstado.SelectedValue);
                //UsuarioDA usr = new UsuarioDA();
                ////griUsuario.DataSource = MSSQLSUL.ProyectoDaDAL.Solicitud.SolicitudSel((MSSQLSUL.Seguridad.Usuario)Session["Usuario"], numerosolicitud, vtxtFechaInicio, vtxtfechaFin,
                ////                            vclasificacion, vEstado);
                //griUsuario.DataSource = usr.ObtenerUsuarios((MSSQLSUL.Seguridad.Usuario)Session["Usuario"], vNombre, vEstado);
                //griUsuario.DataBind();


            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }
     
    }    
}