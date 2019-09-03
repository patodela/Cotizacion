<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="SearchPersonal.aspx.cs" Inherits="SistCotizacion.SearchPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/StylePaginacionGridview.css" rel="stylesheet" />
    <script type="text/javascript">


        function ConfirmAccion() {
                return confirm("¿Estas seguro de realizar esta accion sobre el registro?");
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">
     <div class="panel panel-default">
        <div class="panel-heading text-center"><strong>CLIENTE</strong></div>
        <div class="panel-body">
            <h3>Filtros</h3>
              <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Folio:</label>
                        <asp:TextBox ID="txtFolio" placeholder="Folio documento" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2">
                   <br />
                    <asp:Button ID="BtnBuscar" CssClass="btn btn-info" OnClick="BtnBuscar_Click" Width="120px" runat="server" Text="Buscar" />
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3">
                    <asp:LinkButton ID="btnRegistro" OnClick="btnRegistro_Click" CssClass="btn btn-info"  runat="server">
                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span> <strong>Ingresar </strong>
                    </asp:LinkButton>
                </div>
            </div>
         <br />
                <asp:GridView ID="GridListPersonal" CssClass="table table-bordered table-hover" AllowPaging="True" OnRowDataBound="GridListPersonal_RowDataBound" OnPageIndexChanging="GridListPersonal_PageIndexChanging" runat="server" DataKeyNames="id_personal" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="id_personal"></asp:BoundField>
                        <asp:BoundField HeaderText="Folio" DataField="codigo_folio"></asp:BoundField>
                        <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                        <asp:BoundField HeaderText="RUT(ID)" DataField="rut"></asp:BoundField>
                        <asp:BoundField HeaderText="Fecha Emision" DataField="fecha_emision"></asp:BoundField>
                        <asp:BoundField HeaderText="Usuario" DataField="nombre_usuario"></asp:BoundField>
                        <asp:TemplateField HeaderText="Estado">
                             <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("estado").Equals(1)? ProyectoDA.Enum.Estados.Activo.ToString() : ProyectoDA.Enum.Estados.Inactivo.ToString() %>'  ID="lblEstado"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Accion">
                            <ItemTemplate>
                                <div class="btn-group" role="group">
                                    <asp:LinkButton ID="btnEditarCell" runat="server" class="btn btn-primary"  OnClick="btnEditarCell_Click"  ToolTip="Editar">
                            <span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>                                   
                                    <asp:LinkButton ID="BntDesactivar" runat="server" OnClientClick="if (!ConfirmAccion()) return false;" OnClick="BntDesactivar_Click" class="btn btn-danger" ToolTip="Desactivar">
                                                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="BtnActivar" runat="server" class="btn btn-success" OnClientClick="if (!ConfirmAccion()) return false;" ToolTip="Activar" OnClick="BtnActivar_Click">
                            <span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
                                    </asp:LinkButton>
                                   </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No se encontraron datos.
                    </EmptyDataTemplate>
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
            
        </div>
 
    </div>

</asp:Content>
