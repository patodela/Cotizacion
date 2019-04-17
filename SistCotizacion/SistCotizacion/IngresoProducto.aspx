<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="IngresoProducto.aspx.cs" Inherits="SistCotizacion.IngresoProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type=text][id*=txtBuscar]').keyup(function () {
                var test = $(this).val();
                $("table[id*=gridProductos] tr").show();
                if (test.length != 0) {
                    $("table[id*=gridProductos] tr:has('span')").each(function () {
                        if ($(this).find("span[id*=Nombre]:contains(" + test + ")").length == 0)
                            $(this).hide();
                    });
                }
            });
        });
    </script>

    <link href="Content/StylePaginacionGridview.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">


    <div class="row">
        <h2>Ingreso de Productos</h2>
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
   <asp:Button ID="btnIngresaProd" runat="server"  CssClass="btn btn-default btn-lg" Text="Ingresar" OnClick="btnIngresaProd_Click" Width="150px" />
          </div>
  </div>
</div>

        

    </div>
    <div class="row">
            <%-- <asp:UpdatePanel ID="upGridProductos" runat="server">
            <ContentTemplate>--%>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4">
                        <strong>Listado productos ingresados.</strong>
                    </div>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="input-group input-group-sm">
                             <span class="input-group-btn">
                              <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn btn-success" ToolTip="Refrescar" OnClick="btnLimpiar_Click">
                                  <span aria-hidden="true" class="glyphicon glyphicon-refresh"></span>
                              </asp:LinkButton>
                          </span>
                            <asp:TextBox ID="txtBuscar" CssClass="form-control" placeholder="Producto..." runat="server"></asp:TextBox>
                            <span class="input-group-btn">
                               
                                <asp:LinkButton ID="btnBuscar" runat="server" CssClass="btn btn-info" ToolTip="Buscar" OnClick="btnBuscar_Click">
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
        <asp:GridView CssClass="table table-bordered table-responsive" ID="gridProductos" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridProductos_RowDataBound" AllowPaging="True" OnPageIndexChanging="gridProductos_PageIndexChanging" >
            <Columns>
                <asp:BoundField DataField="id_producto" HeaderText="Nº">
                <HeaderStyle Width="50px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <asp:Image ID="ImageProducto" runat="server" CssClass="img-responsive img-rounded" Height="90px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">                   
                    <ItemTemplate>
                        <asp:Label ID="Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Sku Proveedor 1" DataField="skuprov1" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Sku Proveedor 2" DataField="skuprov2" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Fecha ingreso" DataField="fecha_ingreso" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Fecha Actualizacion" DataField="fecha_actualiza" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Usuario" DataField="nombre_usuario" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Editar" HeaderStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEditarCell" class="btn btn-default" ToolTip="Editar"  runat="server" OnClick="btnEditarCell_Click">
                            <span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
                        </asp:LinkButton>                       
                    </ItemTemplate>

<HeaderStyle Width="50px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Eliminar" HeaderStyle-Width="50px">                  
                    <ItemTemplate>
                         <asp:LinkButton ID="btnDeleteProd" class="btn btn-danger" runat="server" ToolTip="Eliminar" OnClientClick="return confirm('Esta seguro de eliminar este producto?');" OnClick="btnDeleteProd_Click">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                        </asp:LinkButton>   
                    </ItemTemplate>

<HeaderStyle Width="50px"></HeaderStyle>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No se encontraron datos...
            </EmptyDataTemplate>
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>
    </div>
  </div>
</div>

                <!--Panel Edit Producto-->
                <asp:Panel ID="PanelEditProducto" runat="server">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Edicion de producto.</strong>
                        </div>
                        <div class="panel-body">
                               <div class="form-inline">
                                   <label class="control-label">Nº :</label>
                                   <asp:Label CssClass="control-label" ID="lblIdProd" runat="server"  Text="0"></asp:Label>
                                   </div>
                                   <div class="form-group">
                                    <label class="control-label">Imagen :</label>

                                    <asp:Image ID="ImageEdicion" runat="server" CssClass="img-responsive img-rounded" Height="90px" Width="100px" />                                  
                                </div>  
                                            
                                <div class="form-group">
                                    <label class="control-label">Seleccione Imagen a cambiar</label>
                                    <asp:FileUpload ID="FileUploadEditProduct" CssClass="form-control" runat="server" />
                                    <%--<ajaxToolkit:AsyncFileUpload ID="FileUploadEditProduct" CssClass="form-control"  runat="server" />--%>
                                    <p class="help-block">Imagen formato *.jpg|*.PNG</p>

                                </div>
                                <div class="form-group">
                                    <label class="control-label">Nombre :</label>
                                    <asp:TextBox ID="txtNombreEdit" CssClass="form-control" runat="server"></asp:TextBox>                                   
                                </div>
                                <div class="form-group">

                                    <label class="control-label">SKU Proveedor1:</label>
                                    <asp:TextBox ID="txtSku1Edit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">SKU Proveedor2:</label>
                                    <asp:TextBox ID="txtSku2Edit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                           
                            <div class="pull-left">
                                <asp:Button ID="btnCancelEditProd" runat="server" Text="Cancelar" Width="150px" CssClass="btn btn-danger" />
                            </div>
                            <div class="pull-right">
                                <asp:Button ID="btnEditProducto" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnEditProducto_Click" Width="150px" />
                            </div>
                        </div>
                    </div>

                </asp:Panel>
                <asp:HiddenField ID="HiddenFieldPopupPanelProducto" runat="server" />
                <ajaxToolkit:ModalPopupExtender ID="PopUpPanelEditProducto" TargetControlID="HiddenFieldPopupPanelProducto" OkControlID="btnCancelEditProd" PopupControlID="PanelEditProducto" runat="server"></ajaxToolkit:ModalPopupExtender>
       <%--     </ContentTemplate>                
             </asp:UpdatePanel>--%>
        
    </div>



</asp:Content>
