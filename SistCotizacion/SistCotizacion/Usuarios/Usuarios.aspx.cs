using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion.Usuario
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //CargaPanelSolicitud();
                //llenarFiltros();

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
                //MostrarError(ex.Message);
            }
        }

        private void Buscar()
        {
            //    try
            //    {
            //        int numerosolicitud = -1;
            //        String vnumSolicitud = string.IsNullOrEmpty(txtNTickets.Text) ? "0" : txtNTickets.Text;
            //        try // en caso que se a texto controlo el error de conversion y elvio un -1 a bd(no devulve nada)
            //        {
            //            numerosolicitud = string.IsNullOrEmpty(vnumSolicitud) ? 0 : int.Parse(vnumSolicitud);

            //            numerosolicitud = int.Parse(vnumSolicitud);

            //        }
            //        catch (Exception)
            //        {

            //            numerosolicitud = -1;
            //        }

            //        DateTime vtxtFechaInicio = Convert.ToDateTime(txtFechaInicio.Text);
            //        DateTime vtxtfechaFin = Convert.ToDateTime(txtFechaFin.Text);
            //        int vclasificacion = int.Parse(dwlFClasificacion.SelectedValue);
            //        int vEstado = int.Parse(dwlEstado.SelectedValue);
            //        griSolicitudes.DataSource = DAL.Solicitud.SolicitudSel((MSSQLSUL.Seguridad.Usuario)Session["Usuario"], numerosolicitud, vtxtFechaInicio, vtxtfechaFin,
            //                                    vclasificacion, vEstado);
            //        griSolicitudes.DataBind();
            //    }
            //    catch (Exception ex)
            //    {

            //        throw new Exception(ex.Message);
            //    }

            }
        }
}