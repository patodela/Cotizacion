<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="EntidadPersonal.aspx.cs" Inherits="SistCotizacion.EntidadPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

    
         <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>PERSONAL</strong></div>
            <div class="panel-body">
           
                <div class="table-responsive">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="active text-center" colspan="2">
                                    <div style="border-bottom: 1px solid"><h2>FICHA DE REGISTRO</h2></div>
                                    <div><h4>PERSONAL INTERNO</h4></div>
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
                                    <asp:Label ID="CantActualizacion" runat="server" Text="000"></asp:Label></td>
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
                    <table class="table table-bordered" id="TablaPersonalInterno" >
                     
                        <tbody>
                            <tr>
                                <td class="input-group-addon danger">1.0</td>
                                <td class="active text-center" colspan="6"><strong>Información de el Operario</strong></td>
                            </tr>
                           
                            <tr>
                                <td class="active" colspan="2"> <strong>Nombre Completo</strong></td>
                                <td colspan="2">
                                    <asp:TextBox ID="TxtRepreNombre" CssClass="form-control" runat="server"></asp:TextBox>

                                </td>
                               
                                <td class="active"><strong>RUT (ID)</strong></td>
                                <td colspan="2"><asp:TextBox ID="TxtRepreRutID" CssClass="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2"><strong>Identidad / Cumpleaños</strong></td>
                                <td>
                                    <asp:DropDownList CssClass="form-control" ID="cmboIdentidad" runat="server" DataSourceID="SqlDataSourceIdentidad" DataTextField="descripcion" DataValueField="id_identidad">
                                    </asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSourceIdentidad" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_identidad], [descripcion] FROM [Lista_identidades]"></asp:SqlDataSource>
                                </td>
                                <td><asp:TextBox ID="TxtRepreCumple" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox></td>
                                <td class="active"><strong>Telefono / Email</strong></td>
                                <td><asp:TextBox ID="TxtRepreTelefono" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox></td>
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
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Referencias:s</div>                                               
                                               <asp:TextBox ID="txtReferencias" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="input-group-addon danger">2</td>
                                <td class="active text-center" colspan="6"><strong>Identificación Laboral</strong></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2"><strong>Departamento</strong></td>
                                <td colspan="2">
                                   <%-- <asp:UpdatePanel runat="server">
                                        <ContentTemplate>--%>
                                            <asp:DropDownList ID="cmboDepartamento" CssClass="form-control dropdown" runat="server" DataSourceID="SqlDataSourceDepartamento" DataTextField="Nombre_Departamento" DataValueField="id_departamento" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSourceDepartamento" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_departamento], [Nombre_Departamento] FROM [Lista_Departamentos]"></asp:SqlDataSource>
                                  <%--      </ContentTemplate>                                       
                                    </asp:UpdatePanel>--%>
                                   
                                </td>
                                <td class="active"><strong>Cargo</strong></td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cmboCargo" CssClass="form-control dropdown" runat="server" DataSourceID="SqlDataSourceCargo" DataTextField="cargo" DataValueField="id_cargo"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSourceCargo" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_cargo], [cargo] FROM [Lista_Cargos] WHERE ([id_dpto] = @id_dpto)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cmboDepartamento" PropertyName="SelectedValue" DefaultValue="" Name="id_dpto" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                             <tr>
                                <td class="active" colspan="2"><strong>Situacion</strong></td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cmboSituacion" CssClass="form-control dropdown" runat="server" DataSourceID="SqlDataSourceSituacion" DataTextField="situacion" DataValueField="id_situacion"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSourceSituacion" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_situacion], [situacion] FROM [Lista_Situacion]"></asp:SqlDataSource>
                                </td>
                                <td class="active"><strong>Telefono / Email</strong></td>
                                <td><asp:TextBox class="form-control" ID="TextBox20" TextMode="Phone" runat="server"></asp:TextBox></td>
                                 <td><asp:TextBox class="form-control" ID="TextBox21" TextMode="Email" runat="server"></asp:TextBox></td>
                            </tr>
                          
                           
                                 <tr>
                                <td class="active" colspan="2"><strong>Direccion Personal</strong></td>
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
                                         <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">(2)Referencia(s):</div>                                               
                                               <asp:TextBox ID="TxtFactReferencia" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </td>
                            </tr>
                             <tr>
                                <td class="input-group-addon danger">2.1</td>
                                <td class="active text-center" colspan="6"><strong>Contrato Laboral</strong></td>
                            </tr>
                            <tr>
                                <td class="active" colspan="2"><strong>Derechos</strong></td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox22" class="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td class="active"><strong>Laborales</strong></td>
                                 <td colspan="2">
                                    <asp:TextBox ID="TextBox23" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="active"><strong>Contrato</strong></td>
                                <td colspan="5">
                                    <asp:DropDownList ID="cmboContratos" CssClass="form-control dropdown" runat="server" DataSourceID="SqlDataSourceContrato" DataTextField="contrato" DataValueField="id_contrato"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSourceContrato" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_contrato], [contrato] FROM [Lista_Contratos]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="active"><strong>Periodo</strong></td>
                                <td>
                                    <asp:TextBox ID="TextBox24" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox25" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td colspan="3"></td>
                            </tr>
                              
                            
                     <tr>
                         <td class="active text-center" colspan="7"><strong>Emision</strong></td>
                        
                     </tr>
                            <tr>
                                 <td colspan="7" class="text-center"> <strong>Confeccione este documento</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7" class="text-center">
                                    <asp:Label ID="Label1" runat="server" Text="Datos Emisor"></asp:Label>
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
                <asp:Button ID="btnRegistroEntidadProveedor" class="btn btn-info" runat="server" Text="Ingresar" />
            </div>
        </div>
</asp:Content>
