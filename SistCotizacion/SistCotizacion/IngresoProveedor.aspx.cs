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
using ClosedXML.Excel;
using System.IO;

namespace SistCotizacion
{
    public partial class EntidadProveedor : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;



        protected void Page_Load(object sender, EventArgs e)
        {
            TxtInfCompFechaFundacion.Attributes.Add("readonly", "readonly");
            txtNatFechaNac.Attributes.Add("readonly", "readonly");
            var pasoLoad = Convert.ToInt16(Session["PasoLoad"]);
            if (!IsPostBack && pasoLoad == 0)
            {
                Session["PasoLoad"] = 1;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var folio = new GeneraFolioBL(DataUser);
                var numeroFolio = folio.GetFolioFicha(3,8, true);
                FolioDoc.Text = numeroFolio.cod_folio;
                TxtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

                var CodProd = Request.QueryString["CodPro"];
                var Tipo = Request.QueryString["Tipo"];
                if (!string.IsNullOrEmpty(CodProd))
                {
                    hdCodProv.Value = CodProd;
                    hdTipoProveedor.Value = Tipo;
                    FillEditCliente(Convert.ToInt32(Tipo), Convert.ToInt32(CodProd));
                    btnExport.Visible = true;
                }
            }



        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("PasoLoad");
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
                var EditProveedor = string.IsNullOrEmpty(CodProd) ? false : true;
                var folio = new GeneraFolioBL(DataUser);
                var numeroFolio = new Folio();
                bool GeneroActualizacion = false;
                if (!EditProveedor)
                {
                    numeroFolio = folio.GetFolioFicha(3,8, false);
                }
                

   
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
                        id_tipo_cliente = tipoCliente,
                        id_codigo_folio = numeroFolio.idFolio,
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

                    if (EditProveedor)
                    {
                        var OldDireccionEdit = (Direccion)Session["DireccionFacturacionEdit"];
                        _dirFacturacion.id_direccion = Convert.ToInt32(hdIdDireccionFacturacion.Value);
                        if (Extentions.CompareObject(OldDireccionEdit, _dirFacturacion))
                        {
                            if (!Cliente.UpdateDireccion(_dirFacturacion))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dirFacturacion.id_direccion.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }                           
                        }
                        var OldClienteEdit = (Cliente)Session["ClienteEdit"];
                        _cli.id = Convert.ToInt32(hdIdCliente.Value);
                        if (Extentions.CompareObject(OldClienteEdit, _cli))
                        {
                            if (!Cliente.UpdateCliente(_cli))
                            {
                                throw new Exception("No se pudo actualizar registro Cliente Id: " + _cli.id.ToString());
                            }
                        }
                        var OldInfoFacturacionEdit = (Informacion_Facturacion)Session["InfoFacturacionEdit"];
                        _infoFact.id = Convert.ToInt32(hdIdInfoFactura.Value);
                        if (Extentions.CompareObject(OldInfoFacturacionEdit, _infoFact))
                        {
                            if (!Cliente.UpdateInfoFacturacion(_infoFact))
                            {
                                throw new Exception("No se pudo actualizar registro Informacion de Facturacion Id: " + _cli.id.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }
                        }

                        if (GeneroActualizacion)
                        {
                            Cliente.UpdateContadorActualizacion(_cli.id);
                        }

                        (this.Master as NavContenido).MostrarMensaje("Datos Actualizados correctamente.");
                       // Session.Remove("PasoLoad");

                    }
                    else
                    {
                        _dirFacturacion = Cliente.AddDireccion(_dirFacturacion);
                        //_cli.id_direcion = _dirFacturacion.id_direccion;
                        _infoFact.id_direccion = _dirFacturacion.id_direccion;
                        _infoFact = Cliente.AddInfoFacturacion(_infoFact);
                        _cli.id_info_factura = _infoFact.id;
                        _cli = Cliente.AddCliente(_cli);
                        //(this.Master as NavContenido).MostrarMensajeRedirect("Datos ingresados correctamente.", "/Proveedor.aspx");
                        (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
                       // Session.Remove("PasoLoad");
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
                        id_tipo_cliente = tipoCliente,
                        id_codigo_folio = numeroFolio.idFolio,
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


                    if (EditProveedor)
                    {
                        var OldDireccionEdit = (Direccion)Session["DirClienteEdit"];
                        _dir.id_direccion = Convert.ToInt32(hdIdDireccion.Value);
                        if (Extentions.CompareObject(OldDireccionEdit, _dir))
                        {
                            if (!Cliente.UpdateDireccion(_dir))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dir.id_direccion.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }
                        }
                        var OldDireccionFactEdit = (Direccion)Session["DireccionFacturacionEdit"];
                        _dirFacturacion.id_direccion = Convert.ToInt32(hdIdDireccionFacturacion.Value);
                        if (Extentions.CompareObject(OldDireccionFactEdit, _dirFacturacion))
                        {
                            if (!Cliente.UpdateDireccion(_dirFacturacion))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dirFacturacion.id_direccion.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }
                        }

                        var OldInfoEmpresa = (Informacion_Empresa)Session["InfoEmpresaEdit"];
                        _infoEmpresa.id = Convert.ToInt32(hdIdInfoEmpresa.Value);                        
                        if (Extentions.CompareObject(OldInfoEmpresa, _infoEmpresa))
                        {
                            if (!Cliente.UpdateInfoEmpresa(_infoEmpresa))
                            {
                                throw new Exception("No se pudo actualizar registro Informacion empresa Id: " + _infoEmpresa.id.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }

                        }
                        var OldInfoFacturacionEdit = (Informacion_Facturacion)Session["InfoFacturacionEdit"];
                        _infoFact.id = Convert.ToInt32(hdIdInfoFactura.Value);
                        
                        if (Extentions.CompareObject(OldInfoFacturacionEdit, _infoFact))
                        {
                            if (!Cliente.UpdateInfoFacturacion(_infoFact))
                            {
                                throw new Exception("No se pudo actualizar registro Informacion de Facturacion Id: " + _cli.id.ToString());
                            }
                            else
                            {
                                GeneroActualizacion = true;
                            }
                        }
                        var OldClienteEdit = (Cliente)Session["ClienteEdit"];
                        _cli.id = Convert.ToInt32(hdIdCliente.Value);                        
                        if (Extentions.CompareObject(OldClienteEdit, _cli))
                        {
                            if (!Cliente.UpdateCliente(_cli))
                            {
                                throw new Exception("No se pudo actualizar registro Cliente Id: " + _cli.id.ToString());
                            }
                        }
                        if (GeneroActualizacion)
                        {
                            Cliente.UpdateContadorActualizacion(_cli.id);
                        }

                        (this.Master as NavContenido).MostrarMensaje("Datos Actualizados correctamente.");
                       // Session.Remove("PasoLoad");
                    }
                    else
                    {
                        _dir = Cliente.AddDireccion(_dir);
                        _cli.id_direccion = _dir.id_direccion;

                        _dirFacturacion = Cliente.AddDireccion(_dirFacturacion);
                        _infoFact.id_direccion = _dirFacturacion.id_direccion;

                        _infoEmpresa = Cliente.AddInfoEmpresa(_infoEmpresa);
                        _cli.id_info_empresa = _infoEmpresa.id;

                        _infoFact = Cliente.AddInfoFacturacion(_infoFact);
                        _cli.id_info_factura = _infoFact.id;

                        _cli = Cliente.AddCliente(_cli);

                        //Session.Remove("PasoLoad");
                        (this.Master as NavContenido).MostrarMensajeRedirect("Datos ingresados correctamente.", "/Proveedor.aspx");
                       
                    }

                    

                }

            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ", "Error", ex);
               

            }
            finally
            {
                Session.Remove("DireccionFacturacionEdit");
                Session.Remove("ClienteEdit");
                Session.Remove("InfoFacturacionEdit");
                Session.Remove("InfoEmpresaEdit");
                Session.Remove("DirClienteEdit");
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
                var folioData = _Folio.GetFolioFichaById(_ClienteData.id_codigo_folio);
                var InfoFacturacion = Cliente.GetInfoFacturacionById(_ClienteData.id_info_factura);
                var DirFacturacion = Cliente.GetDireccionById(InfoFacturacion.id_direccion.Value);

                var InfoEmpresa = Cliente.GetInfoEmpresaById(_ClienteData.id_info_empresa.Value);
                var DirCliente = Cliente.GetDireccionById(_ClienteData.id_direccion.Value);

                Session["DireccionFacturacionEdit"] = DirFacturacion;
                Session["ClienteEdit"] = _ClienteData;
                Session["InfoFacturacionEdit"] = InfoFacturacion;
                Session["InfoEmpresaEdit"] = InfoEmpresa;
                Session["DirClienteEdit"] = DirCliente;

                #region Informacion del documento
                hdIdFolio.Value = folioData.idFolio.ToString();
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
                    hdIdInfoFactura.Value = InfoFacturacion.id.ToString();
                    txtCtaFactNatNombre.Text = InfoFacturacion.nombre_cuenta;
                    txtCtaFactNatRUT.Text = InfoFacturacion.rut;
                    txtCtaFactNatBanco.Text = InfoFacturacion.banco;
                    txtCtaFactNatTipoCta.Text = InfoFacturacion.tipo_cuenta;
                    txtCtaFactNatNumCta.Text = InfoFacturacion.numero_cuenta;
                    txtCtaFactNatEmailConfirm.Text = InfoFacturacion.correo_confirmacion;

                    #endregion

                }
                else
                {
                    #region Informacion del Representante
                    hdIdCliente.Value = _ClienteData.id.ToString();
                    TxtRepreNombre.Text = _ClienteData.nombre;
                    TxtRepreProfesion.Text = _ClienteData.area_profesion;
                    TxtRepreRutID.Text = _ClienteData.rut;
                    cmboIdentidad.Text = _ClienteData.identidad;
                    TxtRepreCumple.Text = _ClienteData.fecha_nacimiento.Value.ToString("yyyy-MM-dd");
                    TxtRepreTelefono.Text = _ClienteData.contacto1;
                    TxtRepreEmail.Text = _ClienteData.contacto2;
                    #endregion

                    #region Direccion
                    hdIdDireccion.Value = DirCliente.id_direccion.ToString();
                    txtPais.Text = DirCliente.pais;
                    txtRegion.Text = DirCliente.region;
                    txtCiudad.Text = DirCliente.ciudad;
                    TxtDirección.Text = DirCliente.direccion;
                    txtCodigoPostal.Text = DirCliente.zip;
                    #endregion

                    #region Informacion de la empresa
                    hdIdInfoEmpresa.Value = InfoEmpresa.id.ToString();
                    TxtInfCompIDRUT.Text = InfoEmpresa.rut;
                    TxtInfCompRazonSocial.Text = InfoEmpresa.razon_social;
                    TxtInfCompNombreFantasia.Text = InfoEmpresa.nombre_fantasia;
                    TxtInfCompFechaFundacion.Text = InfoEmpresa.fecha_fundacion.ToString("yyyy-MM-dd");
                    TxtInfCompPaginaWeb.Text = InfoEmpresa.pagina_web;
                    TxtInfCompTelefono.Text = InfoEmpresa.contacto_corp1;
                    TxtInfCompEmail.Text = InfoEmpresa.contacto_corp2;
                    #endregion

                    #region Direccion Facturacion
                    hdIdDireccionFacturacion.Value = DirFacturacion.id_direccion.ToString();
                    TxtFactPais.Text = DirFacturacion.pais;
                    TxtFactEstadoRegion.Text = DirFacturacion.region;
                    TxtFactCiudad.Text = DirFacturacion.ciudad;
                    TxtFactDir.Text = DirFacturacion.direccion;
                    TxtFactCodPostal.Text = DirFacturacion.zip;
                    TxtFactGiroActividad.Text = DirFacturacion.giro_actividad;
                    #endregion

                    #region Cuenta Facturacion
                    hdIdInfoFactura.Value = InfoFacturacion.id.ToString();
                    txtCtaFactNombre.Text = InfoFacturacion.nombre_cuenta;
                    txtCtaFactRUTID.Text = InfoFacturacion.rut;
                    txtCtaFactBanco.Text = InfoFacturacion.banco;
                    txtCtaFactTipoCuenta.Text = InfoFacturacion.tipo_cuenta;
                    txtCtaFactNumCta.Text = InfoFacturacion.numero_cuenta;
                    txtCtaFactEmail.Text = InfoFacturacion.correo_confirmacion;
                    #endregion

                }

                #region Datos Emisor
                DatosEmisor.Text = "Folio " + folioData.cod_folio
                                 + "; " + DataUser.cod_usuario
                                 + "; " + DataUser.NombreUsuario
                                 //+ "; " + Cargo
                                 + "; " + _ClienteData.fecha_emision.ToString("yyyy-MM-dd hh:mm:ss");

                #endregion


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al obtener registros de la Ficha", "Error", ex);
                //Session.Remove("PasoLoad");
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                string namePlantilla = string.Empty;                
                int tipoCliente = Convert.ToInt32(hdTipoProveedor.Value);
                namePlantilla = tipoCliente.Equals((int)TipoCliente.Juridico) ? "Plantilla Ficha Proveedor Juridico.xlsx" : "Plantilla Ficha Proveedor Natural.xlsx";
                var workbook = new XLWorkbook(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Plantillas Excel\", namePlantilla));
                var worksheet = workbook.Worksheet(1);
                

                /* Cabecera */
                worksheet.Cell("E6").Value = FolioDoc.Text;
                worksheet.Cell("Q6").Value = CantActualizacion.Text;
                worksheet.Cell("E7").Value = TxtFechaEmision.Text;
                worksheet.Cell("Q7").Value = TxtFechaActualizacion.Text;

                string pathImage = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Imagenes\logo_impex.jpg");

                var image = worksheet.AddPicture(pathImage)
                            .MoveTo(worksheet.Cell("M1"))
                            .WithSize(309, 80);

                /* Body */
                if (tipoCliente == (int)TipoCliente.Natural)
                {
                    #region Datos Proveedor Natural
                    var _dirFacturacion = new Direccion
                    {
                        pais = txtNatPais.Text,
                        region = txtNatRegion.Text,
                        ciudad = txtNatCiudad.Text,
                        direccion = txtNatDireccion.Text,
                        zip = txtNatZip.Text,
                        giro_actividad = TxtNatGiroActividad.Text

                    };

                    var _cli = new Cliente
                    {
                        id_tipo_cliente = tipoCliente,
                        // id_codigo_folio = numeroFolio.idFolio,
                        nombre = txtNatNombre.Text,
                        rut = txtNatRut.Text,
                        area_profesion = txtNatProfesion.Text,
                        identidad = cmboNatIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(txtNatFechaNac.Text),
                        contacto1 = txtNatFono.Text,
                        contacto2 = txtNatEmail.Text,
                        NombreEntidad = NombreEntidad.Proveedor.ToString()
                    };

                    var _infoFact = new Informacion_Facturacion
                    {
                        nombre_cuenta = txtCtaFactNatNombre.Text,
                        rut = txtCtaFactNatRUT.Text,
                        banco = txtCtaFactNatBanco.Text,
                        tipo_cuenta = txtCtaFactNatTipoCta.Text,
                        numero_cuenta = txtCtaFactNatNumCta.Text,
                        correo_confirmacion = txtCtaFactNatEmailConfirm.Text
                    };

                    string direccionFacturacion = "(1.) País:" + _dirFacturacion.pais + ";"
                       + "(1.1.) Estado / Región: " + _dirFacturacion.region + "; (1.2.) Ciudad: " + _dirFacturacion.ciudad + ";"
                       + "(1.2.) Dirección: " + _dirFacturacion.direccion + "; (1.3.) Código Postal: " + _dirFacturacion.zip;

                    string cuentaBancaria = "(1.) Nombre: " + _infoFact.nombre_cuenta + "; (1.1.) RUT (DNI, Tax – ID): " + _infoFact.rut
                        + "; (1.2.) Banco: " + _infoFact.banco + "; (1.3.) Tipo de cuenta: " + _infoFact.tipo_cuenta
                        + "; (1.4.) Número de cuenta: " + _infoFact.numero_cuenta + "; (2.) Correo de confirmación: " + _infoFact.correo_confirmacion;

                    #endregion

                    worksheet.Cell("E9").Value = _cli.nombre;
                    worksheet.Cell("I9").Value = _cli.area_profesion;
                    worksheet.Cell("Q9").Value = _cli.rut;
                    worksheet.Cell("E10").Value = _cli.identidad;
                    worksheet.Cell("I10").Value = _cli.fecha_nacimiento.Value.ToString("yyyy-MM-dd");
                    worksheet.Cell("Q10").Value = _cli.contacto1;
                    worksheet.Cell("U10").Value = _cli.contacto2;
                    worksheet.Cell("E11").Value = direccionFacturacion;
                    worksheet.Cell("E13").Value = cuentaBancaria;
                    worksheet.Cell("A17").Value = DatosEmisor.Text;
                }
                else
                {
                    #region Proveedor Juridico
                    var _dir = new Direccion
                    {
                        pais = txtPais.Text,
                        region = txtRegion.Text,
                        ciudad = txtCiudad.Text,
                        direccion = TxtDirección.Text,
                        zip = txtCodigoPostal.Text
                    };

                    var _cli = new Cliente
                    {
                        id_tipo_cliente = tipoCliente,
                        nombre = TxtRepreNombre.Text,
                        rut = TxtRepreRutID.Text,
                        area_profesion = TxtRepreProfesion.Text,
                        identidad = cmboIdentidad.Text,
                        fecha_nacimiento = Convert.ToDateTime(TxtRepreCumple.Text),
                        contacto1 = TxtRepreTelefono.Text,
                        contacto2 = TxtRepreEmail.Text,
                        NombreEntidad = NombreEntidad.Proveedor.ToString()
                    };

                    var _infoEmpresa = new Informacion_Empresa
                    {
                        rut = TxtInfCompIDRUT.Text,
                        razon_social = TxtInfCompRazonSocial.Text,
                        nombre_fantasia = TxtInfCompNombreFantasia.Text,
                        fecha_fundacion = Convert.ToDateTime(TxtInfCompFechaFundacion.Text),
                        pagina_web = TxtInfCompPaginaWeb.Text,
                        contacto_corp1 = TxtInfCompTelefono.Text,
                        contacto_corp2 = TxtInfCompEmail.Text
                    };

                    var _dirFacturacion = new Direccion
                    {
                        pais = TxtFactPais.Text,
                        region = TxtFactEstadoRegion.Text,
                        ciudad = TxtFactCiudad.Text,
                        direccion = TxtFactDir.Text,
                        zip = TxtFactCodPostal.Text,
                        giro_actividad = TxtFactGiroActividad.Text
                    };

                    var _infoFact = new Informacion_Facturacion
                    {
                        nombre_cuenta = txtCtaFactNombre.Text,
                        rut = txtCtaFactRUTID.Text,
                        banco = txtCtaFactBanco.Text,
                        tipo_cuenta = txtCtaFactTipoCuenta.Text,
                        numero_cuenta = txtCtaFactNumCta.Text,
                        correo_confirmacion = txtCtaFactEmail.Text
                    };

                    string direccionPersonal = "(1.) País:" + _dir.pais + ";"
                        + "(1.1.) Estado / Región: " + _dir.region + "; (1.2.) Ciudad: " + _dir.ciudad + ";"
                        + "(1.2.) Dirección: " + _dir.direccion + "; (1.3.) Código Postal: " + _dir.zip;

                    string direccionFacturacion = "(1.) País:" + _dirFacturacion.pais + ";"
                        + "(1.1.) Estado / Región: " + _dirFacturacion.region + "; (1.2.) Ciudad: " + _dirFacturacion.ciudad + ";"
                        + "(1.2.) Dirección: " + _dirFacturacion.direccion + "; (1.3.) Código Postal: " + _dirFacturacion.zip;

                    string cuentaBancaria = "(1.) Nombre: " + _infoFact.nombre_cuenta + "; (1.1.) RUT (DNI, Tax – ID): " + _infoFact.rut
                        + "; (1.2.) Banco: " + _infoFact.banco + "; (1.3.) Tipo de cuenta: " + _infoFact.tipo_cuenta
                        + "; (1.4.) Número de cuenta: " + _infoFact.numero_cuenta + "; (2.) Correo de confirmación: " + _infoFact.correo_confirmacion;

                    #endregion

                    worksheet.Cell("E9").Value = _cli.nombre;
                    worksheet.Cell("I9").Value = _cli.area_profesion;
                    worksheet.Cell("Q9").Value = _cli.rut;
                    worksheet.Cell("E10").Value = _cli.identidad;
                    worksheet.Cell("I10").Value = _cli.fecha_nacimiento.Value.ToString("yyyy-MM-dd");
                    worksheet.Cell("Q10").Value = _cli.contacto1;
                    worksheet.Cell("U10").Value = _cli.contacto2;
                    worksheet.Cell("E11").Value = direccionPersonal;
                    worksheet.Cell("E14").Value = _infoEmpresa.rut;
                    worksheet.Cell("Q14").Value = _infoEmpresa.razon_social;
                    worksheet.Cell("E15").Value = _infoEmpresa.nombre_fantasia;
                    worksheet.Cell("Q15").Value = _infoEmpresa.fecha_fundacion.ToString("yyyy-MM-dd");
                    worksheet.Cell("E16").Value = _infoEmpresa.pagina_web;
                    worksheet.Cell("Q16").Value = _infoEmpresa.contacto_corp1;
                    worksheet.Cell("U16").Value = _infoEmpresa.contacto_corp2;
                    worksheet.Cell("E17").Value = direccionFacturacion;
                    worksheet.Cell("E19").Value = cuentaBancaria;
                    worksheet.Cell("A23").Value = DatosEmisor.Text;
                }


                string myName = Server.UrlEncode("Ficha_Proveedor_" + ((TipoCliente)tipoCliente).ToString() + "_" + DateTime.Now.ToShortDateString() + ".xlsx");
                HttpResponse httpResponse = Response;
                httpResponse.Clear();
                httpResponse.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                httpResponse.AddHeader("content-disposition", "attachment;filename=" + myName);

                // Flush the workbook to the Response.OutputStream
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    workbook.SaveAs(memoryStream);
                    memoryStream.WriteTo(httpResponse.OutputStream);
                    memoryStream.Close();
                }

                httpResponse.End();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ", "Error", ex);
            }

            
        }

    }
}