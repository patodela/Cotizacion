<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="relacionProductoSKU.aspx.cs" Inherits="SistCotizacion.relacionProductoSKU" %>
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
        <h3>Generar SKU por producto.</h3>
        <div class="panel panel-default">
            <div class="panel-body">

                
                   <div class="col-md-6 col-md-offset-3">
                       
                        <div class="form-inline">
                            <div class="form-group">
                            <label class="control-label">Nombre Producto: </label>
                    <asp:TextBox ID="txtNombreProd" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                      
                             <div class="form-group">
                             <asp:LinkButton ID="btnBuscar" CssClass="btn btn-info" runat="server" OnClick="btnBuscar_Click">
                                 <span aria-hidden="true" class=" glyphicon glyphicon-search"></span>
                                  Buscar
                             </asp:LinkButton>
                                 </div>
                         </div>
                   
                        </div>
                    
                                    
                                                                   
                

                        
                <asp:GridView ID="GVProductos" CssClass="table table-bordered table-responsive" runat="server" OnRowDataBound="GVProductos_RowDataBound" AutoGenerateColumns="False" OnSelectedIndexChanged="GVProductos_SelectedIndexChanged">
                      <Columns>
                          <asp:CommandField ShowSelectButton="True">
                          <HeaderStyle Width="20px" />
                          </asp:CommandField>
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
                <asp:BoundField HeaderText="Sku Proveedor 1" DataField="skuprovedor1" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Sku Proveedor 2" DataField="skuprovedor2" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Fecha ingreso" DataField="fecha_ingreso">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    </Columns>
                      <EmptyDataTemplate>
                          No se encontraron datos....
                      </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceBuscaProductosByName" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT [id_producto], [imagen], [nombre], [skuprovedor1], [skuprovedor2], [fecha_ingreso] FROM [producto] WHERE (([nombre] LIKE '%' + @nombre + '%') AND ([activo] = @activo)) ORDER BY [fecha_ingreso] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNombreProd" Name="nombre" PropertyName="Text" Type="String" DefaultValue="-1" />
                        <asp:Parameter DefaultValue="true" Name="activo" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
             
                      <div class="col-md-6 col-md-offset-3">
                          <div class="form-inline">
                            <div class="form-group">
                                 <label class="control-label">ID:</label>
                                <asp:Label ID="lblID" runat="server" CssClass="control-label" Text="0"></asp:Label>
                                &nbsp;&nbsp;
                                <label class="control-label"> - </label>
                                &nbsp;&nbsp;
                                 <label class="control-label">Nombre producto :</label>
                                <asp:Label ID="lblNomProducto" runat="server" CssClass="control-label" Text="."></asp:Label>
                                </div>
                              </div>
                          </div>

                   <table class="table table-responsive table-bordered">
                       <tr>
                           <td class="text-center">
                               <label class="control-label">Variables Estructurales :</label></td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Organizador : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboOrganizador" runat="server" DataSourceID="SqlDataSourceOrganizador" DataTextField="descripcion" DataValueField="id_org"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceOrganizador" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT id_org, cod_org + ' - ' + descripcion AS descripcion FROM dbo.organizador WHERE (LEN(descripcion) &gt; 0) ORDER BY cod_org"></asp:SqlDataSource>
                               </div>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Familia : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboFamilia" runat="server" DataSourceID="SqlDataSourceFamilia" DataTextField="descripcion" DataValueField="id_fam"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceFamilia" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT id_fam, cod_fam + ' - ' + descripcion AS descripcion FROM dbo.familia WHERE (LEN(descripcion) &gt; 0) ORDER BY cod_fam"></asp:SqlDataSource>
                               </div>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center">
                               <label class="control-label">Variables Generales :</label>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Grupo : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboGrupos" runat="server" DataSourceID="SqlDataSourceGrupos" DataTextField="nombre_grupo" DataValueField="id_grupo"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT  [id_grupo],RIGHT('00'+convert(varchar,id_grupo),2) +' - '+nombre_grupo As Nombre_Grupo FROM VAR_PRINCIPAL_GRUPO"></asp:SqlDataSource>
                               </div>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Articulos : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboArticulos" runat="server" DataSourceID="SqlDataSourceArticulos" DataTextField="nombre_articulo" DataValueField="id_articulo"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT [id_articulo], [nombre_articulo] FROM [var_principal_articulo]"></asp:SqlDataSource>
                               </div>
                           </td>
                       </tr>
                        <tr>
                           <td class="text-center">
                               <label class="control-label">Variables Especificas :</label>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Caracteristica 1 : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboCaracteristica1" runat="server" DataSourceID="SqlDataSourceCarac1" DataTextField="material" DataValueField="id_car1"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceCarac1" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT [id_car1], [material] FROM [vcp_caracteristica_1]"></asp:SqlDataSource>
                               </div>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Caracteristica 2 : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboCaracteristica2" runat="server" DataSourceID="SqlDataSourceCarac2" DataTextField="Talla" DataValueField="id_car2"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceCarac2" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT [id_car2], [Talla] FROM [vcp_caracteristica_2]"></asp:SqlDataSource>
                               </div>
                           </td>
                             <td>
                               <div class="form-group">
                                   <label class="control-label">Caracteristica 3 : </label>
                                   <asp:DropDownList CssClass="form-control" ID="cmboCaracteristica3" runat="server" DataSourceID="SqlDataSourceCarac3" DataTextField="Piedra_Principal" DataValueField="id_car3"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceCarac3" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="SELECT [id_car3], [Piedra_Principal] FROM [vcp_caracteristica_3]"></asp:SqlDataSource>
                               </div>
                           </td>
                       </tr>
                          <tr>
                           <td class="text-center">
                               <label class="control-label">Identificadores :</label>
                           </td>
                           <td>
                               <div class="form-group">
                                   <label class="control-label">Combinacion 1 : </label>
                                   <asp:DropDownList CssClass="form-control" ID="CmboIdentificacion1" runat="server" DataSourceID="SqlDataSourceIdenti1" DataTextField="descripcion" DataValueField="id_comb_1"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceIdenti1" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="
select id_comb_1,cod_comb_1 + ' - '+descripcion as descripcion from [dbo].[var_identi_combinacion_1]"></asp:SqlDataSource>
                               </div>
                           </td>
                           <td> 
                               <div class="form-group">
                                   <label class="control-label">Combinacion 2 : </label>
                                   <asp:DropDownList CssClass="form-control" ID="CmboIdentificacion2" runat="server" DataSourceID="SqlDataSourceCombi2" DataTextField="descripcion" DataValueField="id_comb_2"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSourceCombi2" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="select id_comb_2,cod_comb_2 + ' - '+descripcion as descripcion from [dbo].[var_identi_combinacion_2]"></asp:SqlDataSource>
                               </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="4" class="text-center">
                               <asp:Button ID="btnGuardar" CssClass="btn btn-default btn-lg" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                           </td>
                       </tr>
                   </table>




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

                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" ToolTip="Buscar">
                                  <span aria-hidden="true" class=" glyphicon glyphicon-search"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button ID="btnBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />--%>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        
                        <asp:GridView CssClass="table table-bordered table-responsive" ID="GridSku" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridSku_PageIndexChanging" DataSourceID="SqlDataSourceSelectSKUGrid" AutoGenerateEditButton="True">

                            <Columns>
                                <asp:BoundField DataField="idcombisku" HeaderText="idcombisku" InsertVisible="False" ReadOnly="True" SortExpression="idcombisku" />
                                <asp:BoundField DataField="Nombre_Prodcuto" HeaderText="Nombre_Prodcuto" SortExpression="Nombre_Prodcuto"></asp:BoundField>
                                <asp:BoundField DataField="Nombre_Prodcuto" HeaderText="Nombre_Prodcuto" SortExpression="Nombre_Prodcuto" />
                                <asp:BoundField DataField="Nombre_Organizador" HeaderText="Nombre_Organizador" ReadOnly="True" SortExpression="Nombre_Organizador" />
                                <asp:BoundField DataField="Nombre_Familia" HeaderText="Nombre_Familia" ReadOnly="True" SortExpression="Nombre_Familia" />
                                <asp:BoundField DataField="id_grupo" HeaderText="id_grupo" ReadOnly="True" InsertVisible="False" SortExpression="id_grupo" Visible="False"></asp:BoundField>

                                <asp:TemplateField HeaderText="Nombre_Articulo" SortExpression="Nombre_Articulo">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre_Articulo") %>'></asp:TextBox>--%>
                                        <asp:DropDownList ID="cmboEditGrupo" runat="server" SelectedValue='<%# Eval("id_grupo") %>' DataSourceID="SqlDataSourceGrupos" DataTextField="Nombre_Grupo" DataValueField="id_grupo"></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre_Articulo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:BoundField DataField="Caracteristica_1" HeaderText="Caracteristica_1" SortExpression="Caracteristica_1" />
                                    <asp:BoundField DataField="Caracteristica_2" HeaderText="Caracteristica_2" SortExpression="Caracteristica_2" />
                                    <asp:BoundField DataField="Caracteristica_3" HeaderText="Caracteristica_3" SortExpression="Caracteristica_3" />
                                    <asp:BoundField DataField="Combinacion_1" HeaderText="Combinacion_1" SortExpression="Combinacion_1" />
                                    <asp:BoundField DataField="Combinacion_2" HeaderText="Combinacion_2" SortExpression="Combinacion_2" />
                                    <asp:BoundField DataField="fecha_ingreso" HeaderText="fecha_ingreso" SortExpression="fecha_ingreso" />
                                    <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre_Usuario" SortExpression="Nombre_Usuario" />
                                    <asp:BoundField DataField="fecha_actualiza" HeaderText="fecha_actualiza" SortExpression="fecha_actualiza" />
                                </Columns>
                              
                                <EmptyDataTemplate>
                                    No se encontraron datos...
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="pagination-ys" />
                            </asp:GridView>
                      
                        <asp:SqlDataSource ID="SqlDataSourceSelectSKUGrid" runat="server" ConnectionString="<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>" SelectCommand="
SELECT 
s.[idcombisku],
 p.nombre as Nombre_Prodcuto,
 cod_org+' - '+ o.descripcion as Nombre_Organizador,
 cod_fam+' - '+f.descripcion as Nombre_Familia,
g.id_grupo,
 RIGHT('00'+CONVERT(varchar,g.id_grupo),2) +' - '+g.Nombre_Grupo AS Nombre_Grupo,
 A.Nombre_Articulo,
 C1.material as Caracteristica_1,
 C2.Talla as Caracteristica_2,
 C3.Piedra_Principal as Caracteristica_3,
 CB1.descripcion as Combinacion_1,
 CB2.descripcion as Combinacion_2,
 s.fecha_ingreso,
 u.nombre as Nombre_Usuario,
 s.fecha_actualiza
FROM [impexcom_sistema].[producto_combinacion_sku] S
JOIN [impexcom_sistema].[producto] P
ON P.id_producto = s.id_producto
join [dbo].[organizador] o
On o.id_org = s.id_org
JOIN [dbo].[familia] f
on f.id_fam = s.id_fam
Join [dbo].[var_principal_grupo] G
on G.id_grupo = s.id_grupo
join [dbo].[var_principal_articulo] A
on A.id_articulo = s.id_articulo
Join vcp_caracteristica_1 C1
On C1.id_car1 = s.id_car1
Join vcp_caracteristica_2 C2
On C2.id_car2 = s.id_car2
Join vcp_caracteristica_3 C3
On C3.id_car3 = s.id_car3
Join [dbo].[var_identi_combinacion_1] CB1
on CB1.id_comb_1 = s.id_comb1
Join [dbo].[var_identi_combinacion_2] CB2
on CB2.id_comb_2 = s.id_comb2
JOIN  [dbo].[usuario] u
on u.id_usuario = s.id_usuario
WHERE s.activo = 1
"></asp:SqlDataSource>
                      
                    </div>
                </div>



            </div>
        </div>
    </div>

</asp:Content>
