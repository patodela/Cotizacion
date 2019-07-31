using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;
using ProyectoBL.Enum;
using ProyectoDA.Enum;

namespace SistCotizacion
{
    public partial class Proveedor : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
              

                if (!Page.IsPostBack)
                {
                   // GetAllProveedor(TipoCliente.Natural);
                }
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
                    string idCliente = GridListProveedor.DataKeys[row.RowIndex].Value.ToString();
                    string Tipo = (row.FindControl("lblTipo") as Label).Text;
                    Response.Redirect("/IngresoProveedor.aspx?CodPro=" + idCliente +"&Tipo="+ Tipo);
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void GridListProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                
                GridListProveedor.PageIndex = e.NewPageIndex;
                GridListProveedor.DataSource = Session["DataListProveedor"] as DataTable;
                GridListProveedor.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        protected void GridListProveedor_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lblEstado = (Label)e.Row.FindControl("lblEstado");
                LinkButton btnDesactivar = (LinkButton)e.Row.FindControl("BntDesactivar");
                LinkButton BtnActivar = (LinkButton)e.Row.FindControl("BtnActivar");
                if (lblEstado.Text.Equals(Estados.Activo.ToString()))
                {
                    BtnActivar.Visible = false;
                    btnDesactivar.Visible = true;
                }
                else
                {
                    BtnActivar.Visible = true;
                    btnDesactivar.Visible = false;
                }
            }
        }

        protected void BntDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
                {
                   int idCliente = Convert.ToInt32(GridListProveedor.DataKeys[row.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    int tipoCliente = Convert.ToInt32(HFTipoProveedor.Value);
                    var proveedor = new ClienteBL(DataUser);
                    DataTable dtProveedor = new DataTable();
                    dtProveedor = proveedor.UpdateEstado(NombreEntidad.Proveedor, idCliente, Estados.Inactivo);
                    GetAllProveedor((TipoCliente)tipoCliente);
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
                    int idCliente = Convert.ToInt32(GridListProveedor.DataKeys[row.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    int tipoCliente = Convert.ToInt32(HFTipoProveedor.Value);
                    var proveedor = new ClienteBL(DataUser);
                    DataTable dtProveedor = new DataTable();
                    dtProveedor = proveedor.UpdateEstado(NombreEntidad.Proveedor, idCliente, Estados.Activo);
                    GetAllProveedor((TipoCliente)tipoCliente);
                    (this.Master as NavContenido).MostrarMensaje("Accion realizada con exito.");
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        public void GetAllProveedor(TipoCliente _Tipo,string folio = null)
        {
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            var proveedor = new ClienteBL(DataUser);
            DataTable dtProveedor = new DataTable();

            dtProveedor = proveedor.GetAllProveedor(NombreEntidad.Proveedor, _Tipo,folio);
            Session["DataListProveedor"] = dtProveedor;
            GridListProveedor.DataSource = dtProveedor;
            GridListProveedor.DataBind();
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                int tipoCliente = Convert.ToInt32(HFTipoProveedor.Value);
                string numFolio = txtFolio.Text;
                if (!string.IsNullOrEmpty(numFolio))
                {
                    GetAllProveedor((TipoCliente)tipoCliente, numFolio);
                }
                else
                {
                    GetAllProveedor((TipoCliente)tipoCliente);
                }
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }
    }
}