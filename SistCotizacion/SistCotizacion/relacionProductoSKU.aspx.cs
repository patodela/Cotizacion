using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoDA;

namespace SistCotizacion
{
    public partial class relacionProductoSKU : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GVProductos.DataSource = SqlDataSourceBuscaProductosByName;
                GVProductos.DataBind();
                GridSku.DataSource = SqlDataSourceSelectSKUGrid;
                GridSku.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GVProductos.DataSource = SqlDataSourceBuscaProductosByName;
            GVProductos.DataBind();
        }

        protected void GVProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var bytes = (byte[])((DataRowView)e.Row.DataItem)["Imagen"];
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                (e.Row.FindControl("ImageProducto") as Image).ImageUrl = imageUrl;
            }
        }

        protected void GVProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblID.Text = GVProductos.SelectedRow.Cells[1].Text;
            lblNomProducto.Text = ((Label)GVProductos.SelectedRow.FindControl("Nombre")).Text;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int idProducto = Convert.ToInt32(lblID.Text);
                int idOrg = Convert.ToInt32(cmboOrganizador.SelectedValue);
                int idFam = Convert.ToInt32(cmboFamilia.SelectedValue);
                int idgrupo = Convert.ToInt32(cmboGrupos.SelectedValue);
                int idArticulo = Convert.ToInt32(cmboArticulos.SelectedValue);
                int idCar1 = Convert.ToInt32(cmboCaracteristica1.SelectedValue);
                int idCar2 = Convert.ToInt32(cmboCaracteristica2.SelectedValue);
                int idCar3 = Convert.ToInt32(cmboCaracteristica3.SelectedValue);
                int comb1 = Convert.ToInt32(CmboIdentificacion1.SelectedValue);
                int comb2 = Convert.ToInt32(CmboIdentificacion2.SelectedValue);



                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                ProductoCombinacionSKUDA combinacionSku = new ProductoCombinacionSKUDA(DataUser)
                {
                    operacion = "I",
                    id_producto = idProducto,
                    id_org = idOrg,
                    id_fam = idFam,
                    id_grupo = idgrupo,
                    id_articulo = idArticulo,
                    id_car1 = idCar1,
                    id_car2 = idCar2,
                    id_car3 = idCar3,
                    id_comb1 = comb1,
                    id_comb2 = comb2,
                    id_usuario = DataUser.id_usuario
                };
                combinacionSku.IngresarSKU(combinacionSku);
                GridSku.DataSource = SqlDataSourceSelectSKUGrid;
                GridSku.DataBind();
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GridSku_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscarSKU_Click(object sender, EventArgs e)
        {

        }
    }
}