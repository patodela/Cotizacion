using ProyectoBL;
using ProyectoBL.Enum;
using ProyectoDA.Enum;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion
{
    public partial class SearchCliente : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                int tipoCliente = Convert.ToInt32(HFTipoCliente.Value);
                string numFolio = txtFolio.Text;
                if (!string.IsNullOrEmpty(numFolio))
                {
                    GetAllCliente((TipoCliente)tipoCliente, numFolio);
                }
                else
                {
                    GetAllCliente((TipoCliente)tipoCliente);
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void btnIngresarProveedor_Click(object sender, EventArgs e)
        {
            Session.Remove("PasoLoad");
            Response.Redirect("/EntidadCliente.aspx");
        }

        protected void GridListCliente_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void GridListCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {

                GridListCliente.PageIndex = e.NewPageIndex;
                GridListCliente.DataSource = Session["DataListCliente"] as DataTable;
                GridListCliente.DataBind();
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
                    string idCliente = GridListCliente.DataKeys[row.RowIndex].Value.ToString();
                    string Tipo = (row.FindControl("lblTipo") as Label).Text;
                    Tipo = Tipo.Equals("Natural") ? "1" : "2";
                    Session.Remove("PasoLoad");
                    Response.Redirect("/EntidadCliente.aspx?CodCli=" + idCliente + "&Tipo=" + Tipo, true);
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
                    int idCliente = Convert.ToInt32(GridListCliente.DataKeys[row.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    int tipoCliente = Convert.ToInt32(HFTipoCliente.Value);
                    var cliente = new ClienteBL(DataUser);
                    DataTable dtCliente = new DataTable();
                    dtCliente = cliente.UpdateEstado(NombreEntidad.Cliente, idCliente, Estados.Inactivo);
                    GetAllCliente((TipoCliente)tipoCliente);
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
            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
                {
                    int idCliente = Convert.ToInt32(GridListCliente.DataKeys[row.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    int tipoCliente = Convert.ToInt32(HFTipoCliente.Value);
                    var cliente = new ClienteBL(DataUser);
                    DataTable dtCliente = new DataTable();
                    dtCliente = cliente.UpdateEstado(NombreEntidad.Cliente, idCliente, Estados.Activo);
                    GetAllCliente((TipoCliente)tipoCliente);
                    (this.Master as NavContenido).MostrarMensaje("Accion realizada con exito.");
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }
        public void GetAllCliente(TipoCliente _Tipo, string folio = null)
        {
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            var cliente = new ClienteBL(DataUser);
            DataTable dtcliente = new DataTable();

            dtcliente = cliente.GetAllProveedor(NombreEntidad.Cliente, _Tipo, folio);
            Session["DataListCliente"] = dtcliente;
            GridListCliente.DataSource = dtcliente;
            GridListCliente.DataBind();
        }
    }
}