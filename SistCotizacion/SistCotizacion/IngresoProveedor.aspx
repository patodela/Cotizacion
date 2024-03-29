﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="IngresoProveedor.aspx.cs" Inherits="SistCotizacion.EntidadProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="Scripts/js/FichaProveedor.js"></script>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
 
        <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>PROVEEDOR</strong></div>
            <div class="panel-body">
              <div class="form-inline required">
                    <div class="form-group has-feedback">
                        <label class="input-group" id="LabelNatural">
                            <span class="input-group-addon">
                                <input id="Pnatural" checked="checked" type="radio" name="TipoProveedor" value="1" />
                                
                            </span>
                            <div class="form-control form-control-static" id="divNatural">
                                Natural
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                    <div class="form-group has-feedback ">
                        <label class="input-group" id="LabelJuridico">
                            <span class="input-group-addon">
                                <input type="radio"  id="Pjuridica" name="TipoProveedor" value="2" />
                               
                            </span>
                            <div class="form-control form-control-static" id="divJuridico">
                                Juridico
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                  <asp:HiddenField ID="hdTipoProveedor" Value="1" runat="server" />
                  <asp:HiddenField ID="hdCodProv" Value="" runat="server" />
                  <asp:HiddenField ID="hdIdDireccion" runat="server" /> 
                  <asp:HiddenField ID="hdIdDireccionFacturacion" runat="server" />
                  <asp:HiddenField ID="hdIdInfoEmpresa" runat="server" /> 
                  <asp:HiddenField ID="hdIdInfoFactura" runat="server" />
                   <asp:HiddenField ID="hdIdCliente" runat="server" />
                  <asp:HiddenField ID="hdIdFolio" runat="server" />
                </div>
                <div class="table-responsive" id="divExport" runat="server">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="active text-center" colspan="2">
                                    <div style="border-bottom: 1px solid"><h2>FICHA DE REGISTRO</h2></div>
                                    <div><h4>PROVEEDOR <label id="Tipo">JURIDICO</label></h4></div>
                                </th>
                                <th colspan="4">
                                    <div class="text-center">
                                        <asp:Image ID="Image1" ImageUrl="~/Imagenes/logo_impex.jpg" Width="250px" Height="100px" CssClass="img-rounded" alt="Logo Empresa" runat="server" />
                                    </div>
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <tr>
                                
                                <td colspan="4" class="active text-center"><strong>Informacion del documento</strong></td>
                            </tr>
                            <tr>
                                <td class="active" ><strong>Documento</strong></td>
                                <td>
                                    <asp:Label ID="FolioDoc" runat="server" Text="XX00101"></asp:Label></td>                           
                                <td class="active"><strong>Actualizaciones</strong></td>
                                <td>
                                    <asp:Label ID="CantActualizacion" runat="server" Text="0"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Fecha emision</strong></td>
                                <td>
                                    <asp:Label ID="TxtFechaEmision" runat="server" Text="03/04/2019"></asp:Label></td>
                                <td class="active"><strong>Ultima Actualizacion</strong></td>
                                <td>
                                    <asp:Label ID="TxtFechaActualizacion" runat="server" Text="01/01/1900"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered" id="TablaProveedorJuridico" >
                     
                        <tbody>
                            <tr>
                                <td class="input-group-addon danger">1.0</td>
                                <td class="active text-center" colspan="6"><strong>Información del representante</strong></td>
                            </tr>
                           
                            <tr>
                                <td class="active" colspan="2"> <strong>Nombre / Profesion</strong></td>
                                <td>
                                    <asp:TextBox ID="TxtRepreNombre" CssClass="form-control" runat="server"></asp:TextBox>

                                </td>
                                <td><asp:TextBox ID="TxtRepreProfesion" CssClass="form-control" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>RUT (ID)</strong></td>
                                <td colspan="2"><asp:TextBox ID="TxtRepreRutID" CssClass="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2"><strong>Identidad / Cumpleaños</strong></td>
                                <td>
                                    <asp:DropDownList CssClass="form-control" ID="cmboIdentidad" runat="server">
                                        <asp:ListItem Value="H">Hombre</asp:ListItem>
                                        <asp:ListItem Value="M">Mujer</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td><asp:TextBox ID="TxtRepreCumple" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>Telefono / Email</strong></td>
                                <td><asp:TextBox ID="TxtRepreTelefono" CssClass="form-control" TextMode="Phone" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="TxtRepreEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                                <td class="active" colspan="2"><strong>Direccion Personal</strong></td>
                                 <td colspan="5">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1)País:</div>                                               
                                               <asp:TextBox ID="txtPais" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.1)Estado/Región:</div>                                               
                                               <asp:TextBox ID="txtRegion" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Ciudad:</div>                                               
                                               <asp:TextBox ID="txtCiudad" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Dirección:</div>                                               
                                               <asp:TextBox ID="TxtDirección" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.3)Codigo Postal:</div>                                               
                                               <asp:TextBox ID="txtCodigoPostal" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <%--<div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Referencias:s</div>                                               
                                               <asp:TextBox ID="txtReferencias" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>--%>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="input-group-addon danger">1.1</td>
                                <td class="active text-center" colspan="6"><strong>Información de la Compañía</strong></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2">
                                   
                                    <strong> (ID)RUT</strong>
                                </td>
                                <td colspan="2"><asp:TextBox class="form-control" ID="TxtInfCompIDRUT" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>Razón Social</strong></td>
                                <td colspan="2"><asp:TextBox class="form-control" ID="TxtInfCompRazonSocial" runat="server"></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="active" colspan="2"><strong>Nombre de Fantasia</strong></td>
                                <td colspan="2"><asp:TextBox class="form-control" ID="TxtInfCompNombreFantasia" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>Fecha de Fundacion</strong></td>
                                <td colspan="2">
                                    <asp:TextBox class="form-control" ID="TxtInfCompFechaFundacion"  runat="server" contentEditable="false"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender runat="server" BehaviorID="TxtInfCompFechaFundacion_CalendarExtender" Format="yyyy-MM-dd" TargetControlID="TxtInfCompFechaFundacion" ID="TxtInfCompFechaFundacion_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                </td>
                            </tr>
                             <tr>
                                <td class="active" colspan="2"><strong>Pagina Web</strong></td>
                                <td colspan="2"><asp:TextBox class="form-control" ID="TxtInfCompPaginaWeb" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>Telefono / Email</strong></td>
                                <td><asp:TextBox class="form-control" ID="TxtInfCompTelefono" TextMode="Phone" runat="server"></asp:TextBox></td>
                                 <td><asp:TextBox class="form-control" ID="TxtInfCompEmail" TextMode="Email" runat="server"></asp:TextBox></td>
                            </tr>
                           
                                 <tr>
                                <td class="active" colspan="2"><strong>Direccion Facturacion</strong></td>
                                 <td colspan="5">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1)País:</div> 
                                                                                            
                                               <asp:TextBox ID="TxtFactPais" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.1)Estado/Región:</div>                                               
                                               <asp:TextBox ID="TxtFactEstadoRegion" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Ciudad:</div>                                               
                                               <asp:TextBox ID="TxtFactCiudad" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Dirección:</div>                                               
                                               <asp:TextBox ID="TxtFactDir" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.3)Codigo Postal:</div>                                               
                                               <asp:TextBox ID="TxtFactCodPostal" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                      <%--   <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Referencia(s):</div>                                               
                                               <asp:TextBox ID="TxtFactReferencia" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>--%>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(3)Giro/Actividad:</div>                                               
                                               <asp:TextBox ID="TxtFactGiroActividad" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                                 <tr>
                                <td class="active" colspan="2"><strong>Cuenta Facturacion</strong></td>
                                 <td colspan="5">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1)Nombre:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNombre" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.1)RUT(DNI,Tax ID):</div>                                               
                                               <asp:TextBox ID="txtCtaFactRUTID" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Banco:</div>                                               
                                               <asp:TextBox ID="txtCtaFactBanco" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.3)Tipo de Cuenta:</div>                                               
                                               <asp:TextBox ID="txtCtaFactTipoCuenta" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.4)Numero de Cuenta:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNumCta" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Correo de Confirmacion:</div>                                               
                                               <asp:TextBox ID="txtCtaFactEmail" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            
                 <%--    <tr>
                         <td class="active text-center" colspan="7"><strong>Emision</strong></td>
                        
                     </tr>
                            <tr>
                                 <td colspan="7" class="text-center"> <strong>Confeccione este documento</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7" class="text-center">
                                     <asp:Label ID="DatosEmisorJuridico" runat="server" Text="Datos Emisor"></asp:Label>
                                    <asp:Image ID="ImgSelloJuridico" ImageUrl="~/Imagenes/selloAprobado2.png" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" class="active"></td>
                            </tr>--%>
                        </tbody>
                    </table>
                    <table id="TablaProveedorNatural" class="table table-bordered" style="display:none;">
                        <tbody>
                            <tr>
                                <td class="input-group-addon danger">1.0</td>
                                <td class="active text-center" colspan="6"><strong>Información del proveedor</strong></td>
                            </tr>
                             <tr>
                                <td class="active" colspan="2"> <strong>Nombre / Profesion</strong></td>
                                <td>
                                    <asp:TextBox ID="txtNatNombre" CssClass="form-control" runat="server"></asp:TextBox>

                                </td>
                                <td><asp:TextBox ID="txtNatProfesion" CssClass="form-control" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>RUT (ID)</strong></td>
                                <td colspan="2"><asp:TextBox ID="txtNatRut" CssClass="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2"><strong>Identidad / Cumpleaños</strong></td>
                                <td>
                                    <asp:DropDownList CssClass="form-control" ID="cmboNatIdentidad" runat="server">
                                        <asp:ListItem Value="H">Hombre</asp:ListItem>
                                        <asp:ListItem Value="M">Mujer</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td><asp:TextBox ID="txtNatFechaNac"  CssClass="form-control" runat="server" contentEditable="false"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender runat="server" Format="yyyy-MM-dd" BehaviorID="txtNatFechaNac_CalendarExtender" TargetControlID="txtNatFechaNac" ID="txtNatFechaNac_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                </td>
                                <td class="active"><strong>Telefono / Email</strong></td>
                                <td><asp:TextBox ID="txtNatFono" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtNatEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox></td>
                            </tr>
                              <tr>
                                <td class="active" colspan="2"><strong>Direccion Facturacion</strong></td>
                                 <td colspan="5">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1)País:</div>                                               
                                               <asp:TextBox ID="txtNatPais" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.1)Estado/Región:</div>                                               
                                               <asp:TextBox ID="txtNatRegion" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Ciudad:</div>                                               
                                               <asp:TextBox ID="txtNatCiudad" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Dirección:</div>                                               
                                               <asp:TextBox ID="txtNatDireccion" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.3)Codigo Postal:</div>                                               
                                               <asp:TextBox ID="txtNatZip" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                       <%--  <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Referencia(s):</div>                                               
                                               <asp:TextBox ID="TextBox12" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>--%>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(3)Giro/Actividad:</div>                                               
                                               <asp:TextBox ID="TxtNatGiroActividad" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                                 <tr>
                                <td class="active" colspan="2"><strong>Cuenta Facturacion</strong></td>
                                 <td colspan="5">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1)Nombre:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatNombre" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.1)RUT(DNI,Tax ID):</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatRUT" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.2)Banco:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatBanco" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.3)Tipo de Cuenta:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatTipoCta" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(1.4)Numero de Cuenta:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatNumCta" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Correo de Confirmacion:</div>                                               
                                               <asp:TextBox ID="txtCtaFactNatEmailConfirm" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                 </tr>
                           
                        </tbody>
                    </table>
                    <table class="table table-bordered">
                        <tbody>
                             <tr>
                                <td class="active text-center" colspan="7"><strong>Emision</strong></td>

                            </tr>
                            <tr>
                                <td colspan="7" class="text-center"><strong>Confeccione este documento</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7" class="text-center">
                                    <asp:Label ID="DatosEmisor" runat="server" Text="Datos Emisor"></asp:Label>
                                    <asp:Image ID="ImageSelloIngresado" ImageUrl="~/Imagenes/selloAprobado2.png" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" class="active"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer text-right">
                <asp:Button ID="btnRegistroEntidadProveedor" class="btn btn-info" OnClick="btnRegistroEntidadProveedor_Click"  style="width:100px;" runat="server" Text="Guardar" />
                <asp:Button ID="btnCancel" class="btn btn-danger" runat="server" style="width:100px;" formnovalidate="formnovalidate"  Text="Cancelar" OnClick="btnCancel_Click" />
                <asp:Button ID="btnExport" runat="server" CssClass="btn btn-success" style="width:100px;" Visible="false" OnClick="btnExport_Click" Text="Exportar" />

            </div>
        </div>
    
</asp:Content>
