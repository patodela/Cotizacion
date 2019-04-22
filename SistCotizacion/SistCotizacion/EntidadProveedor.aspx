<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="EntidadProveedor.aspx.cs" Inherits="SistCotizacion.EntidadProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
 
        <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>REGISTRO DE PROVEEDOR</strong></div>
            <div class="panel-body">
              
                <div class="table-responsive">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="9" class="active text-center"> </th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <tr>
                                <td class="active" rowspan="2"><strong>Serie proveedor</strong></td>
                                <td rowspan="2">COD1234</td>
                                <td class="active"><strong>Emisor Ficha</strong></td>
                                <td>COD</td>
                                <td colspan="2">Ricardo Olivares G.</td>

                            </tr>
                            <tr>
                                <td class="active"><strong>Fecha emision</strong></td>
                                <td>03/12/2018</td>
                                <td class="active"><strong>Actualizaciones</strong></td>
                                <td>0</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered" id="TablaRegistroEmpresa">
                        <thead>
                            <tr>
                                <th class="input-group-addon danger">1</th>
                                <th class="active text-center" colspan="2">Información del proveedor</th>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                                <td class="active">
                                    <strong>Nombre empresa</strong>

                                </td>
                                <td colspan="2">
                                    <asp:TextBox class="form-control" ID="txtNombreEmpresa" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <strong>Nombre Fantasía</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox class="form-control" ID="txtNombreFantasia" runat="server"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td class="active">
                                    <strong>Razón social</strong>
                                </td>
                                <td>
                                     <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon"> <asp:Label ID="lblRazonSocial" runat="server" Text="SPA"></asp:Label></div>                                               
                                                <asp:DropDownList class="form-control" ID="cmbRazonSocial" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>

                                   
                                
                                   </td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <strong>DNI(RUT)</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtRut" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="active">
                                    <strong>Dirección Comercial</strong>
                                </td>
                                <td colspan="2">
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">País</div>                                               
                                               <asp:TextBox ID="txtPais" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Región</div>                                               
                                               <asp:TextBox ID="txtRegion" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Ciudad</div>                                               
                                               <asp:TextBox ID="txtCiudad" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Dirección</div>                                               
                                               <asp:TextBox ID="TxtDirección" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">ZIP</div>                                               
                                               <asp:TextBox ID="txtZIP" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="active">
                                    <strong>Giro Comercial</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtGiroCom" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="active">
                                    <strong>Descripción de la Actividad</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtDescripcion" class="form-control" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="danger text-center"><strong>2</strong></td>
                                <td class="active text-center"><strong>Representantes</strong></td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Nombre</strong></td>
                                <td>
                                    <asp:TextBox ID="txtNombreRepres1" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                             <tr>
                                <td class="active"><strong>Cargo en la empresa</strong></td>
                                <td>
                                    <asp:TextBox ID="txtCargo1" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Telefono/Email</strong></td>
                                <td>
                                   
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Teléfono</div>                                               
                                               <asp:TextBox ID="txtTelefono1" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Email</div>                                               
                                               <asp:TextBox ID="txtEmail1" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="active"><strong>Nombre</strong></td>
                                <td>
                                    <asp:TextBox ID="txtNombre2" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                             <tr>
                                <td class="active"><strong>Cargo en la empresa</strong></td>
                                <td>
                                    <asp:TextBox ID="txtCargo2" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Telefono/Email</strong></td>
                                <td>
                                   
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Teléfono</div>                                               
                                               <asp:TextBox ID="txtTelefono2" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Email</div>                                               
                                               <asp:TextBox ID="txtEmail2" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  
                </div>
            </div>
            <div class="panel-footer text-right">
                <asp:Button ID="btnRegistroEntidadProveedor" class="btn btn-info" runat="server" Text="Ingresar" />
            </div>
        </div>
    
</asp:Content>
