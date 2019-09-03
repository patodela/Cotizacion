using ProyectoBL;
using ProyectoDA.Enum;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;

namespace SistCotizacion
{
    public partial class SearchPersonal : System.Web.UI.Page
    {

        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Session.Remove("PasoLoad");
            Response.Redirect("/EntidadPersonal.aspx");
        }

        protected void GridListPersonal_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lblEstado = (Label)e.Row.FindControl("lblEstado");
                LinkButton btnDesactivar = (LinkButton)e.Row.FindControl("BntDesactivar");
                LinkButton BtnActivar = (LinkButton)e.Row.FindControl("BtnActivar");
                LinkButton BtnEdit = (LinkButton)e.Row.FindControl("btnEditarCell");
                if (lblEstado.Text.Equals(Estados.Activo.ToString()))
                {
                    BtnActivar.Visible = false;
                    btnDesactivar.Visible = true;
                    BtnEdit.Visible = true;
                }
                else
                {
                    BtnActivar.Visible = true;
                    btnDesactivar.Visible = false;
                    BtnEdit.Visible = false;
                }
            }
        }

        protected void GridListPersonal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {

                GridListPersonal.PageIndex = e.NewPageIndex;
                GridListPersonal.DataSource = Session["DataListPersonal"] as DataTable;
                GridListPersonal.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void btnEditarCell_Click(object sender, EventArgs e)
        {
            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
                {
                    string idPersonal = GridListPersonal.DataKeys[row.RowIndex].Value.ToString();
                    Session.Remove("PasoLoad");
                    Response.Redirect("/EntidadClienteEdit.aspx?CodCli=" + idPersonal, true);
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void BntDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
                {
                    int idCliente = Convert.ToInt32(GridListPersonal.DataKeys[row.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    //int tipoCliente = Convert.ToInt32(HFTipoCliente.Value);
                    //var cliente = new ClienteBL(DataUser);
                    //DataTable dtCliente = new DataTable();
                    //dtCliente = cliente.UpdateEstado(NombreEntidad.Cliente, idCliente, Estados.Inactivo);
                    GetAllPersonal();
                    (this.Master as NavContenido).MostrarMensaje("Accion realizada con exito.");
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void BtnActivar_Click(object sender, EventArgs e)
        {

        }

        public void GetAllPersonal(string folio = null)
        {
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            var cliente = new PersonalBL(DataUser);
            DataTable dtcliente = new DataTable();

            dtcliente = cliente.GetAllPersonal(folio);
            Session["DataListPersonal"] = dtcliente;
            GridListPersonal.DataSource = dtcliente;
            GridListPersonal.DataBind();
        }
    }
}