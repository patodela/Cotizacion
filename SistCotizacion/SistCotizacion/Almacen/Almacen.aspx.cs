using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion.Mantenedores
{
    public partial class Almacen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarSolicitud_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnlimpiarSolicitud_Click(object sender, EventArgs e)
        {

        }

        protected void btnagregarAnexo_Click(object sender, EventArgs e)
        {

        }

        protected void btnEditarSolicitud_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarAnexo_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerAnexo_Click(object sender, EventArgs e)
        {

        }

        private void Buscar()
        {
            try
            {
                int numerosolicitud = -1;
                String vnumSolicitud = string.IsNullOrEmpty(txtNTickets.Text) ? "0" : txtNTickets.Text;
                try // en caso que se a texto controlo el error de conversion y elvio un -1 a bd(no devulve nada)
                {
                    numerosolicitud = string.IsNullOrEmpty(vnumSolicitud) ? 0 : int.Parse(vnumSolicitud);

                    numerosolicitud = int.Parse(vnumSolicitud);

                }
                catch (Exception)
                {

                    numerosolicitud = -1;
                }

                DateTime vtxtFechaInicio = Convert.ToDateTime(txtFechaInicio.Text);
                DateTime vtxtfechaFin = Convert.ToDateTime(txtFechaFin.Text);
                int vclasificacion = int.Parse(dwlFClasificacion.SelectedValue);
                int vEstado = int.Parse(dwlEstado.SelectedValue);
               // griSolicitudes.DataSource = DAL.Solicitud.SolicitudSel((WayPro.MSSQLSUL.Seguridad.Usuario)Session["Usuario"], numerosolicitud, vtxtFechaInicio, vtxtfechaFin,
                    //                        vclasificacion, vEstado);
                griSolicitudes.DataBind();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }
    }
}