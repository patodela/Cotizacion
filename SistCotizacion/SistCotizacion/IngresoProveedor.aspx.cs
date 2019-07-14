using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;
using ProyectoDA.Model;
using ProyectoBL.FichaRegistros;

namespace SistCotizacion
{
    public partial class EntidadProveedor : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var folio = new GeneraFolioBL(DataUser);
                string numeroFolio = folio.GetFolioFichaProveedor(8, true);
                TxtFechaEmision.Text = DateTime.Now.ToString("dd/MM/yyyy");


            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Proveedor.aspx");
        }

        protected void btnRegistroEntidadProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var Cliente = new ClienteBL(DataUser);
                int tipoCliente = Convert.ToInt32(hdTipoProveedor.Value);

                var folio = new GeneraFolioBL(DataUser);
                string numeroFolio = folio.GetFolioFichaProveedor(8, false);

   
                Direccion _dir = new Direccion();
                Cliente _cli = new Cliente();
                Informacion_Empresa _infoEmpresa = new Informacion_Empresa();
                Direccion _dirEmpresa = new Direccion();
                Informacion_Facturacion _infoFact = new Informacion_Facturacion();
                if (tipoCliente.Equals(Convert.ToInt32(TipoCliente.Natural)))
                {
                    _dir = new Direccion
                    {
                        pais = txtNatPais.Text,
                        region = txtNatRegion.Text,
                        ciudad = txtNatCiudad.Text,
                        direccion = txtNatDireccion.Text,
                        zip = txtNatZip.Text
                    };

                    _cli = new Cliente
                    {
                        tipo_cliente = tipoCliente,
                        codigo_folio = numeroFolio,
                        nombre = txtNatNombre.Text,
                        rut = txtNatRut.Text,
                        area_profesion = txtNatProfesion.Text,
                        identidad = cmboNatIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(txtNatFechaNac.Text),
                        contacto1 = txtNatFono.Text,
                        contacto2 = txtNatEmail.Text
                    };
                    _dir = Cliente.AddDireccion(_dir);
                    _cli.id_direcion = _dir.id_direccion;
                    _cli = Cliente.AddCliente(_cli);

                }
                else
                {
                    _dir = new Direccion
                    {
                        pais = txtPais.Text,
                        region = txtRegion.Text,
                        ciudad = txtCiudad.Text,
                        direccion = TxtDirección.Text,
                        zip = txtCodigoPostal.Text
                    };

                    _cli = new Cliente
                    {
                        tipo_cliente = tipoCliente,
                        codigo_folio = numeroFolio,
                        nombre = TxtRepreNombre.Text,
                        rut = TxtRepreRutID.Text,
                        area_profesion = TxtRepreProfesion.Text,
                        identidad = cmboIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(TxtRepreCumple.Text),
                        contacto1 = TxtRepreTelefono.Text,
                        contacto2 = TxtRepreEmail.Text
                    };

                    _infoEmpresa = new Informacion_Empresa
                    {
                        rut = TxtInfCompIDRUT.Text,
                        razon_social = TxtInfCompRazonSocial.Text,
                        nombre_fantasia = TxtInfCompNombreFantasia.Text,
                        fecha_fundacion = Convert.ToDateTime(TxtInfCompFechaFundacion.Text),
                        pagina_web = TxtInfCompPaginaWeb.Text,
                        contacto_corp1 = TxtInfCompTelefono.Text,
                        contacto_corp2 = TxtInfCompEmail.Text
                    };

                    _dirEmpresa = new Direccion
                    {
                        pais = TxtFactPais.Text,
                        region = TxtFactEstadoRegion.Text,
                        ciudad = TxtFactCiudad.Text,
                        direccion = TxtFactDir.Text,
                        zip = TxtFactCodPostal.Text
                    };

                    _infoFact = new Informacion_Facturacion
                    {
                        nombre_cuenta = txtCtaFactNombre.Text,
                        rut = txtCtaFactRUTID.Text,
                        banco = txtCtaFactBanco.Text,
                        tipo_cuenta = txtCtaFactTipoCuenta.Text,
                        numero_cuenta = txtCtaFactNumCta.Text,
                        correo_confirmacion = txtCtaFactEmail.Text
                    };


                     _dir = Cliente.AddDireccion(_dir);
                    _cli.id_direcion = _dir.id_direccion;

                    _dirEmpresa = Cliente.AddDireccion(_dirEmpresa);
                    _infoFact.id_direccion = _dirEmpresa.id_direccion;

                    _infoEmpresa = Cliente.AddInfoEmpresa(_infoEmpresa);
                    _cli.id_info_empresa = _infoEmpresa.id;

                    _infoFact = Cliente.AddInfoFacturacion(_infoFact);
                    _cli.id_info_factura = _infoFact.id;

                    _cli = Cliente.AddCliente(_cli);

                    (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");


                }         
                
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar registro", "Error", ex);

            }
        }
    }
}