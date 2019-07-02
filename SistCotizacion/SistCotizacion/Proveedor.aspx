<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="SistCotizacion.Proveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading text-center"><strong>PROVEEDOR</strong></div>
        <div class="panel-body">
            <h3>Filtros</h3>
            <div class="row">
                
                <div class="col-md-4">
                    <label>Tipo:</label>
                         <div class="form-inline required">
                    <div class="form-group has-feedback">
                        <label class="input-group">
                            <span class="input-group-addon">
                                <input id="Pnatural" type="radio" name="persona" value="0" />
                            </span>
                            <div class="form-control form-control-static">
                                Natural
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
                                Juridico
                            </div>
                            <span class="glyphicon form-control-feedback "></span>
                        </label>
                    </div>
                </div>
                </div>
                
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Folio:</label>
                        <asp:TextBox ID="TextBox1" placeholder="Folio documento" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2">
                   <br />
                    <asp:Button ID="BtnBuscar" CssClass="btn btn-info" Width="120px" runat="server" Text="Buscar" />
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3">
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info" PostBackUrl="~/IngresoProveedor.aspx" runat="server">Ingresar Proveedor</asp:LinkButton>
                </div>
            </div>
         <br />
                <asp:GridView ID="GridListProveedor" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="1"></asp:BoundField>
                        <asp:BoundField HeaderText="Folio" DataField="2"></asp:BoundField>
                        <asp:BoundField HeaderText="Razon Social" DataField="3"></asp:BoundField>
                        <asp:BoundField HeaderText="RUT(ID)" DataField="4"></asp:BoundField>
                        <asp:BoundField HeaderText="Nombre Fantasia" DataField="5"></asp:BoundField>
                        <asp:TemplateField HeaderText="Accion">
                            <ItemTemplate>
                                <div class="btn-group" role="group">
                                    <asp:LinkButton ID="btnEditarCell" runat="server" class="btn btn-default"  ToolTip="Editar">
                            <span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="BtnSKU" runat="server" class="btn btn-danger" ToolTip="Eliminar">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No se encontraron datos.
                    </EmptyDataTemplate>
                </asp:GridView>
            
        </div>
 
    </div>

</asp:Content>
