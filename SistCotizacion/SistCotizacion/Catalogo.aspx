<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="SistCotizacion.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading text-center">
            <h3 class="panel-title">Catálogo</h3>
        </div>
        <div class="panel-body text-center">
            <div class="row">
                <div class="col-md-12 Color1">
                    <asp:Literal ID="Literal1" runat="server">CATÁLOGO WEB</asp:Literal>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 Color2 border">
                    <asp:Literal ID="Literal2" runat="server">0.</asp:Literal>
                </div>
                <div class="col-md-11 Color3 border">
                    <asp:Literal ID="Literal3" runat="server">Información del documento</asp:Literal>
                </div>
            </div>
             <div class="row">
                <div class="col-md-2 Color4 border">
                    <asp:Literal ID="Literal4" runat="server">Documento N°</asp:Literal>
                </div>
                <div class="col-md-4 border">
                    <asp:Label ID="Label1" runat="server" Text="A00.000.0000.0000"></asp:Label>
                </div>
                  <div class="col-md-2 Color4 border">
                    <asp:Literal ID="Literal6" runat="server">DE OPERACIÓN Nº</asp:Literal>
                </div>
                <div class="col-md-4 border">
                    <asp:Label ID="Label2" runat="server" Text="A00.000.0000.0000"></asp:Label>
                </div>
            </div>
             <div class="row">
                <div class="col-md-2 Color4 border">
                    <asp:Literal ID="Literal5" runat="server">Fecha de Emisión</asp:Literal>
                </div>
                <div class="col-md-4 border">
                    <asp:Label ID="Label3" runat="server" Text="AAAA/MM/DD (2019-01-01)"></asp:Label>
                </div>
                  <div class="col-md-2 Color4 border">
                    <asp:Literal ID="Literal7" runat="server">PÁGINA(S) Nº</asp:Literal>
                </div>
                <div class="col-md-1 border">
                    <asp:Label ID="Label4" runat="server" Text="1"></asp:Label>
                </div>
                  <div class="col-md-2 border Color4">
                    <asp:Literal ID="Literal8" runat="server">De</asp:Literal>
                </div>
                  <div class="col-md-1 border">
                    <asp:Label ID="Label6" runat="server" Text="1"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 Color4 border">
                    <asp:Literal ID="Literal9" runat="server">Identificación</asp:Literal>
                </div>
                <div class="col-md-8 Color4 border">
                    <asp:Literal ID="Literal10" runat="server">Detalle Financiero</asp:Literal>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 Color1 border">
                    Cantidad
                </div>
                <div class="col-md-1 Color4 border" style ="font-size:11px; height:22px">
                    SKU Grupo
                </div>
                  <div class="col-md-2 Color4 border">
                    Código HS
                </div>
                <div class="col-md-2 Color1 border">
                    Valor Lote CLP
                </div>
                  <div class="col-md-2 border Color4">
                    Valor Lote USD
                </div>
                  <div class="col-md-2 Color4 border">
                   Valor Lote UF
                </div>
                 <div class="col-md-2 Color4 border">
                  Tasa de Cambio
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 border">
                    <asp:Label ID="Label8" runat="server" Text="160"></asp:Label>
                </div>
                <div class="col-md-1 border">
                    <asp:Label ID="Label9" runat="server" Text="AA.01.01"></asp:Label>
                </div>
                  <div class="col-md-2 border">
                    <asp:Label ID="Label10" runat="server" Text="9999.9999"></asp:Label>
                </div>
                <div class="col-md-2 border">
                    <asp:Label ID="Label11" runat="server" Text="288000"></asp:Label>
                </div>
                  <div class="col-md-2 border">
                    <asp:Label ID="Label12" runat="server" Text="USD* Cant"></asp:Label>
                </div>
                  <div class="col-md-2 border">
                    <asp:Label ID="Label13" runat="server" Text="UF*Cant"></asp:Label>
                </div>
                 <div class="col-md-1 border" style ="font-size:11px; height:22px">
                     <asp:Label ID="Label5" runat="server" Text="de donde?"></asp:Label>
                </div>
                <div class="col-md-1 border">
                    <asp:Label ID="Label7" runat="server" Text="$"></asp:Label>
                </div>
            </div>

        </div>
        <%--panel body--%>
    </div>
    <%--panel--%>
</asp:Content>
