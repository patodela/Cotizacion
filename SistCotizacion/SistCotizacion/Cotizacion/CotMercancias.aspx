<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="CotMercancias.aspx.cs" Inherits="SistCotizacion.Cotizacion.CotMercancias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet"" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css"></link>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script type='text/javascript'>
        $(function () {
            $('.input-group.date').datepicker({
                orientation: "auto left",
                forceParse: false,
                autoclose: true,
                todayHighlight: true,
                toggleActive: true,
                
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">

    <div class="container">

        <div class="panel panel-primary" runat="server">
            <div class="panel-heading">
                <h3 class="panel-title">Cotización</h3>
            </div>
            <div class="panel-body" style="text-align: center">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12 Color1">
                                <asp:Label ID="lblTitulo" runat="server" Text="COTIZACIÓN" Font-Bold="True" Font-Size="15"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 Color2">
                                <asp:Label ID="lblBajTutilo" runat="server" Text="  Mercancias" Font-Bold="True" Font-Size="12"></asp:Label>
                            </div>
                            <div class="col-md-6 Color2">
                                <asp:Label ID="lblSubTitulo" runat="server" Text="Compra" Font-Bold="True" Font-Size="12"></asp:Label>
                            </div>
                            <div class="col-md-6 Color2">
                                <asp:Label ID="Label64" runat="server" Text="Internacional" Font-Bold="True" Font-Size="12"></asp:Label>
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

               <%-- <div class="row">
                    <div class="col-md-6 Color3 border">
                        <asp:Literal ID="Literal11" runat="server">Documentos Adjuntos</asp:Literal>
                    </div>
                    <div class="col-md-6 Color3 border">
                        <asp:Literal ID="Literal12" runat="server">Divisas</asp:Literal>
                    </div>
                </div>--%>
                <%--<div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal13" runat="server">CATALOGO N°</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label17" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>

                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal4" runat="server">Divisa Base</asp:Literal>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Literal ID="Literal14" runat="server">CLP</asp:Literal>
                    </div>
                    <div class="col-md-3 border">
                        <asp:Label ID="Label18" runat="server" Text="Peso Chileno"></asp:Label>
                    </div>
                </div>--%>
                <%--<div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal15" runat="server">Nota de Aforo</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label20" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal16" runat="server">Tasa De Cambio</asp:Literal>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Label ID="Label21" runat="server" Text="USD"></asp:Label>
                    </div>
                    <div class="col-md-3 border">
                        <asp:Label ID="lblDolar" runat="server" Text="688,99"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal17" runat="server">SEGUIMIENTOS</asp:Literal>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label23" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label24" runat="server" Text="Ω00.000.Ψ0000.0.0000"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal18" runat="server">-------</asp:Literal>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Label ID="Label25" runat="server" Text="-------"></asp:Label>
                    </div>
                    <div class="col-md-3 border">
                        <asp:Label ID="Label26" runat="server" Text="---------"></asp:Label>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-md-12 Color1 border">
                        <asp:Literal ID="Literal3" runat="server">Cotización</asp:Literal>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label1" runat="server" Text="COTIZACIÓN Nº"></asp:Label>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label2" runat="server" Text="B11.110.A0001.1.1902"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Label ID="Label3" runat="server" Text="Estado"></asp:Label>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="lblEstado" runat="server" Text="Negociación"></asp:Label>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal5" runat="server">Fecha de Emisión</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label10" runat="server" Text="2019 - 02 - 01"></asp:Label>
                    </div>
                    <div class="col-md-2 Color4 border">
                        <asp:Literal ID="Literal6" runat="server">Fecha de Aprobación</asp:Literal>
                    </div>
                    <div class="col-md-4 border">
                        <asp:Label ID="Label11" runat="server" Text="2019 - 02 - 05"></asp:Label>
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
                        <asp:Literal ID="Literal16" runat="server">Tasa De Cambio</asp:Literal>
                    </div>
                    <div class="col-md-1 Color4 border">
                        <asp:Label ID="Label21" runat="server" Text="USD"></asp:Label>
                    </div>
                    <div class="col-md-3 border">
                        <asp:Label ID="lblDolar" runat="server" Text="688,99"></asp:Label>
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
                    <div class="col-md-4 Color3 border" style="height: 44px">
                        OBSERVACIONES
                    </div>

                    <div class="col-md-2 Color4 border" style="height: 44px">
                        <asp:Literal ID="Literal23" runat="server">CANTIDAD</asp:Literal>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12  border">
                                <asp:Label ID="lblCantU" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="col-md-12  border">
                                <asp:Label ID="lblCantKg" runat="server" Text="0"></asp:Label>
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
                    <div class="col-md-4 Color3">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal24" runat="server">Vendedor</asp:Literal>
                            </div>
                            <div class="col-md-12 border" style="height: 88px">
                                <asp:TextBox ID="TextBox2" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="Literal27" runat="server">Comprador</asp:Literal>
                            </div>
                            <div class="col-md-12 border" style="height: 88px">
                                <asp:TextBox ID="TextBox3" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2 Color4 ">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Literal ID="lbltitsub" runat="server">SUBTOTAL</asp:Literal>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 border">
                                <asp:Literal ID="Literal31" runat="server">Ajuste</asp:Literal>
                            </div>
                            <div class="col-md-4 border">
                                <input class="form-control" type="number" value="10" min="0" max="50" step="1" id="lblDescuento" runat="server" style="height: 20px; margin-left: -15px; width: 190%;" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal32" runat="server">NETO</asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:Literal ID="Literal33" runat="server">CLP</asp:Literal>--%>
                                <asp:Label ID="lblSubtotal" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:Literal ID="Literal34" runat="server">CLP</asp:Literal>--%>
                                <asp:Label ID="lblValorAjuste" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:Literal ID="Literal36" runat="server">CLP</asp:Literal>--%>
                                <asp:Label ID="lblValNeto" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label37" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label5" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label6" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4">
                        
                        <div class="row">
                            <div class="col-md-8 border">
                                <asp:Literal ID="Literal43" runat="server">Impuesto</asp:Literal>
                            </div>
                            <div class="col-md-4 border">
                                <input class="form-control" type="number" value="19" min="18" max="25" step="1" id="lblIva" runat="server" style="height: 20px; margin-left: -15px; width: 190%;" />
                            </div>
                        </div>
                       
                        
                        <div class="row">
                            <div class="col-md-12 border Color2">
                                <asp:Literal ID="Literal44" runat="server">Bruto</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <%--<div class="col-md-12 border">
                                <asp:Literal ID="Literal42" runat="server">Monto Facturable</asp:Literal>
                            </div>--%>
                            <div class="col-md-8 border ">
                                <asp:Literal ID="Literal4" runat="server">Interes</asp:Literal>
                            </div>
                            <div class="col-md-4 border ">
                                <input class="form-control" type="number" value="3" min="0" max="50" step="1" id="NumInteres" runat="server" style="height: 20px; margin-left: -15px; width: 190%;" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:TextBox class="form-control" ID="txtMontoFacturable" runat="server" Text="0" Width="100%" Height="20px" Style="text-align: center"></asp:TextBox>--%>
                                <asp:Label ID="lblValorImpuesto" runat="server" Text="0"></asp:Label>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:Literal ID="Literal46" runat="server">CLP</asp:Literal>--%>
                                <asp:Label ID="lblValorBruto" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <%--<asp:Literal ID="Literal47" runat="server">CLP</asp:Literal>--%>
                                <asp:Label ID="lblValorInteres" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label7" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label8" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label12" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 Color4 ">
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="row">
                                    <div class="col-md-12 border">
                                        <asp:Literal ID="Literal54" runat="server">Gasto Asumido</asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-md-12 border color2">
                                <asp:Literal ID="Literal55" runat="server">Total Global</asp:Literal>
                            </div>
                        </div>--%>
                        
                        <div class="row">
                            <div class="col-md-12 border Color2" style="height: 44px">
                                <asp:Literal ID="Literal69" runat="server">TOTAL x PAGAR</asp:Literal>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border ">
                                <asp:Literal ID="Literal56" runat="server">Gasto Externo</asp:Literal>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:TextBox class="form-control" ID="txbGastosAsum" runat="server" Text="0" Width="100%" Height="20px" Style="text-align: center"></asp:TextBox>
                            </div>
                            <div class="col-md-12 border">
                                <asp:Label ID="lblTotalpagar" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="col-md-12 border">
                                <asp:Label ID="lblTotalpagarUsd" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>

                       <%-- <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="lblTotalClp" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>--%>
                       <%-- <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="lblTotalUsd" runat="server" Text="0"></asp:Label>
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:TextBox class="form-control" ID="txtGastoExt" runat="server" Text="0" Width="100%" Height="20px" Style="text-align: center"></asp:TextBox>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label43" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label15" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label16" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>--%>
                       <%-- <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label19" runat="server" Text="CLP"></asp:Label>
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label34" runat="server" Text="USD"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 border">
                                <asp:Label ID="Label39" runat="server" Text="----"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <span style="float: right">
                    <asp:LinkButton ID="btnRefrescar"
                        runat="server"
                        CssClass="btn btn-primary" OnClick="btnRefrescar_Click">
                                <span aria-hidden="true" class="glyphicon glyphicon-refresh"></span>
                    </asp:LinkButton>
                    <%--<asp:LinkButton ID="LinkButton2"
                            runat="server"
                            CssClass="btn btn-primary" OnClick="btnAgregar_Click">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                        </asp:LinkButton>--%>
                </span>
                <%--<asp:Button ID="btnRefrescar" runat="server" CssClass="btn btn-primary" Text="Agregar" Width="150px"  />--%>
            </div>
        </div>



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
                        <asp:DropDownList class="form-control" ID="dwlAsesor" runat="server" Height="26px" Width="100%" Font-Size="12px" >
                            <asp:ListItem Selected="True" Value="1">ASESOR</asp:ListItem>
                            <asp:ListItem Value="2">ENVIA</asp:ListItem>
                            <asp:ListItem Value="3">ORIGEN</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4 Color1 border" style="height:28px">
                        <asp:DropDownList class="form-control" ID="dwlEmisor" runat="server" Height="26px" Width="100%" Font-Size="12px" >                            
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2 Color1 border">
                        <asp:DropDownList class="form-control" ID="dwlAsesorado" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">ASESORADO</asp:ListItem>
                            <asp:ListItem Value="2">RECIBE</asp:ListItem>
                            <asp:ListItem Value="3">DESTINO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4 Color1 border" style="height:28px">
                        RECEPTOR
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
                        Teléfono / E-mail:
                        <asp:Label ID="Label68" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Página Web:
                        <asp:Label ID="Label69" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                    <div class="col-md-6  border">
                        Nombre / Razón Social:<asp:Label ID="Label70" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                        DNI (RUT; TAX-ID):<asp:Label ID="Label71" runat="server" Text="11111111111-1"></asp:Label><br>
                        Teléfono / E-mail:
                        <asp:Label ID="Label72" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Página Web:
                        <asp:Label ID="Label73" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-md-2 Color1 border">
                        <asp:Label ID="Label44" runat="server" Text="Lista Des."></asp:Label>
                    </div>
                    <div class="col-md-4 Color1 border">
                        Dirección Comercial
                    </div>
                    <div class="col-md-2 Color1 border">
                        <asp:Label ID="Label45" runat="server" Text="Lista Des."></asp:Label>
                    </div>
                    <div class="col-md-4 Color1 border">
                        Dirección Comercial
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-md-6  border">
                        Nombre:<asp:Label ID="Label46" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                        Teléfono / E-mail:
                        <asp:Label ID="Label48" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Cargo/Area:
                        <asp:Label ID="Label50" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                    <div class="col-md-6  border">
                        Nombre / Razón Social:<asp:Label ID="Label52" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                        Teléfono / E-mail:
                        <asp:Label ID="Label54" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Cargo/Area:
                        <asp:Label ID="Label55" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 Color4 border">
                        GIRAR A CUENTA
                    </div>
                    <div class="col-md-6 Color4 border">
                        FACTURAR
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6  border">
                        Nombre:<asp:Label ID="Label47" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                        Teléfono / E-mail:
                        <asp:Label ID="Label53" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Cargo/Area:
                        <asp:Label ID="Label56" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                    <div class="col-md-6  border">
                        Nombre / Razón Social:<asp:Label ID="Label57" runat="server" Text="Nombre de ejemplo"></asp:Label><br>
                        Teléfono / E-mail:
                        <asp:Label ID="Label58" runat="server" Text="+569-9999999 ; compañía @ ejemplo.com"></asp:Label><br>
                        Cargo/Area:
                        <asp:Label ID="Label59" runat="server" Text="www. ejemplo. com"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 Color2 border">
                        2.1
                    </div>
                    <div class="col-md-11 Color3 border">
                        Parametros de negociación
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 Color4 border">
                        Presupuesto
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4 border Color3">
                                IDEAL
                            </div>
                            <div class="col-md-4 border" style="height: 22px">
                                <asp:TextBox class="form-control" ID="txtIdeal" runat="server" Text="0" Width="100%" Height="100%" OnTextChanged="txtIdeal_leave" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4 border">
                                <asp:Label ID="lblIdealUsd" runat="server" Text="0"></asp:Label>
                            </div>                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4 border Color3">
                                MAXIMO
                            </div>
                            <div class="col-md-4 border" style="height: 22px">
                                <asp:TextBox class="form-control" ID="txtMaximo" runat="server" Text="0" Width="100%" Height="100%" OnTextChanged="txtMaximo_leave" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4 border">
                                <asp:Label ID="lblMaximoUsd" runat="server" Text="0"></asp:Label>
                            </div>                            
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 Color4 border">
                        Requerimientos e Instrucciones
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                REQUERIMIENTO
                            </div>
                            <div class="col-md-12 border">
                                Material
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10 border" style="height: 44px">
                        <asp:TextBox ID="TextBox4" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                REQUERIMIENTO
                            </div>
                            <div class="col-md-12 border">
                                Cantidad
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10 border" style="height: 44px">
                        <asp:TextBox ID="TextBox5" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border">
                                INSTRUCCIÓN
                            </div>
                            <div class="col-md-12 border">
                                Transporte
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10 border" style="height: 44px">
                        <asp:TextBox ID="TextBox6" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-1 Color2">
                        3
                    </div>
                    <div class="col-md-11 Color3">
                        (PFDG) Instrucciones de pago, facturación y distribución de gastos
                    </div>
                </div>
               <%-- <div class="row">
                    <div class="col-md-12 Color4 border">
                        Instrucciones de giro y facturación
                    </div>
                </div>--%>

                <%--<div class="row">
                    <div class="col-md-2 border" style="height: 28px">
                        Operación
                    </div>
                    <div class="col-md-2 border">
                        <asp:DropDownList class="form-control" ID="dwlOperacion" runat="server" Height="26px" Width="100%" Font-Size="12px" OnSelectedIndexChanged="dwlOperacion_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="1">Exenta</asp:ListItem>
                            <asp:ListItem Value="2">Afecta</asp:ListItem>
                            <asp:ListItem Value="3">Afecta Solo</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2 border" style="height: 28px">
                        <asp:TextBox class="form-control" ID="txtAfectaSolo" runat="server" Text="0" Width="100%" Height="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border" style="height: 28px">
                        Fecha de pago        
                    </div>
                    <div class="col-md-2 border" style="height: 28px">
                        <div class="input-group date" data-date-format="yyyy/mm/dd">
                            <input type="text" class="form-control" style=" height:24px"><span class="input-group-addon"  style=" height:24px"><i class="glyphicon glyphicon-calendar" style="font-size:11px"></i></span>
                        </div>
                    </div>
                    <div class="col-md-2 border" style="height: 28px">
                         <div class="input-group date" data-date-format="yyyy/mm/dd">
                            <input type="text" class="form-control" style=" height:24px"><span class="input-group-addon"  style=" height:24px"><i class="glyphicon glyphicon-calendar" style="font-size:11px"></i></span>
                        </div>
                    </div>
                </div>--%>

                <%--<div class="row">
                    <div class="col-md-2 border Color3" style="height: 44px">
                        GIRAR A CUENTA
                    </div>
                    <div class="col-md-4 border" style="height: 44px">
                        <asp:Label ID="Label82" runat="server" Text="-----"></asp:Label>
                    </div>

                    <div class="col-md-2 border Color3" style="height: 44px">
                        FACTURAR A    
                    </div>
                    <div class="col-md-4 border" style="height: 44px">
                        <asp:Label ID="Label81" runat="server" Text="segun ficha"></asp:Label>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-md-12 Color4 border">
                        Instrucciones de Pago
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2 border Color3">
                        Medio de Pago
                    </div>
                    <div class="col-md-4 border">
                        <asp:DropDownList class="form-control" ID="dwlMedio" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Value="1">Efectivo</asp:ListItem>
                            <asp:ListItem Selected="True" Value="2">Transferencia</asp:ListItem>
                            <asp:ListItem Value="3">Tarjeta de Crédito</asp:ListItem>
                            <asp:ListItem Value="4">Cheque</asp:ListItem>
                            <asp:ListItem Value="5">Paypal</asp:ListItem>
                            <asp:ListItem Value="6">Alibaba / Aliexpress</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6 ">
                        <div class="row">
                            <div class="col-md-6 border Color3">
                                Forma 
                            </div>
                            <div class="col-md-6 border">
                                <asp:DropDownList class="form-control" ID="dwlForma2" runat="server" Height="26px" Width="100%" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="dwlForma2_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="1">Contado</asp:ListItem>                                   
                                    <asp:ListItem Value="2">Cuotas</asp:ListItem>                                   
                                </asp:DropDownList>
                            </div>
                           
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 border Color3">
                        Modalidad de Pago
                    </div>
                    <div class="col-md-4 border">
                        <asp:DropDownList class="form-control" ID="dwlModalidad" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Contra Realización</asp:ListItem>
                            <asp:ListItem Value="2">Contra Entrega</asp:ListItem>
                            <asp:ListItem Value="3">Contra Documentos</asp:ListItem>
                            <asp:ListItem Value="4">Previo al Despacho</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 border">
                                <asp:DropDownList class="form-control" ID="dwlForma" runat="server" Height="26px" Width="100%" Font-Size="12px" >
                                    <asp:ListItem Selected="True" Value="1">--</asp:ListItem>
                                    <asp:ListItem Value="2">Semanal</asp:ListItem>
                                    <asp:ListItem Value="3">Mensual</asp:ListItem>
                                    <asp:ListItem Value="4">Bimestral</asp:ListItem>
                                    <asp:ListItem Value="5">Trimestral</asp:ListItem>
                                    <asp:ListItem Value="6">Semestral</asp:ListItem>
                                    <asp:ListItem Value="7">Anual</asp:ListItem>
                                    <asp:ListItem Value="8">Bi-Anual</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            
                             <div class="col-md-3 border">
                                <asp:DropDownList class="form-control" ID="dwlCuotas" runat="server" Height="26px" Width="100%" Font-Size="12px" OnSelectedIndexChanged="dwlCuotas_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="11">11</asp:ListItem>
                                    <asp:ListItem Value="12">12</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                   <%-- <div class="col-md-3 border">
                        Tasa de Interés Simple(%) 
                    </div>
                    <div class="col-md-1 border">
                        <input class="form-control" type="number" value="3" min="1" max="99" step="1" id="Number2" runat="server" style="height: 20px;  width: 100%;" />
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label89" runat="server" Text="Sobre Valor Total"></asp:Label>
                    </div>--%>
                </div>

                <%--<div class="row">
                    <div class="col-md-12 Color2 border">
                        Responsabilidad de Gastos
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 border Color3">
                        Responsable
                    </div>
                    <div class="col-md-2 border Color3">
                        Categoría
                    </div>
                    <div class="col-md-4 border Color3">
                        Justificación
                    </div>
                    <div class="col-md-4 border Color3">
                        Valor
                    </div>
                </div>--%>

                <%--<div class="row">
                    <div class="col-md-2 border Color3">
                        Comprador
                    </div>
                    <div class="col-md-2 border">
                        <asp:DropDownList class="form-control" ID="dwlComprador" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Gasto Bancario</asp:ListItem>
                            <asp:ListItem Value="2">Gasto de Origen</asp:ListItem>
                            <asp:ListItem Value="3">Gasto de Transporte</asp:ListItem>
                            <asp:ListItem Value="4">Gasto Portuario</asp:ListItem>
                            <asp:ListItem Value="5">Gasto Aduanero</asp:ListItem>
                            <asp:ListItem Value="6">Gasto en Destino</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 border">
                        <asp:TextBox class="form-control" ID="txtJustComprador" runat="server" Text="" Height="26px" Width="100%" Font-Size="12px"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border">
                        <asp:TextBox class="form-control" ID="txtJustCompradorClp" runat="server" Text="0" Height="26px" Width="100%" Font-Size="12px" AutoPostBack="true" OnTextChanged="txtJustCompradorClp_Leave"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="lblJustCompradorUsd" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-1 border ">
                        <asp:Label ID="Label92" runat="server" Text="-----"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 border Color3">
                        Vendedor
                    </div>
                    <div class="col-md-2 border">
                        <asp:DropDownList class="form-control" ID="dwlVendedor" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Gasto Bancario</asp:ListItem>
                            <asp:ListItem Value="2">Gasto de Origen</asp:ListItem>
                            <asp:ListItem Value="3">Gasto de Transporte</asp:ListItem>
                            <asp:ListItem Value="4">Gasto Portuario</asp:ListItem>
                            <asp:ListItem Value="5">Gasto Aduanero</asp:ListItem>
                            <asp:ListItem Value="6">Gasto en Destino</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 border" style="height: 22px">
                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" Text=" " Width="100%" Height="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border">
                        <asp:TextBox class="form-control" ID="txtjusVendedorClp" runat="server" Text="0" Height="26px" Width="100%" Font-Size="12px" AutoPostBack="true" OnTextChanged="txtjusVendedorClp_Leave"></asp:TextBox>

                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="lblJusVenUSD" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-1 border">
                        <asp:Label ID="Label95" runat="server" Text="-----"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 border Color3">
                        Comprador
                    </div>
                    <div class="col-md-2 border">
                       <asp:DropDownList class="form-control" ID="dwlComprador2" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Gasto Bancario</asp:ListItem>
                            <asp:ListItem Value="2">Gasto de Origen</asp:ListItem>
                            <asp:ListItem Value="3">Gasto de Transporte</asp:ListItem>
                            <asp:ListItem Value="4">Gasto Portuario</asp:ListItem>
                            <asp:ListItem Value="5">Gasto Aduanero</asp:ListItem>
                            <asp:ListItem Value="6">Gasto en Destino</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 border" style="height: 22px">
                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" Text="" Width="100%" Height="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border">
                        <asp:TextBox class="form-control" ID="txtVenCompradorClp" runat="server" Text="0" Height="26px" Width="100%" Font-Size="12px" AutoPostBack="true" OnTextChanged="txtVenCompradorClp_Leave"></asp:TextBox>
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="lblVenCompradorUsd" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-1 border">
                        <asp:Label ID="Label98" runat="server" Text="-----"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-7 border Color2">
                        TOTAL
                    </div>

                    <div class="col-md-2 border Color3">
                        <asp:Label ID="lblTotalGastosCLP" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-2 border Color3">
                        <asp:Label ID="lblTotalGastosUSD" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-1 border Color3">
                        <asp:Label ID="Label101" runat="server" Text="-----"></asp:Label>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-md-12 Color3 border">
                        Amortización
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 border Color3">
                        Amortización/Impuesto
                    </div>

                    <div class="col-md-2 border">
                        <asp:Label ID="Label102" runat="server" Text="---"></asp:Label>
                    </div>
                    <div class="col-md-2 border ">
                        <asp:Label ID="lblImpuesto2" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="col-md-2 border Color3">
                        Gasto/Interés
                    </div>
                    <div class="col-md-2 border">
                        <asp:Label ID="Label105" runat="server" Text="---"></asp:Label>
                    </div>
                    <div class="col-md-2 border ">
                        <asp:Label ID="lblInteres2" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
               <%-- <div class="row">
                    <div class="col-md-2 border Color2">
                        TOTAL x PAGAR
                    </div>

                    <div class="col-md-4 border Color3">
                        <asp:Label ID="Label104" runat="server" Text="CLP 729.00"></asp:Label>
                    </div>

                    <div class="col-md-2 border Color2">
                        Pendiente x Pagar
                    </div>

                    <div class="col-md-4 border Color3">
                        <asp:Label ID="Label109" runat="server" Text="--"></asp:Label>
                    </div>
                </div>--%>
                <asp:GridView ID="grvCuotas" runat="server" AutoGenerateColumns="False"  CssClass="table table-bordered table-responsive" runat="server">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Numero" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                        <asp:BoundField DataField="TotalUSD" HeaderText="Total USD" SortExpression="TotalUSD" />
                        <asp:BoundField />
                    </Columns>
                </asp:GridView>


                 <div class="row">
                    <div class="col-md-1 border Color2">
                        4
                    </div>
                    <div class="col-md-11 border Color3">
                        Garantía & Tolerancia
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 border Color4">
                        Garantía
                    </div>
                    <div class="col-md-6 border Color4">
                        Tolerancia
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 border Color4" style="height: 44px">
                        <asp:TextBox ID="TextBox11" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-6 border Color4" style="height: 44px">
                        <asp:TextBox ID="TextBox12" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <%--<div class="row">
                    <div class="col-md-2 border Color3">
                        Plazo Legal Nacional
                    </div>
                    <div class="col-md-2 border">
                        <div class="input-group date" data-date-format="yyyy/mm/dd">
                            <input type="text" class="form-control" style=" height:24px" id="dtPlazoNacional" runat="server"><span class="input-group-addon"  style=" height:24px"><i class="glyphicon glyphicon-calendar" style="font-size:11px"></i></span>
                        </div>
                    </div>
                    <div class="col-md-2 border ">
                        <asp:Label ID="Label119" runat="server" Text="3 meses"></asp:Label>
                    </div>
                    <div class="col-md-2 border Color3">
                        Devolución / Cambio
                    </div>
                    <div class="col-md-2 border">
                        <div class="input-group date" data-date-format="yyyy/mm/dd">
                                    <input type="text" class="form-control" style=" height:24px"><span class="input-group-addon"  style=" height:24px"><i class="glyphicon glyphicon-calendar" style="font-size:11px"></i></span>
                                </div>
                    </div>
                    <div class="col-md-2 border ">
                        <div class="input-group date" data-date-format="yyyy/mm/dd">
                                    <input type="text" class="form-control" style=" height:24px"><span class="input-group-addon"  style=" height:24px"><i class="glyphicon glyphicon-calendar" style="font-size:11px"></i></span>
                                </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 border Color2">
                        8
                    </div>
                    <div class="col-md-11 border Color3">
                        Autorización
                    </div>
                </div>
                <div class="row Color3">
                    <div class="col-md-12 border">
                        Condiciones de Autorización
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 border" style="height: 44px">
                        <asp:TextBox ID="TextBox13" runat="server" Height="100%" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 border Color3">
                        Seguimiento (SOP)
                    </div>
                    <div class="col-md-4 border">
                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Realizar</asp:ListItem>
                            <asp:ListItem Value="2">No Realizar</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2 border Color3">
                        Seguimiento (SFN)
                    </div>
                    <div class="col-md-4 border">
                        <asp:DropDownList class="form-control" ID="DropDownList2" runat="server" Height="26px" Width="100%" Font-Size="12px">
                            <asp:ListItem Selected="True" Value="1">Realizar</asp:ListItem>
                            <asp:ListItem Value="2">No Realizar</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12 border Color3">
                                Autoriza Operación
                            </div>
                            <div class="col-md-12 border">
                                CODIGO DE FICHA
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 border" style="height: 44px">
                        NOMBRE….
                    </div>
                    <div class="col-md-2 border Color3" style="height: 44px">
                        Timbre y/o Firma
                    </div>
                    <div class="col-md-4 border" style="height: 44px">
                        TIMBRE O FIRMA ELECTRÓNICA
                    </div>
                </div>--%>
               <%-- <div class="row">
                    <div class="col-md-1 border Color2">
                        8.1
                    </div>
                    <div class="col-md-11 border Color3">
                        Comprobante de Pago
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col-md-2 border Color2">
                        Usuario Emisor
                    </div>
                    <div class="col-md-4 border">
                       <asp:Label ID="lblUsuarioEmisor" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-2 border Color2">
                        Usuario Receptor
                    </div>
                    <div class="col-md-4 border" style="height: 22px">
                        <asp:TextBox class="form-control" ID="txtUsuarioRecep" runat="server" Text="" Width="100%" Height="100%"></asp:TextBox>

                    </div>
                </div>
                 <span style="float: right">
                    <asp:LinkButton ID="LinkButton1"
                        runat="server"
                        CssClass="btn btn-primary" OnClick="btnRefrescar_Click">
                                <span aria-hidden="true" class="glyphicon glyphicon-floppy-disk"></span>
                    </asp:LinkButton>                   
                </span>
            </div>
            <%--end panel boby--%>
        </div>
        <%--panel partes interesadas--%>

       <%-- <div class="panel panel-primary" runat="server">
            <div class="panel-heading">
                <h3 class="panel-title">Cotización</h3>
            </div>
            <div class="panel-body" style="text-align: center">--%>
               
                <%--<div class="row">
                    <div class="col-md-12 border" style="height: 500px">
                    </div>
                </div>

                <div class="row Color2">
                    <div class="col-md-6 border">
                        EMITE  PARTE EMISORA
                    </div>
                    <div class="col-md-6 border">
                        AUTORIZA
                    </div>
                </div>
                <div class="row Color3">
                    <div class="col-md-6 border">
                        "Soy responsable de la operación; su negociación y realización"
                    </div>
                    <div class="col-md-6 border">
                        "Las condiciones negociadas se encuentran bajo conformidad"
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 border" style="height: 200px">
                        Nombre según ficha; Timbre o Firma Electrónico
                    </div>
                    <div class="col-md-6 border" style="height: 200px">
                        Nombre según ficha; Timbre o Firma Electrónico
                    </div>
                </div>--%>
                



      <%--      </div>--%>
            <%--end panel boby--%>
       <%--  </div>--%>




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

