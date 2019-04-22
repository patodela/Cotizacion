<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="EntidadPersonal.aspx.cs" Inherits="SistCotizacion.EntidadPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

    
        <div class="panel panel-default">
            <div class="panel-heading text-center"><strong>REGISTRO DE PERSONAL</strong></div>
            <div class="panel-body">
              
                <div class="table-responsive">
                    <table id="tablaCabeceraRegistro" class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="9" class="active text-center">Descriptor de cargo</th>
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
                                <th class="active text-center" colspan="2">Información del trabajador</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="active text-nowrap">
                                    <strong>Nombre Completo</strong>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtNombre" class="form-control"  runat="server"></asp:TextBox>
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
                                    <strong>Contacto Empresa</strong>
                                </td>
                                <td colspan="2">
                                       <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Teléfono</div>                                               
                                               <asp:TextBox ID="txtTelefono" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Email</div>                                               
                                               <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                </td>

                            </tr>   
                            <tr>
                                <td class="active">
                                    <strong>Contacto Personal</strong>
                                </td>
                                <td colspan="2">
                               
                                        <div class="form-inline">
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Teléfono</div>                                               
                                               <asp:TextBox ID="txtTelefonoPer" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <div class="input-group">
                                                <div class="input-group-addon">Email</div>                                               
                                               <asp:TextBox ID="txtEmailPer" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>

                                </td>
                            </tr>                   

                            <tr>
                                <td class="danger text-center"><strong>2</strong></td>
                                <td class="active text-center" colspan="2"><strong>Descriptor de Cargo</strong></td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Área/Departamento</strong></td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtDepto" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                             <tr>
                                <td class="active"><strong>Nombre del Cargo</strong></td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtnombrecargo" class="form-control" runat="server"></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td class="active"><strong>Responsabilidad</strong></td>
                                <td>Autoridad</td>
                                <td>
                                    <asp:TextBox ID="txtResponsabilidad" class="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="active"><strong>Objetivo del cargo</strong></td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtObjetivoCargo" class="form-control" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                             </tr>
                            <tr>
                                <td class="active"><strong>Descriptor de Actividades</strong></td>
                                <td>

                                    <div class="form-group">

                                        <div class="input-group">
                                            <div class="input-group-addon">1</div>
                                            <asp:TextBox ID="txtTarea1" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-addon">2</div>
                                            <asp:TextBox ID="txtTarea2" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="input-group">
                                            <div class="input-group-addon">3</div>
                                            <asp:TextBox ID="txtTarea3" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </td>
                                   <td>

                                    <div class="form-group">

                                        <div class="input-group">
                                            <div class="input-group-addon">1</div>
                                            <asp:TextBox ID="TextBox1" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-addon">2</div>
                                            <asp:TextBox ID="TextBox2" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="input-group">
                                            <div class="input-group-addon">3</div>
                                            <asp:TextBox ID="TextBox3" class="form-control" placeholder="Tarea" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </td>
                                
                            </tr>
                       
                        </tbody>
                    </table>
                   
                </div>
            </div>
            <div class="panel-footer text-right">
                <asp:Button ID="bntRegistraEntidadPersonal" class="btn btn-info" runat="server" Text="Ingresar" />
            </div>
        </div>

</asp:Content>
