<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="EntidadUsuario.aspx.cs" Inherits="SistCotizacion.EntidadUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

        <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>REGISTRO DE USUARIO</strong></div>
            <div class="panel-body">
          
                <div class="table-responsive">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="9" class="active text-center">Información del usuario</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <tr>
                                <td class="active" rowspan="2"><strong>Serie Usuario</strong></td>
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
                    <table class="table table-bordered" id="TablaRegistroUsuario">
                        <thead>
                            <tr>
                                <th class="input-group-addon danger">1</th>
                                <th class="active text-center" colspan="2">Información del usuario</th>
                            </tr>
                        </thead>
                        <tbody>
                         
                            <tr>
                                <td class="active">
                                    <strong>Nombre </strong>

                                </td>
                                <td colspan="2">
                                    <asp:TextBox class="form-control" ID="txtNombreusuario" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="active">
                                    <strong>Tipo usuario</strong>
                                </td>
                                <td colspan="2">
                                    <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon"> <asp:Label ID="Label1" runat="server" Text="SPA"></asp:Label></div>                                               
                                                <asp:DropDownList class="form-control" ID="DropDownList1" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                </td>

                            </tr>
                         
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer text-right">
                <asp:Button ID="btnRegistroEntidadCliente" class="btn btn-info" runat="server" Text="Ingresar" />
            </div>
        </div>


</asp:Content>
