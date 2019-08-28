<%@ Page
    Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="CotNacional.aspx.cs" Inherits="SistCotizacion.Cotizacion.CotNacional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

    <div class="container">
         <div class="panel panel-primary" runat="server"> 
            <div class="panel-heading">
                <h3 class="panel-title">Cotización</h3>
            </div>
            <div class="panel-body" style="text-align: center">
                <div class="row">
                   <div class="col-md-1 Color2">
                       0
                   </div> 
                    <div class="col-md-11 Color3">
                        Partes Intereresadas
                   </div>                     
                </div>
                <div class="row">
                   <div class="col-md-2 Color1 border">
                       <asp:Label ID="Label64" runat="server" Text="(Código)"></asp:Label>
                   </div> 
                    <div class="col-md-4 Color1 border">
                        Parte 1
                   </div>  
                    <div class="col-md-2 Color1 border">
                       <asp:Label ID="Label65" runat="server" Text="(Código)"></asp:Label>
                   </div> 
                    <div class="col-md-4 Color1 border">
                        Parte 2
                   </div>                     
                </div>
                <div class="row">
                   <div class="col-md-6 Color4 border">
                       Información de la empresa
                   </div> 
                    <div class="col-md-6 Color4 border">
                        Información de la empresa
                   </div>                     
                </div>
                <div class="row">
                   <div class="col-md-6  border">
                       Nombre / Razón Social:<asp:Label ID="Label66" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                       DNI (RUT; TAX-ID):<asp:Label ID="Label67" runat="server" Text="11111111111-1"></asp:Label><br>
                       Teléfono / E-mail: <asp:Label ID="Label68" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                       Página Web: <asp:Label ID="Label69" runat="server" Text="www. ejemplo. com"></asp:Label>
                   </div> 
                    <div class="col-md-6  border">
                        Nombre / Razón Social:<asp:Label ID="Label70" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                       DNI (RUT; TAX-ID):<asp:Label ID="Label71" runat="server" Text="11111111111-1"></asp:Label><br>
                       Teléfono / E-mail: <asp:Label ID="Label72" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                       Página Web: <asp:Label ID="Label73" runat="server" Text="www. ejemplo. com"></asp:Label>
                   </div>                     
                </div>
            </div> <%--end panel boby--%>
        </div> <%--panel partes interesadas--%>












        <div class="panel panel-primary" runat="server"> 
            <div class="panel-heading">
                <h3 class="panel-title">Cotización</h3>
            </div>
            <div class="panel-body" style="text-align: center">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12 Color1">
                                <asp:Label ID="lblTitulo" runat="server" Text="Titulo" Font-Bold="True" Font-Size="15"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 Color2">
                                <asp:Label ID="lblBajTutilo" runat="server" Text="Bajada de titulo" Font-Bold="True" Font-Size="12"></asp:Label>
                            </div>
                            <div class="col-md-12 Color2">
                                <asp:Label ID="lblSubTitulo" runat="server" Text="Sub Titulo" Font-Bold="True" Font-Size="12"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 logo">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/error.png" Height="100px" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-1 Color2 border">
                        <asp:Literal ID="Literal1" runat="server">0.</asp:Literal>
                    </div>
                    <div class="col-md-11 Color3 border">
                        <asp:Literal ID="Literal2" runat="server">Información del documento</asp:Literal>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 Color1 border">
                        <asp:Literal ID="Literal3" runat="server">Cotización</asp:Literal>
                    </div>
                    <div class="col-md-6 Color1 border">
                        <asp:Literal ID="Literal4" runat="server">Orden</asp:Literal>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label1" runat="server" Text="COTIZACIÓN Nº"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label2" runat="server" Text="B11.110.A0001.1.1902"></asp:Label>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Label ID="Label3" runat="server" Text="Act."></asp:Label>
                    </div>
                    <div class="col-md-1 border">
                        <asp:Label ID="Label4" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label5" runat="server" Text="AUTORIZACIÓN Nº"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label6" runat="server" Text="'B21.110.A0001.1.1901"></asp:Label>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Label ID="Label7" runat="server" Text="Act."></asp:Label>
                    </div>
                    <div class="col-md-1 border">
                        <asp:Label ID="Label8" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal5" runat="server">Emisión / Aprobación</asp:Literal>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label10" runat="server" Text="2019 - 02 - 01"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label11" runat="server" Text="2019 - 02 - 05"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal6" runat="server">Emisión / Autorización</asp:Literal>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label15" runat="server" Text="2019 - 02 - 01"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label16" runat="server" Text="2019 - 02 - 05"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal7" runat="server">Válidad hasta</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label9" runat="server" Text="2019 - 02 - 05"></asp:Label>

                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal8" runat="server">Válidad hasta</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label14" runat="server" Text="2019 - 02 - 05"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal9" runat="server">ESTADO</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label12" runat="server" Text="Aprobada"></asp:Label>

                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal10" runat="server">ESTADO</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label13" runat="server" Text="Autorizado"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 Color3 border">
                        <asp:Literal ID="Literal11" runat="server">Documentos Adjuntos</asp:Literal>
                    </div>
                    <div class="col-md-6 Color3 border">
                        <asp:Literal ID="Literal12" runat="server">Divisas</asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal13" runat="server">CATALOGO N°</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label17" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>

                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal14" runat="server">CLP</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label18" runat="server" Text="Peso Chileno"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal15" runat="server">HOJA AFORO Nº</asp:Literal>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label19" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label20" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal16" runat="server">USD ; T/C</asp:Literal>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label21" runat="server" Text="DOLAR AMERICANO"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label22" runat="server" Text="688,98"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal17" runat="server">SEG. OP/FN Nº</asp:Literal>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label23" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label24" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal18" runat="server">UF ; T/C</asp:Literal>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label25" runat="server" Text="UNIDAD DE FOMENTO"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label26" runat="server" Text="26222,18"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 Color2 border">
                        <asp:Literal ID="Literal19" runat="server">1.</asp:Literal>
                    </div>
                    <div class="col-md-11 Color3 border">
                        <asp:Literal ID="Literal20" runat="server">Listado de Mercancías</asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <span style="float: right">
                        <asp:LinkButton ID="btnExport"
                            runat="server"
                            CssClass="btn btn-primary" OnClientClick="'divExport', 'W3C Example Table'">
                                <span aria-hidden="true" class="glyphicon glyphicon-floppy-save"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnAgregar"
                            runat="server"
                            CssClass="btn btn-primary" OnClick="btnAgregar_Click">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                        </asp:LinkButton>
                    </span>

                    <asp:GridView CssClass="table table-bordered table-responsive" ID="gridMercancias" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="N°" />
                            <asp:BoundField HeaderText="SKU CONJUNTO" DataField="sku" />
                            <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="descripcion" />
                            <asp:BoundField HeaderText="CANTIDAD" DataField="cantidad" />
                            <asp:BoundField HeaderText="(UM)" DataField="um" />
                            <asp:BoundField HeaderText="VALOR TOTAL CLP" DataField="vtclp" />
                            <asp:BoundField HeaderText="VALOR TOTAL USD" DataField="vtusd" />
                            <asp:BoundField HeaderText="$" DataField="vt$" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="row">
                    <div class="col-md-2 Color3 border" style="height: 44px">
                        <asp:Literal ID="Literal21" runat="server">CANTIDAD</asp:Literal>
                    </div>
                    <div class="col-md-2 Color4 border" style="height: 44px">
                        <asp:Literal ID="Literal22" runat="server">ORDEN</asp:Literal>
                    </div>
                    <div class="col-md-2 Color4 border" style="height: 44px">
                        <asp:Literal ID="Literal23" runat="server">CANTIDAD</asp:Literal>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12  border">
                                <asp:Label ID="Label27" runat="server" Text="99"></asp:Label>
                            </div>
                            <div class="col-md-12  border">
                                <asp:Label ID="Label28" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-12  border">
                                <asp:Label ID="Label29" runat="server" Text="U"></asp:Label>
                            </div>
                            <div class="col-md-12  border">
                                <asp:Label ID="Label30" runat="server" Text="KG"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-2 Color3">
                        <div class="row">
                            <div class="col-md-12 border" style="height: 220px">
                                <asp:Literal ID="Literal24" runat="server">PRORRATEO TOTALES</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color1">
                                <asp:Literal ID="Literal27" runat="server">VALOR TOTALIZADO</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4">
                        <div class="row">
                            <div class="col-md-12 border" style="height: 66px">
                                <asp:Literal ID="Literal25" runat="server">ORDEN</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border" style="height: 66px">
                                <asp:Literal ID="Literal28" runat="server">TRIBUTARIO</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border" style="height: 110px">
                                <asp:Literal ID="Literal29" runat="server">RESULTADO</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4 ">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal26" runat="server">SUBTOTAL</asp:Literal>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7 border">
                                <asp:Literal ID="Literal31" runat="server">Desc.</asp:Literal>
                            </div>
                            <div class="col-md-5 border">
                                <asp:Literal ID="Literal30" runat="server">30%</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal32" runat="server">TOTAL</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal33" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label31" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal34" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label32" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal36" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label33" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal35" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label34" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal37" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label35" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal38" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label36" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal39" runat="server">$</asp:Literal>
                                <asp:Label ID="Label37" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal40" runat="server">$</asp:Literal>
                                <asp:Label ID="Label38" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal41" runat="server">$</asp:Literal>
                                <asp:Label ID="Label39" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal42" runat="server">NETO</asp:Literal>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal43" runat="server">Impuesto por Pagar</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal44" runat="server">BRUTO</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal45" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label40" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal46" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label41" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal47" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label42" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal48" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label43" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal49" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label44" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal50" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label45" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal51" runat="server">$</asp:Literal>
                                <asp:Label ID="Label46" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal52" runat="server">$</asp:Literal>
                                <asp:Label ID="Label47" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal53" runat="server">$</asp:Literal>
                                <asp:Label ID="Label48" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4 ">
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="row">
                                    <div class="col-md-6 border" style="height: 44px">
                                        <asp:Literal ID="Literal54" runat="server">Gastos</asp:Literal>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-12 border">
                                                <asp:Literal ID="Literal66" runat="server">Comp.</asp:Literal>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 border">
                                                <asp:Literal ID="Literal67" runat="server">Prov.</asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border color2">
                                <asp:Literal ID="Literal55" runat="server">GLOBAL</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9 border ">
                                <asp:Literal ID="Literal56" runat="server">Int. Simple</asp:Literal>
                            </div>
                            <div class="col-md-3 border ">
                                <asp:Literal ID="Literal68" runat="server">1%</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal69" runat="server">TOTAL x PAGAR</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal57" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label49" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal58" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label50" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal59" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label51" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal74" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label62" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal75" runat="server">CLP</asp:Literal>
                                <asp:Label ID="Label63" runat="server" Text="1000"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal60" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label52" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal61" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label53" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal62" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label54" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal72" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label60" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal73" runat="server">USD</asp:Literal>
                                <asp:Label ID="Label61" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal63" runat="server">$</asp:Literal>
                                <asp:Label ID="Label55" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal64" runat="server">$</asp:Literal>
                                <asp:Label ID="Label56" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal65" runat="server">$</asp:Literal>
                                <asp:Label ID="Label57" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal70" runat="server">$</asp:Literal>
                                <asp:Label ID="Label58" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal71" runat="server">$</asp:Literal>
                                <asp:Label ID="Label59" runat="server" Text="99"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Panel agregar-->
        <asp:Panel ID="PanelAgregar" runat="server" Style="width: 90%">
            <div class="panel panel-default popupgrande">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-4">
                            <strong>Agregar Productos</strong>
                        </div>
                        <div class="col-md-4 col-md-offset-4">
                            <div class="input-group input-group-sm">
                                <span class="input-group-btn">
                                    <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn btn-success" ToolTip="Refrescar">
                                  <span aria-hidden="true" class="glyphicon glyphicon-refresh"></span>
                                    </asp:LinkButton>
                                </span>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Producto..." runat="server"></asp:TextBox>
                                <span class="input-group-btn">

                                    <asp:LinkButton ID="btnBuscar" runat="server" CssClass="btn btn-info" ToolTip="Buscar">
                                  <span aria-hidden="true" class=" glyphicon glyphicon-search"></span>
                                    </asp:LinkButton>
                                    <%--<asp:Button ID="btnBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />--%>
                                </span>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="panel-body">
                    <div class="row">
                        <asp:GridView ID="grvAddProd" CssClass="table table-bordered table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="id_producto" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_producto" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id_producto" />
                                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                <asp:BoundField DataField="cod_sku_nacional" HeaderText="cod_sku_nacional" SortExpression="cod_sku_nacional" />
                                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Cantidad" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="cantidad" HeaderText="cantidad Total" SortExpression="cantidad" />
                                <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
                                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand=" select A.id_producto,B.cod_sku_nacional,A.nombre,B.descripcion ,B.cantidad,B.UM,B.total from 
                                 producto A,
                                 libro_ingreso B 
                                 where A.id_producto = B.id_producto"></asp:SqlDataSource>
                    </div>

                    <div class="pull-right">
                        <asp:Button ID="btnCancelEditProd" runat="server" Text="Cancelar" Width="150px" CssClass="btn btn-danger" />
                    </div>
                    <div class="pull-right">
                        <asp:Button ID="btnAgregarProducto" runat="server" CssClass="btn btn-primary" Text="Agregar" Width="150px" OnClick="btnAgregarProducto_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:HiddenField ID="HiddenFieldPopupPanelProducto" runat="server" />
        <ajaxToolkit:ModalPopupExtender ID="PopUpPanelAgregar" TargetControlID="HiddenFieldPopupPanelProducto" OkControlID="btnCancelEditProd" PopupControlID="PanelAgregar" runat="server"></ajaxToolkit:ModalPopupExtender>

    </div>

</asp:Content>
