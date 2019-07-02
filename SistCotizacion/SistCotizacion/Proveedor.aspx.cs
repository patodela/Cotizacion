using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion
{
    public partial class Proveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("1");
            dt.Columns.Add("2");
            dt.Columns.Add("3");
            dt.Columns.Add("4");
            dt.Columns.Add("5");


            DataRow dr = dt.NewRow();
            dr[0] = 1;
            dr[1] = "XXX22211X";          
            dr[2] = "Fantasilandia";
            dr[3] = "1112222";
            dr[4] = "La diversion Total";
            dt.Rows.Add();
            GridListProveedor.DataSource = dt;
            GridListProveedor.DataBind();
        }
    }
}