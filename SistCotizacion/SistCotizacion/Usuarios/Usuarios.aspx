﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SistCotizacion.Usuarios.Usuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
        function OcultarMostrarUsuario() {
            var Objeto = document.getElementById("Usuario");
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
                Usuario</h3>
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
                                            Nombre Usuario</label>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <asp:TextBox  ID="txtNombreUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>                                    
                                    <div class="col-xs-12 col-md-2">
                                        <label class="control-label">
                                            Estado</label>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <asp:DropDownList ID="dwlEstado" CssClass="form-control" runat="server">
                                            <asp:ListItem Selected="True" Value="1">Activo</asp:ListItem>
                                            <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                            <asp:ListItem Value="2">Todos</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnlimpiarUsuario" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>                                    
                            </div>
                            <div style="text-align: right">
                                <asp:LinkButton ID="btnBuscarUsuario" class="btn btn-primary" runat="server" 
                                     onclick="btnBuscarUsuario_Click">Buscar </asp:LinkButton>
                                <asp:LinkButton ID="btnlimpiarUsuario" class="btn btn-default" runat="server" >Limpiar</asp:LinkButton>
                            </div>                          
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading divMuestraOculta" onclick="OcultarMostrarUsuario()">
                        <h4 class="panel-title">
                            usuario <a><span class="glyphicon glyphicon-resize-full btnOcultaMuestra"></span>
                            </a>
                        </h4>
                    </div>
                    <div id="Usuario" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="jumbotron">
                                <div class="row">
                                    <div class="btn-group Derecha">
                                        <asp:LinkButton ID="btnagregarUsuario" runat="server" ToolTip="Agregar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-plus'></span>"
                                            CssClass="btn btn-default"  /> 
                                        <asp:LinkButton ID="btnEditarUsuario" runat="server" ToolTip="Editar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-pencil'></span>"
                                            CssClass="btn btn-default"  />
                                        <asp:LinkButton ID="btnEliminarAnexo" runat="server" ToolTip="Eliminar" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-minus'></span>"
                                            CssClass="btn btn-default" />
                                        <asp:LinkButton ID="btnVerAnexo" runat="server" ToolTip="ver" Text="<span style='color:#0FB71E;' class='glyphicon glyphicon-eye-open'></span>"
                                            CssClass="btn btn-default"  />
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                    <asp:GridView CssClass="GrillaComun" ID="griUsuario" runat="server" 
                                            Width="100%" AutoGenerateColumns="False" 
                                            
                                            DataKeyNames="ID_Usuario,fecha_Usuario,ID_Usuario_CLAS,NOMBRE_Usuario_CLAS,ID_Usuario_CLAS_TIPO,NOMBRE_Usuario_CLAS_TIPO,SOLICITANTE,ID_Usuario_ESTADO,NOMBRE_Usuario_ESTADO,ID_PRIORIDAD,ID_CLIENTE,id_cliente_sucursal,id_laboratorio,CORREO_SOLICITANTE,DESCRIPCION" 
                                            AutoGenerateSelectButton="True">
                                        <Columns>
                                            <asp:BoundField DataField="id_usuario" HeaderText="ID" >
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
                                            <asp:AsyncPostBackTrigger ControlID="btnBuscarUsuario" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnlimpiarUsuario" EventName="Click" />
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
