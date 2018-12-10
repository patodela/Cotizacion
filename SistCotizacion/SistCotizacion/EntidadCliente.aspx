<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="EntidadCliente.aspx.cs" Inherits="SistCotizacion.EntidadCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Pnatural").click(function () {
                if ($("#Pnatural").prop("checked", true)) {
                    $("#TablaRegistroEmpresa").hide();
                    $("#TablaRegistroCliente").show();
                }
            });
            $("#Pjuridica").click(function () {
                if ($("#Pjuridica").prop("checked", true)) {
                    $("#TablaRegistroEmpresa").show();
                    $("#TablaRegistroCliente").hide();
                }
            });
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
    <form runat="server">
        <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>REGISTRO DE CLIENTE</strong></div>
            <div class="panel-body">
              <div class="form-inline required">
                    <div class="form-group has-feedback">
                        <label class="input-group">
                            <span class="input-group-addon">
                                <input id="Pnatural" type="radio" name="persona" value="0" />
                            </span>
                            <div class="form-control form-control-static">
                                Persona Natural
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                    <div class="form-group has-feedback ">
                        <label class="input-group">
                            <span class="input-group-addon">
                                <input type="radio" checked="checked" id="Pjuridica" name="persona" value="1" />
                            </span>
                            <div class="form-control form-control-static">
                                Persona Juridica
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="9" class="active text-center">Tipo de persona</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <tr>
                                <td class="active" rowspan="2"><strong>Serie Cliente</strong></td>
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
                                <th class="active text-center" colspan="2">Información de la empresa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="active text-nowrap">
                                    <strong>Inicio de actividades</strong>
                                </td>
                                <td colspan="2">
                                    <asp:RadioButtonList ID="rdbtnIniAct" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">Si</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
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
                                    <strong>RUT</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtRut" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <strong>Fecha de Fundación</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtfechaFund" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
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
                    <table class="table table-bordered" style="display:none;" id="TablaRegistroCliente">
                        <thead>
                             <tr>
                                <th class="input-group-addon danger">1</th>
                                <th class="active text-center" colspan="2">Información del cliente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="active"><strong>Nombre con apellido</strong> </td>
                                <td>
                                    <asp:TextBox ID="txtnombreCliente" class="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                               <td class="active"><strong>RUT</strong> </td>
                                      <td>
                                    <asp:TextBox ID="txtRutCliente" class="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                              <tr>
                                <td class="active"><strong>Telefono/Email</strong></td>
                                <td>
                                   
                                    <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Teléfono</div>                                               
                                               <asp:TextBox ID="txtTelefonoCliente" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Email</div>                                               
                                               <asp:TextBox ID="txtEmailcliente" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                </td>
                            </tr>
                              <tr>
                               <td class="active"><strong>Sexo biologico</strong> </td>
                                      <td>
                                    <asp:TextBox ID="txtSexo" class="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                              <tr>
                               <td class="active"><strong>Edad Aproximada</strong> </td>
                                      <td>
                                    <asp:TextBox ID="txtEdad" class="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer text-right">
                <asp:Button ID="btnRegistroEntidadCliente" class="btn btn-info" runat="server" Text="Ingresar" />
            </div>
        </div>
    </form>
</asp:Content>
