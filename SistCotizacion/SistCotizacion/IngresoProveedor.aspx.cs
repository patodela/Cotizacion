using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;
using ProyectoDA.Model;
using ProyectoBL.Enum;
using ProyectoBL.Utilidades;

namespace SistCotizacion
{
    public partial class EntidadProveedor : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;



        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var folio = new GeneraFolioBL(DataUser);
                var numeroFolio = folio.GetFolioFichaProveedor(8, true);
                FolioDoc.Text = numeroFolio.cod_folio;
                TxtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

                var CodProd = Request.QueryString["CodPro"];
                var Tipo = Request.QueryString["Tipo"];
                if (!string.IsNullOrEmpty(CodProd))
                {
                    hdCodProv.Value = CodProd;
                    hdTipoProveedor.Value = Tipo;
                    FillEditCliente(Convert.ToInt32(Tipo), Convert.ToInt32(CodProd));
                }
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
                var CodProd = Request.QueryString["CodPro"];
                var HandleEdit = string.IsNullOrEmpty(CodProd) ? false : true;
                var folio = new GeneraFolioBL(DataUser);
                var numeroFolio = folio.GetFolioFichaProveedor(8, false);

   
                Direccion _dir = new Direccion();
                Cliente _cli = new Cliente();
                Informacion_Empresa _infoEmpresa = new Informacion_Empresa();
                Direccion _dirFacturacion = new Direccion();
                Informacion_Facturacion _infoFact = new Informacion_Facturacion();
                if (tipoCliente.Equals(Convert.ToInt32(TipoCliente.Natural)))
                {
                    _dirFacturacion = new Direccion
                    {
                        pais = txtNatPais.Text,
                        region = txtNatRegion.Text,
                        ciudad = txtNatCiudad.Text,
                        direccion = txtNatDireccion.Text,
                        zip = txtNatZip.Text,
                        giro_actividad = TxtNatGiroActividad.Text
                        
                    };

                    _cli = new Cliente
                    {
                        tipo_cliente = tipoCliente,
                        codigo_folio = numeroFolio.idFolio,
                        nombre = txtNatNombre.Text,
                        rut = txtNatRut.Text,
                        area_profesion = txtNatProfesion.Text,
                        identidad = cmboNatIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(txtNatFechaNac.Text),
                        contacto1 = txtNatFono.Text,
                        contacto2 = txtNatEmail.Text,
                        NombreEntidad =NombreEntidad.Proveedor.ToString()
                    };

                 

                    _infoFact = new Informacion_Facturacion
                    {
                        nombre_cuenta = txtCtaFactNatNombre.Text,
                        rut = txtCtaFactNatRUT.Text,
                        banco = txtCtaFactNatBanco.Text,
                        tipo_cuenta = txtCtaFactNatTipoCta.Text,
                        numero_cuenta = txtCtaFactNatNumCta.Text,
                        correo_confirmacion = txtCtaFactNatEmailConfirm.Text
                    };

                    if (HandleEdit)
                    {
                        var OldEdit = (Direccion)Session["DireccionEdit"];
                        _dirFacturacion.id_direccion = Convert.ToInt32(hdIdDireccionFacturacion.Value);
                        if (Extentions.CompareObject(OldEdit,_dirFacturacion))
                        {
                            Cliente.UpdateDireccion(_dirFacturacion);
                        }

                    }else
                    {
                        _dirFacturacion = Cliente.AddDireccion(_dirFacturacion);
                        //_cli.id_direcion = _dirFacturacion.id_direccion;
                        _infoFact.id_direccion = _dirFacturacion.id_direccion;
                        _infoFact = Cliente.AddInfoFacturacion(_infoFact);
                        _cli.id_info_factura = _infoFact.id;
                        _cli = Cliente.AddCliente(_cli);
                        //(this.Master as NavContenido).MostrarMensajeRedirect("Datos ingresados correctamente.", "/Proveedor.aspx");
                        (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
                    }
                    
                    

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
                        codigo_folio = numeroFolio.idFolio,
                        nombre = TxtRepreNombre.Text,
                        rut = TxtRepreRutID.Text,
                        area_profesion = TxtRepreProfesion.Text,
                        identidad = cmboIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(TxtRepreCumple.Text),
                        contacto1 = TxtRepreTelefono.Text,
                        contacto2 = TxtRepreEmail.Text,
                        NombreEntidad = NombreEntidad.Proveedor.ToString()
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

                    _dirFacturacion = new Direccion
                    {
                        pais = TxtFactPais.Text,
                        region = TxtFactEstadoRegion.Text,
                        ciudad = TxtFactCiudad.Text,
                        direccion = TxtFactDir.Text,
                        zip = TxtFactCodPostal.Text,
                        giro_actividad = TxtFactGiroActividad.Text
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

                    _dirFacturacion = Cliente.AddDireccion(_dirFacturacion);
                    _infoFact.id_direccion = _dirFacturacion.id_direccion;

                    _infoEmpresa = Cliente.AddInfoEmpresa(_infoEmpresa);
                    _cli.id_info_empresa = _infoEmpresa.id;

                    _infoFact = Cliente.AddInfoFacturacion(_infoFact);
                    _cli.id_info_factura = _infoFact.id;

                    _cli = Cliente.AddCliente(_cli);

                    (this.Master as NavContenido).MostrarMensajeRedirect("Datos ingresados correctamente.", "/Proveedor.aspx");

                }

            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar registro", "Error", ex);

            }
        }

        public void FillEditCliente(int _tipo,int idRegistro)
        {
            try
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var Cliente = new ClienteBL(DataUser);
                Cliente _ClienteData = new Cliente();
                _ClienteData = Cliente.GetClienteById(idRegistro);
                var _Folio = new GeneraFolioBL(DataUser);
                var folioData = _Folio.GetFolioFichaById(_ClienteData.codigo_folio);
                var InfoFacturacion = Cliente.GetInfoFacturacionById(_ClienteData.id_info_factura);
                var DirFacturacion = Cliente.GetDireccionById(InfoFacturacion.id_direccion.Value);
                Session["DireccionEdit"] = DirFacturacion;

                #region Informacion del documento
                FolioDoc.Text = folioData.cod_folio;
                TxtFechaEmision.Text = _ClienteData.fecha_emision.ToString("yyyy-MM-dd");
                CantActualizacion.Text = _ClienteData.actualizaciones.ToString();
                TxtFechaActualizacion.Text = _ClienteData.fecha_actualizacion.ToString("yyyy-MM-dd");
                #endregion


                if (_tipo == (int)TipoCliente.Natural)
                {

                    #region Informacion del Proveedor  
                    hdIdCliente.Value = _ClienteData.id.ToString();
                    txtNatNombre.Text = _ClienteData.nombre;
                    txtNatProfesion.Text = _ClienteData.area_profesion;
                    txtNatRut.Text = _ClienteData.rut;
                    cmboNatIdentidad.Text = _ClienteData.identidad;
                    txtNatFechaNac.Text = _ClienteData.fecha_nacimiento.Value.ToString("yyyy-MM-dd");
                    txtNatFono.Text = _ClienteData.contacto1;
                    txtNatEmail.Text = _ClienteData.contacto2;
                    #endregion

                    #region Direccion Facturacion
                    hdIdDireccionFacturacion.Value = DirFacturacion.id_direccion.ToString();
                    txtNatPais.Text = DirFacturacion.pais;
                    txtNatRegion.Text = DirFacturacion.region;
                    txtNatCiudad.Text = DirFacturacion.ciudad;
                    txtNatDireccion.Text = DirFacturacion.direccion;
                    txtNatZip.Text = DirFacturacion.zip;
                    TxtNatGiroActividad.Text = DirFacturacion.giro_actividad;
                    #endregion

                    #region Cuenta Facturacion
                    txtCtaFactNatNombre.Text = InfoFacturacion.nombre_cuenta;
                    txtCtaFactNatRUT.Text = InfoFacturacion.rut;
                    txtCtaFactNatBanco.Text = InfoFacturacion.banco;
                    txtCtaFactNatTipoCta.Text = InfoFacturacion.tipo_cuenta;
                    txtCtaFactNatNumCta.Text = InfoFacturacion.numero_cuenta;
                    txtCtaFactNatEmailConfirm.Text = InfoFacturacion.correo_confirmacion;

                    #endregion

                    #region Datos Emisor
                    DatosEmisor.Text = "Folio " + folioData.cod_folio
                                     + "; " + DataUser.cod_usuario
                                     + "; " + DataUser.NombreUsuario
                                     //+ "; " + Cargo
                                     + "; " + _ClienteData.fecha_emision.ToString("yyyy-MM-dd hh:mm:ss");

                    #endregion

                 

                }
                else
                {

                }


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al obtener registros de la Ficha", "Error", ex);
            }
        }
    }
}