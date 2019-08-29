using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion.Cotizacion
{
    public partial class CotMercancias : System.Web.UI.Page

    {
        public MSSQLSUL.Seguridad.Usuario UsuarioConectado
        {

            get { return (MSSQLSUL.Seguridad.Usuario)Session["Usuario"]; }
            set { Session["Usuario"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargaInicial();
            }
        }
        private void cargaInicial()
        {
            //lblUsuarioEmisor.Text = UsuarioConectado.NombreUsuario;
            //cotizacion coti = new cotizacion();
            //dtPlazoNacional.Value = DateTime.Now.Date.AddMonths(3).ToString("yyyy/MM/dd");
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            PopUpPanelAgregar.Show();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable tblProductos = cargaGridProductos();
                realizaCalculos(tblProductos);
            }
            catch (Exception ex)
            {

                //mostrar Error
            }
        }
        private DataTable cargaGridProductos()
        {
            try
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
                        TextBox tbox = (TextBox)row.Cells[5].FindControl("txtCantidad");
                        Tbrow["cantidad"] = tbox.Text;
                        Tbrow["um"] = row.Cells[7].Text;
                        Tbrow["vtclp"] = int.Parse(row.Cells[8].Text) * int.Parse(tbox.Text);
                        Tbrow["vtusd"] = decimal.Parse(lblDolar.Text) / decimal.Parse(row.Cells[8].Text);
                        tabla.Rows.Add(Tbrow);
                    }
                }
                gridMercancias.DataSource = tabla;
                gridMercancias.DataBind();
                Session["productos"] = tabla;
                return tabla;
                

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        private void realizaCalculos(DataTable productos)
        {
            int countU = 0;
            float countKg = 0;
            decimal subtotal = 0;
            decimal descuento = 0;
            decimal valDescuento = 0;
            decimal interes = 0;
            decimal total = 0;
            decimal iva = 19;
            decimal valIva = 0;
            decimal Bruto = 0;
            decimal totalGlobal = 0;

            try
            {
                for (int i = 0; i < productos.Rows.Count; i++)
                {
                    if (productos.Rows[i]["um"].ToString() == "U")
                    {
                        countU = countU + int.Parse(productos.Rows[i]["cantidad"].ToString());
                    }
                    if (productos.Rows[i]["um"].ToString() == "KG")
                    {
                        countKg = countKg + float.Parse(productos.Rows[i]["cantidad"].ToString());
                    }
                    subtotal = subtotal + decimal.Parse(productos.Rows[i]["vtclp"].ToString());

                    lblCantU.Text = countU.ToString();
                    lblCantKg.Text = countKg.ToString();
                }
                lblSubtotal.Text = subtotal.ToString();
                descuento = decimal.Parse(lblDescuento.Value) / 100;
                if (descuento == 0)
                {
                    valDescuento = subtotal;
                }
                else
                {
                    valDescuento  = subtotal * descuento;                   
                }
                lblValorAjuste.Text = valDescuento.ToString("0.00");
                total = subtotal + valDescuento;
                lblValNeto.Text = total.ToString("0.00");
                iva = decimal.Parse(lblIva.Value)/100;
                valIva = iva * total;
                lblValorImpuesto.Text = valIva.ToString("0.00");
                Bruto = valIva + total;
                lblValorBruto.Text = Bruto.ToString("0.00");
                interes = decimal.Parse(NumInteres.Value) / 100;

                lblValorInteres.Text = interes.ToString("0.00");
                totalGlobal = decimal.Parse(txbGastosAsum.Text) + interes + Bruto ;
                lblTotalpagar.Text = totalGlobal.ToString("0.00");
                lblTotalpagarUsd.Text = (totalGlobal / decimal.Parse(lblDolar.Text)).ToString("0.00");
                //amotizacion /impuestos
                lblImpuesto2.Text = lblDescuento.Value.ToString()+ "%";
                lblInteres2.Text = NumInteres.Value.ToString()+"%";


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }


        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            DataTable tabla = (DataTable)Session["productos"];
            realizaCalculos(tabla);
        }

        //protected void dwlOperacion_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
                
        //        if (dwlOperacion.SelectedValue == "2")//Afecta -paga iva 19% 
        //        {
        //            txtMontoFacturable.Text = (decimal.Parse(lblTotalClp.Text) * decimal.Parse("0.19")).ToString();
        //        }
        //        else {
        //            txtMontoFacturable.Text = "0";
        //        }
        //        //afecta solo se refleja en monto facturable?
        //        //luego calcular resto de campos
        //    }
        //    catch (Exception ex)
        //    {

        //        throw new Exception(ex.Message);
        //    }
        //}

      

        protected void txtIdeal_leave(object sender, EventArgs e)
        {
            try
            {
                lblIdealUsd.Text = (decimal.Parse(txtIdeal.Text) / decimal.Parse(lblDolar.Text)).ToString("0.00");
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        

        protected void txtMaximo_leave(object sender, EventArgs e)
        {
            try
            {
                lblMaximoUsd.Text = (decimal.Parse(txtMaximo.Text) / decimal.Parse(lblDolar.Text)).ToString("0.00");
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

      
        //protected void txtJustCompradorClp_Leave(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        lblJustCompradorUsd.Text = (decimal.Parse(txtJustCompradorClp.Text) / decimal.Parse(lblDolar.Text)).ToString("0.00");
        //        lblTotalGastosCLP.Text = (decimal.Parse(txtJustCompradorClp.Text)+(decimal.Parse(txtVenCompradorClp.Text))+decimal.Parse(txtjusVendedorClp.Text)).ToString("0.00");
        //        lblTotalGastosUSD.Text = (decimal.Parse(lblJustCompradorUsd.Text) + (decimal.Parse(lblVenCompradorUsd.Text)) + decimal.Parse(lblJusVenUSD.Text)).ToString("0.00");
        //    }
        //    catch (Exception ex)
        //    {

        //        throw new Exception(ex.Message);
        //    }
        //}

        //protected void txtVenCompradorClp_Leave(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        lblVenCompradorUsd.Text = (decimal.Parse(txtVenCompradorClp.Text) / decimal.Parse(lblDolar.Text)).ToString("0.00");
        //        lblTotalGastosCLP.Text = (decimal.Parse(txtJustCompradorClp.Text) + (decimal.Parse(txtVenCompradorClp.Text)) + decimal.Parse(txtjusVendedorClp.Text)).ToString("0.00");
        //        lblTotalGastosUSD.Text = (decimal.Parse(lblJustCompradorUsd.Text) + (decimal.Parse(lblVenCompradorUsd.Text)) + decimal.Parse(lblJusVenUSD.Text)).ToString("0.00");
        //    }
        //    catch (Exception ex)
        //    {

        //        throw new Exception(ex.Message);
        //    }
        //}

        //protected void txtjusVendedorClp_Leave(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        lblJusVenUSD.Text = (decimal.Parse(txtjusVendedorClp.Text) / decimal.Parse(lblDolar.Text)).ToString("0.00");
        //        lblTotalGastosCLP.Text = (decimal.Parse(txtJustCompradorClp.Text) + (decimal.Parse(txtVenCompradorClp.Text)) + decimal.Parse(txtjusVendedorClp.Text)).ToString("0.00");
        //        lblTotalGastosUSD.Text = (decimal.Parse(lblJustCompradorUsd.Text) + (decimal.Parse(lblVenCompradorUsd.Text)) + decimal.Parse(lblJusVenUSD.Text)).ToString("0.00");

        //    }
        //    catch (Exception ex)
        //    {

        //        throw new Exception(ex.Message);
        //    }
            
        //}

        protected void dwlForma2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (dwlForma2.SelectedValue == "1")
                {
                    dwlForma.SelectedValue = "1";
                    dwlCuotas.SelectedValue = "1";
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        protected void dwlCuotas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string forma = dwlForma.SelectedItem.Text;
                int cuotas = int.Parse(dwlCuotas.SelectedValue.ToString());
                cargaGrillaCuotas(forma, cuotas);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        private void cargaGrillaCuotas(string forma, int cuotas) {
            try
            {
                DateTime fechaCuotas = DateTime.Now.Date;
                int cantidad= 0;
                decimal valorTotalCuotas = decimal.Parse(lblTotalpagar.Text) / cuotas;
                DataTable dtCuotas = new DataTable();
                dtCuotas.Columns.Add("id");
                dtCuotas.Columns.Add("Fecha");
                dtCuotas.Columns.Add("Total");
                dtCuotas.Columns.Add("TotalUSD");
                

                switch (forma)
                {
                    case "Semanal":
                        cantidad = 7;//dias
                        break;
                    case "Mensual":
                        cantidad = 1;//mes
                        break;
                    case "Bimestral":
                        cantidad = 2;//mes
                        break;
                    case "Trimestral":
                        cantidad = 3;//mes
                        break;
                    case "Semestral":
                        cantidad = 6;//mes
                        break;
                    case "Anual":
                        cantidad = 12;//mes
                        break;
                    case "Bi - Anual":
                        cantidad = 24;//meses
                        break;                    
                    default:
                        cantidad = 1;
                        break;
                }
                for (int i = 0; i < cuotas; i++)
                {
                    DataRow Tbrow = dtCuotas.NewRow();                                        
                    Tbrow["id"] = (i+1).ToString();
                    if (forma == "Semanal") {
                        fechaCuotas = fechaCuotas.AddDays(7);
                        Tbrow["Fecha"] = fechaCuotas.ToString("yyyy/MM/dd");
                    }
                    else 
                    {
                        fechaCuotas = fechaCuotas.AddMonths(cantidad);
                        Tbrow["Fecha"] = fechaCuotas.ToString("yyyy/MM/dd");
                    }

                    Tbrow["Total"] = valorTotalCuotas.ToString("0.00");
                    Tbrow["TotalUSD"] = (valorTotalCuotas / decimal.Parse(lblDolar.Text)).ToString("0.00");
                    dtCuotas.Rows.Add(Tbrow);
                }
                grvCuotas.DataSource = dtCuotas;
                grvCuotas.DataBind();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}