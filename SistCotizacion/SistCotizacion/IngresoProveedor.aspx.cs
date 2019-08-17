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

            //if (!IsPostBack)
            //{
            //    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            //    var folio = new GeneraFolioBL(DataUser);
            //    var numeroFolio = folio.GetFolioFichaProveedor(8, true);
            //    FolioDoc.Text = numeroFolio.cod_folio;
            //    TxtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //    var CodProd = Request.QueryString["CodPro"];
            //    var Tipo = Request.QueryString["Tipo"];
            //    if (!string.IsNullOrEmpty(CodProd))
            //    {
            //        hdCodProv.Value = CodProd;
            //        hdTipoProveedor.Value = Tipo;
            //        FillEditCliente(Convert.ToInt32(Tipo), Convert.ToInt32(CodProd));
            //    }
            //}



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
                var EditProveedor = string.IsNullOrEmpty(CodProd) ? false : true;
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

                    if (EditProveedor)
                    {
                        var OldDireccionEdit = (Direccion)Session["DireccionEdit"];
                        _dirFacturacion.id_direccion = Convert.ToInt32(hdIdDireccionFacturacion.Value);
                        if (Extentions.CompareObject(OldDireccionEdit, _dirFacturacion))
                        {
                            if (!Cliente.UpdateDireccion(_dirFacturacion))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dirFacturacion.id_direccion.ToString());
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
                        }

                        (this.Master as NavContenido).MostrarMensaje("Datos Actualizados correctamente.");


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


                    if (EditProveedor)
                    {
                        var OldDireccionEdit = (Direccion)Session["DireccionEdit"];
                        _dir.id_direccion = Convert.ToInt32(hdIdDireccion.Value);
                        if (Extentions.CompareObject(OldDireccionEdit, _dir))
                        {
                            if (!Cliente.UpdateDireccion(_dir))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dir.id_direccion.ToString());
                            }
                        }
                        var OldDireccionFactEdit = (Direccion)Session["DireccionFactEdit"];
                        _dirFacturacion.id_direccion = Convert.ToInt32(hdIdDireccionFacturacion.Value);
                        if (Extentions.CompareObject(OldDireccionFactEdit, _dirFacturacion))
                        {
                            if (!Cliente.UpdateDireccion(_dirFacturacion))
                            {
                                throw new Exception("No se pudo actualizar registro Direccion Id: " + _dirFacturacion.id_direccion.ToString());
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
                        }
                        var OldInfoFacturacionEdit = (Informacion_Facturacion)Session["InfoFacturacionEdit"];
                        _infoFact.id = Convert.ToInt32(hdIdInfoFactura.Value);
                        if (Extentions.CompareObject(OldInfoFacturacionEdit, _infoFact))
                        {
                            if (!Cliente.UpdateInfoFacturacion(_infoFact))
                            {
                                throw new Exception("No se pudo actualizar registro Informacion de Facturacion Id: " + _cli.id.ToString());
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

                    }
                    else
                    {
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

            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ", "Error", ex);

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
                var InfoEmpresa = Cliente.GetInfoEmpresaById(_ClienteData.id_info_empresa.Value);
                var DirCliente = Cliente.GetDireccionById(_ClienteData.id_direcion.Value);
                Session["DireccionFacturacionEdit"] = DirFacturacion;
                Session["ClienteEdit"] = _ClienteData;
                Session["InfoFacturacionEdit"] = InfoFacturacion;
                Session["InfoEmpresaEdit"] = InfoEmpresa;

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
                    hdIdDireccion.Value = Direccion.id_direccion.ToString();
                    txtNatPais.Text = DirFacturacion.pais;
                    txtNatRegion.Text = DirFacturacion.region;
                    txtNatCiudad.Text = DirFacturacion.ciudad;
                    txtNatDireccion.Text = DirFacturacion.direccion;
                    txtNatZip.Text = DirFacturacion.zip;
                    TxtNatGiroActividad.Text = DirFacturacion.giro_actividad;
                    #endregion
                }


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al obtener registros de la Ficha", "Error", ex);
            }
        }

       
        protected void Page_Preload(object sender, EventArgs e)
        {
            if (!IsCallback)
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
    }
}