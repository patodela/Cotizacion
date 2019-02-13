<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Almacen.aspx.cs" Inherits="SistCotizacion.Mantenedores.Almacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
    <script type="text/javascript">
        function OcultarMostrarFiltro() {
            var Objeto = document.getElementById("Filtro");
            if (Objeto.style.display == "none") {
                Objeto.style.display = "";
            }
            else {
                Objeto.style.display = "none";
            }
        } 
    </script>
    <script type="text/javascript">
        function OcultarMostrarSolicitud() {
            var Objeto = document.getElementById("Solicitud");
            if (Objeto.style.display == "none") {
                Objeto.style.display = "";
            }
            else {
                Objeto.style.display = "none";
            }
        } 
    </script>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3>
                Consultar Solicitud</h3>
        </div>
        <div class="panel-body">
            <%--<img id="btn_ocultar" src="/Imagenes/Usuario.png" alt ="" style="cursor:pointer"
                       onclick="OcultarMostrarPanel()" />--%>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading divMuestraOculta" onclick="OcultarMostrarFiltro()">
                        <h4 class="panel-title">
                            Filtro <a><span class="glyphicon glyphicon-resize-full btnOcultaMuestra"></span>
                            </a>
                        </h4>
                    </div>
                    <div id="Filtro" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                            <div class="jumbotron">
                                <div class="row">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                    <div class="col-xs-12 col-md-2">
                                        <label class="control-label">
                                            N° Tickets</label>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <asp:TextBox  ID="txtNTickets" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-12 col-md-2">
                                        <label class="control-label">
                                            Fechas (Inicio-Fin)</label>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <asp:TextBox ID="txtFechaInicio" CssClass="form-control" runat="server"></asp:TextBox>
                                        <%--<asp:CalendarExtender ID="txtFechaInicio_CalendarExtender" runat="server" Enabled="True"
                                           format="dd/MM/yyyy" TargetControlID="txtFechaInicio">
                                        </asp:CalendarExtender>--%>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <asp:TextBox ID="txtFechaFin" CssClass="form-control" runat="server"></asp:TextBox>
                                       <%-- <asp:CalendarExtender ID="txtFechaFin_CalendarExtender" runat="server" Enabled="True"
                                           format="dd/MM/yyyy" TargetControlID="txtFechaFin">
                                        </asp:CalendarExtender>--%>
                                    </div>
                                    <div class="col-xs-12 col-md-2">
                                        <label class="control-label">
                                            Clasificación</label>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <asp:DropDownList ID="dwlFClasificacion" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-md-2">
                                        <label class="control-label">
                                            Estado</label>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <asp:DropDownList ID="dwlEstado" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnlimpiarSolicitud" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%-- row--%>
                                
                                    
                            </div>
                            <div style="text-align: right">
                                <asp:LinkButton ID="btnBuscarSolicitud" class="btn btn-primary" runat="server" 
                                     onclick="btnBuscarSolicitud_Click">Buscar </asp:LinkButton>
                                <asp:LinkButton ID="btnlimpiarSolicitud" class="btn btn-default" runat="server" 
                                    onclick="btnlimpiarSolicitud_Click">Limpiar</asp:LinkButton>
                            </div>
                            <%-- Jumbotron--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading divMuestraOculta" onclick="OcultarMostrarSolicitud()">
                        <h4 class="panel-title">
                            Solicitudes <a><span class="glyphicon glyphicon-resize-full btnOcultaMuestra"></span>
                            </a>
                        </h4>
                    </div>
                    <div id="Solicitud" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="jumbotron">
                                <div class="row">
                                    <div class="btn-group Derecha">
                                        <asp:LinkButton ID="btnagregarSolicitud" runat="server" ToolTip="Agregar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-plus'></span>"
                                            CssClass="btn btn-default" OnClick="btnagregarAnexo_Click" />
                                        <asp:LinkButton ID="btnEditarSolicitud" runat="server" ToolTip="Editar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-pencil'></span>"
                                            CssClass="btn btn-default" onclick="btnEditarSolicitud_Click" />
                                        <asp:LinkButton ID="btnEliminarAnexo" runat="server" ToolTip="Eliminar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-minus'></span>"
                                            CssClass="btn btn-default" onclick="btnEliminarAnexo_Click" />
                                        <asp:LinkButton ID="btnVerAnexo" runat="server" ToolTip="ver" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-eye-open'></span>"
                                            CssClass="btn btn-default" onclick="btnVerAnexo_Click" />
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                    <asp:GridView CssClass="GrillaComun" ID="griSolicitudes" runat="server" 
                                            Width="100%" AutoGenerateColumns="False" 
                                            
                                            DataKeyNames="ID_SOLICITUD,fecha_solicitud,ID_SOLICITUD_CLAS,NOMBRE_SOLICITUD_CLAS,ID_SOLICITUD_CLAS_TIPO,NOMBRE_SOLICITUD_CLAS_TIPO,SOLICITANTE,ID_SOLICITUD_ESTADO,NOMBRE_SOLICITUD_ESTADO,ID_PRIORIDAD,ID_CLIENTE,id_cliente_sucursal,id_laboratorio,CORREO_SOLICITANTE,DESCRIPCION" 
                                            AutoGenerateSelectButton="True">
                                        <Columns>
                                            <asp:BoundField DataField="ID_SOLICITUD" HeaderText="N° Tickets" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fecha_solicitud" HeaderText="Fecha" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NOMBRE_SOLICITUD_CLAS" HeaderText="Clasificación" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NOMBRE_SOLICITUD_CLAS_TIPO" HeaderText="Tipo" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SOLICITANTE" HeaderText="Solicitante" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NOMBRE_SOLICITUD_ESTADO" HeaderText="Estado" >
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No hay datos bajo los filtros seleccionados.
                                        </EmptyDataTemplate>
                                        <HeaderStyle CssClass="HeaderStyle" />
                                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                                    </asp:GridView>
                                    </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnBuscarSolicitud" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnlimpiarSolicitud" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--//cierre PanelGoup--%>
        </div>
        <%--Panel body--%>
    </div>
</asp:Content>
