using System;
using System.Collections.Generic;
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
            if (! IsPostBack){
                Table1 = (Table)Session["table1"];
            }
            

        }
        private void agregarProducto()
        {
            TableRow fila = new TableRow();

            TableCell tCell = new TableCell();
            tCell.RowSpan = 5;
            tCell.Text = "Nº";
            fila.Cells.Add(tCell);
            TableCell tCell2 = new TableCell();
            tCell2.RowSpan = 5;
            tCell2.Text = "Imagen";
            fila.Cells.Add(tCell2);
            TableCell tCell3 = new TableCell();
            tCell3.RowSpan = 2;
            tCell3.Text = "Codigo SKU";
            fila.Cells.Add(tCell3);
            TableCell tCell4 = new TableCell();
            tCell4.RowSpan = 5;
            tCell4.Text = "Descripcion";
            fila.Cells.Add(tCell4);
            TableCell tCell5 = new TableCell();
            tCell5.Text = "Detalle";
            fila.Cells.Add(tCell5);
            TableCell tCell6 = new TableCell();
            tCell6.Text = "Costo Unitario";
            fila.Cells.Add(tCell6);
            TableCell tCell7 = new TableCell();
            tCell7.Text = "Cantidad";
            tCell7.RowSpan = 5;
            tCell7.ColumnSpan = 2;
            fila.Cells.Add(tCell7);
            TableCell tCell8 = new TableCell();
            tCell8.Text = "Costo Total";
            fila.Cells.Add(tCell8);
            Table1.Rows.Add(fila);

            TableRow fila2 = new TableRow();

            TableCell tCell21 = new TableCell();
            tCell21.RowSpan = 2;
            tCell21.Text = "Detalle";
            fila2.Cells.Add(tCell21);
            TableCell tCell22 = new TableCell();
            tCell22.RowSpan = 2;
            tCell22.Text = "Costo Unitario";
            fila2.Cells.Add(tCell22);
            TableCell tCell23 = new TableCell();
            tCell23.RowSpan = 2;
            tCell23.Text = "Costo Total";
            fila2.Cells.Add(tCell23);
            Table1.Rows.Add(fila2);


            TableRow fila3 = new TableRow();

            TableCell tCell31 = new TableCell();
            tCell31.RowSpan = 3;
            tCell31.Text = "Proveedor";
            fila3.Cells.Add(tCell31);

            Table1.Rows.Add(fila3);

            TableRow fila4 = new TableRow();

            TableCell tCell41 = new TableCell();
            tCell41.RowSpan = 2;
            tCell41.Text = "Detalle";
            fila4.Cells.Add(tCell41);
            TableCell tCell42 = new TableCell();
            tCell42.RowSpan = 2;
            tCell42.Text = "Costo Unitario";
            fila4.Cells.Add(tCell42);
            TableCell tCell43 = new TableCell();
            tCell43.RowSpan = 2;
            tCell43.Text = "Costo Total";
            fila4.Cells.Add(tCell43);
            Table1.Rows.Add(fila4);
            Session["table1"] = Table1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            agregarProducto();

        }
    }
}