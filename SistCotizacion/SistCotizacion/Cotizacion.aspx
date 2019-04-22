<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Cotizacion.aspx.cs" Inherits="SistCotizacion.Cotizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/cotizacion.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
   
   <div class="row">
        <h2>Cotización</h2>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Seleccione Imagen de producto</label>
                            <asp:FileUpload ID="FileUploadProducto" CssClass="form-control" runat="server" />
                            <p class="help-block">Imagen formato *.jpg|*.PNG</p>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-3 text-justify">
                                    <label class="control-label">SKU Proveedor1:</label>
                                </div>
                                <div class="col-md-9 ">
                                    <asp:TextBox ID="txtSkuProveedor1" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">


                        <div class="form-group">
                            <label class="control-label">Nombre :</label>
                            <asp:TextBox ID="txtNombreProducto" CssClass="form-control" runat="server"></asp:TextBox>
                            <p>&nbsp;</p>
                        </div>

                        <div class="row">

                            <div class="form-group">
                                <div class="col-md-3">
                                    <label class="control-label">SKU Proveedor2:</label>
                                </div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtSkuProveedor2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="pull-right">
                    <asp:Button ID="btnIngresaProd" runat="server" CssClass="btn btn-default btn-lg" Text="Ingresar" OnClick="btnIngresaProd_Click" Width="150px" />
                </div>
            </div>
        </div>



    </div>

</asp:Content>
