using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoDA;
using System.Data;

namespace SistCotizacion
{
    public partial class IngresoProducto : System.Web.UI.Page
    {
       
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                FillGridviewProducto();
            }
        }

        protected void btnIngresaProd_Click(object sender, EventArgs e)
        {

            try
            {
                if (!FileUploadProducto.HasFile)
                {
                    return;
                }

                string _nombre = txtNombreProducto.Text;
                string _Skuprov1 = txtSkuProveedor1.Text;
                string _Skuprov2 = txtSkuProveedor2.Text;
                byte[] imagenProducto = GetStreamInByteArray(FileUploadProducto.PostedFile.InputStream);

                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                ProductoDA _producto = new ProductoDA(DataUser)
                {
                    operacion = "I",
                    imagen = imagenProducto,
                    nombre = _nombre,
                    skuprov1 = _Skuprov1,
                    skuprov2 = _Skuprov2,
                    id_usuario = DataUser.id_usuario
                };

                _producto.Ingresar(_producto);
                FillGridviewProducto();
                _producto = null;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }


        public byte[] GetStreamInByteArray(Stream _stream)
        {
            int streamLenght = Convert.ToInt32(_stream.Length);
            byte[] Filedata = new byte[streamLenght + 1];
            _stream.Read(Filedata, 0, streamLenght);
            _stream.Close();

            return Filedata;

        }

        public void FillGridviewProducto()
        {
            try
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                ProductoDA _producto = new ProductoDA(DataUser);

                List<ProductoDA> listProd = new List<ProductoDA>();
                _producto.operacion = "S";
                listProd = _producto.Obtener(_producto);
                Session["ListProductos"] = listProd;
                gridProductos.DataSource = listProd;
                gridProductos.DataBind();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        protected void gridProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ProductoDA product = (ProductoDA)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String(product.imagen);
                (e.Row.FindControl("ImageProducto") as Image).ImageUrl = imageUrl;
            }
        }

        protected void btnEditarCell_Click(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
            {

                lblIdProd.Text = row.Cells[0].Text;
                ImageEdicion.ImageUrl = (row.FindControl("ImageProducto") as Image).ImageUrl;//1
                txtNombreEdit.Text = (row.FindControl("Nombre") as Label).Text;//2
                txtSku1Edit.Text = row.Cells[3].Text;
                txtSku2Edit.Text = row.Cells[4].Text;
            }
            PopUpPanelEditProducto.Show();
        }

        protected void btnEditProducto_Click(object sender, EventArgs e)
        {
            try
            {


                string Nombre = txtNombreEdit.Text;
                string sku1 = txtSku1Edit.Text;
                string sku2 = txtSku2Edit.Text;
                int idProdEdit = Convert.ToInt32(lblIdProd.Text);
                byte[] imagenProducto = null;
                if (FileUploadEditProduct.HasFile)
                {
                    imagenProducto = GetStreamInByteArray(FileUploadEditProduct.PostedFile.InputStream);
                }


                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                ProductoDA _producto = new ProductoDA(DataUser)
                {
                    operacion = "U",
                    imagen = imagenProducto,
                    nombre = Nombre,
                    skuprov1 = sku1,
                    skuprov2 = sku2,
                    id_usuario = DataUser.id_usuario,
                    id_producto = idProdEdit
                };

                _producto.Actualizar(_producto);
                PopUpPanelEditProducto.Hide();
                FillGridviewProducto();
                _producto = null;

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        protected void btnDeleteProd_Click(object sender, EventArgs e)
        {
            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer)
                {
                    int idProd = Convert.ToInt32(row.Cells[0].Text);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    ProductoDA _producto = new ProductoDA(DataUser)
                    {
                        operacion = "U",
                        imagen = null,
                        nombre = null,
                        skuprov1 = null,
                        skuprov2 = null,
                        id_usuario = DataUser.id_usuario,
                        id_producto = idProd,
                        activo = false
                    };

                    _producto.Actualizar(_producto);                    
                    FillGridviewProducto();
                    _producto = null;
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }

        protected void gridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridProductos.PageIndex = e.NewPageIndex;
                List<ProductoDA> listProd = new List<ProductoDA>((List<ProductoDA>)Session["ListProductos"]);
                gridProductos.DataSource = listProd;
                gridProductos.DataBind();

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public void FillBuscarByName(string _Name)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            try
            {
                string _Name = txtBuscar.Text;
                List<ProductoDA> listProd  = new List<ProductoDA>((List<ProductoDA>)Session["ListProductos"]);
                listProd = listProd.FindAll(a => a.nombre.Contains(_Name));
                gridProductos.DataSource = listProd;
                gridProductos.DataBind();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            List<ProductoDA> listProd = new List<ProductoDA>((List<ProductoDA>)Session["ListProductos"]);
            txtBuscar.Text = string.Empty;
            gridProductos.DataSource = listProd;
            gridProductos.DataBind();
        }
    }
}