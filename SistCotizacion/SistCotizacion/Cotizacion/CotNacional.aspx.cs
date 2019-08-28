using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace SistCotizacion.Cotizacion
{
    public partial class CotNacional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
            else {
               
            }
        }

     

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            PopUpPanelAgregar.Show();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
           
            DataTable tabla = new DataTable();
            tabla.Columns.Add("id");
            tabla.Columns.Add("sku");
            tabla.Columns.Add("descripcion");
            tabla.Columns.Add("cantidad");
            tabla.Columns.Add("um");
            tabla.Columns.Add("vtclp");
            tabla.Columns.Add("vtusd");
            tabla.Columns.Add("vt$");
            
            for (int i = 0; i < grvAddProd.Rows.Count; i++)
            {
                DataRow Tbrow = tabla.NewRow();
                GridViewRow row = grvAddProd.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("chkSelect")).Checked;

                if (isChecked)
                {

                    Tbrow["id"] = row.Cells[1].Text;                    
                    Tbrow["sku"] = row.Cells[3].Text;
                    Tbrow["descripcion"] = row.Cells[4].Text;
                    TextBox tbox = (TextBox) row.Cells[5].FindControl("txtCantidad");
                    Tbrow["cantidad"] = tbox.Text;
                    Tbrow["um"]             = row.Cells[7].Text;
                    Tbrow["vtclp"]          = row.Cells[8].Text;
                    tabla.Rows.Add(Tbrow);                    
                }
            }
            gridMercancias.DataSource = tabla;
            gridMercancias.DataBind();
        }
    }
}