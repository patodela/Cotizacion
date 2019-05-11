<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Organizador_Familias.aspx.cs" Inherits="SistCotizacion.Organizador_Familias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


        <link href="Content/StylePaginacionGridview.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">


    <h2>Mantenedor SKU</h2>
    <hr />
    <div id="TabPanel" class="container">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#1" data-toggle="tab">Variables Estructurales</a>
            </li>
            <li><a href="#2" data-toggle="tab">Variables Generales</a>
            </li>
            <li><a href="#3" data-toggle="tab">Variables Especificas</a>
            </li>
            <li><a href="#4" data-toggle="tab">Identificadores</a>
            </li>
        </ul>

        <div class="tab-content ">
            <!-- Variables Estructurales -->
            <div class="tab-pane active" id="1">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3><strong>Organizadores y Familias</strong></h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="table-responsive">
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="gv_organizador" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gv_organizador_RowCancelingEdit" OnRowEditing="gv_organizador_RowEditing" DataKeyNames="id_org" OnRowUpdating="gv_organizador_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A a Z)" HeaderStyle-CssClass="active text-center" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelCodigoOrg" runat="server" Text='<%# Eval("cod_org") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center" Font-Bold="True"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ORGANIZADOR" HeaderStyle-CssClass=" danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("descripcion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_org" Visible="False" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No se encontraron datos.
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="table-responsive">
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GvFamilia" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GvFamilia_RowCancelingEdit" OnRowEditing="GvFamilia_RowEditing" DataKeyNames="cod_fam" OnRowUpdating="GvFamilia_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A a Z)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelCodigoOrg" runat="server" Text='<%# Eval("cod_fam") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FAMILIAS" HeaderStyle-CssClass="danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("descripcion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>

                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="cod_fam" Visible="False" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No se encontraron datos.
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Variables Generales -->
            <div class="tab-pane" id="2">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3><strong>Grupos y Articulos</strong></h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtNombreGrupo" CssClass="form-control" placeholder="Nombre grupo" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnAddGrupo" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnAddGrupo_Click" />
                                        <asp:HiddenField ID="TabName" runat="server" />
                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Grupo" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Grupo_RowCancelingEdit" OnRowEditing="GV_Grupo_RowEditing" DataKeyNames="id_grupo" OnRowUpdating="GV_Grupo_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00-99)" HeaderStyle-CssClass="active text-center" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelIdGrupo" runat="server" Text='<%# String.Format("{0:00}", Eval("id_grupo")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center" Font-Bold="True"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Grupo" HeaderStyle-CssClass=" danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditGrupo" CssClass="form-control" runat="server" Text='<%# Eval("nombre_grupo") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labelgrupo" runat="server" Text='<%# Eval("nombre_grupo") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_grupo" Visible="False" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No se encontraron datos.
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtArticulo" CssClass="form-control" placeholder="Nombre Articulo" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnAddArticulo" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnAddArticulo_Click" />

                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="Gv_Articulo" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="Gv_Articulo_RowCancelingEdit" OnRowEditing="Gv_Articulo_RowEditing" DataKeyNames="id_articulo" OnRowUpdating="Gv_Articulo_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00 a 999)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelCodigoOrg" runat="server" Text='<%# String.Format("{0:000}", Eval("id_articulo")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ARTICULO" HeaderStyle-CssClass="danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("nombre_articulo") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("nombre_articulo") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>

                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_articulo" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

            <!-- Variables Especificas -->
            <div class="tab-pane" id="3">
    
                <h3>Variables de Cuantificación Principal</h3>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3><strong>Caracteristicas</strong></h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-lg-12">
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtCaracteristica1" CssClass="form-control" placeholder="Caracteristica 1: Material" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnMaterial" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnMaterial_Click" />

                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Carac1_RowCancelingEdit" OnRowEditing="GV_Carac1_RowEditing" DataKeyNames="id_car1" OnRowUpdating="GV_Carac1_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00-99)" HeaderStyle-CssClass="active text-center" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblidcarac1" runat="server" Text='<%# String.Format("{0:00}", Eval("id_car1")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center" Font-Bold="True"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Caracteristica 1: Material" HeaderStyle-CssClass="danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditcarac1" CssClass="form-control" runat="server" Text='<%# Eval("material") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labelcarac1" runat="server" Text='<%# Eval("material") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_car1" Visible="False" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No se encontraron datos.
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtCarac2" CssClass="form-control" placeholder="Caracteristica 2: Talla" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnAddCarac2" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnAddCarac2_Click" />

                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac2" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Carac2_RowCancelingEdit" OnRowEditing="GV_Carac2_RowEditing" DataKeyNames="id_car2" OnRowUpdating="GV_Carac2_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00 a 99)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelidcarac2" runat="server" Text='<%# String.Format("{0:00}", Eval("id_car2")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Caracteristica 2: Talla" HeaderStyle-CssClass="danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditTalla" CssClass="form-control" runat="server" Text='<%# Eval("Talla") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("Talla") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>

                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_car2" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtCarac3" CssClass="form-control" placeholder="Caracteristica 3: Piedra principal" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnAddCarac3" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnAddCarac3_Click" />

                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac3" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Carac3_RowCancelingEdit" OnRowEditing="GV_Carac3_RowEditing" DataKeyNames="id_car3" OnRowUpdating="GV_Carac3_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00 a 99)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelidcarac3" runat="server" Text='<%# String.Format("{0:00}", Eval("id_car3")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Caracteristica 3: Piedra principal" HeaderStyle-CssClass="danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("Piedra_Principal") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("Piedra_Principal") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>

                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_car3" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Identificadores 4 caracteristicas -->
            <div class="tab-pane" id="4">
                <h3>Variables de identificacion</h3>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h4><strong>Caracteristicas</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12"> 
                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server">

                               <ContentTemplate>
                                  <asp:RequiredFieldValidator Display="Dynamic" ID="requiredIcar1" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar1" ControlToValidate="txtIcar1" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                <div class="form-inline">
                                    <a id="btnAddICar1" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica" ><span class="glyphicon glyphicon-plus"></span></a>
                                    <a id="btnSearchIcar1" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"> <span class="glyphicon glyphicon-search"></span></a>
                                    <div id="displaySearchIcar1" style="display:none;" class="input-group input-group-sm">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar1" placeholder="Buscar por..." />
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar1" ToolTip="Buscar" OnClick="btnBuscarIcar1_Click" Text="" runat="server" >
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                </asp:LinkButton>
                                        </span>
                                    </div>
                                     <div id="displayAddIcar1" style="display:none;"  class="input-group input-group-sm">                                    
                                      
                                         <asp:TextBox ID="txtIcar1" CssClass="form-control" placeholder="ingrese caracteristica 1" runat="server"></asp:TextBox>
                                         
                                        <span class="input-group-btn">
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ValidationGroup="GrpAddIcar1" runat="server" OnClick="btnIngresarIcar1_Click" >
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                  <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar1" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar1_Click" >
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                </div>
                                 
                                <asp:Panel ID="PanelGridIcar1"  CssClass="table-responsive" runat="server">
                                  <asp:GridView ID="GridIcar1" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridIcar1_PageIndexChanging" DataSourceID="SqlDataSourceIcar1" OnRowUpdating="GridIcar1_RowUpdating" OnRowCancelingEdit="GridIcar1_RowCancelingEdit" OnRowEditing="GridIcar1_RowEditing" DataKeyNames="id_icar1" PagerSettings-PageButtonCount="5">
                                             <Columns>
                                                 <asp:TemplateField HeaderText="(00 a 99)" SortExpression="id_icar1">                                                    
                                                     <ItemTemplate>
                                                         <asp:Label runat="server" Text='<%# String.Format("{0:00}", Eval("id_icar1")) %>' ID="labelIdIcar1"></asp:Label>
                                                     </ItemTemplate>
                                                      <ItemStyle HorizontalAlign="Center" />
                                                     <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                 </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Caracteristica 1" HeaderStyle-CssClass="danger text-center">
                                                     <EditItemTemplate>
                                                         <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("descripcion") %>' ID="txtDescripICAR1"></asp:TextBox>
                                                     </EditItemTemplate>
                                                     <ItemTemplate>
                                                         <asp:Label runat="server" Text='<%# Bind("descripcion") %>' ID="lblDescripcionICar1"></asp:Label>
                                                     </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Center" />
                                                 </asp:TemplateField>

                                                 <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True"></asp:CommandField>
                                             </Columns>
                                             <EmptyDataTemplate>
                                                 No se encontraron datos.
                                             </EmptyDataTemplate>
                                      <PagerStyle CssClass="pagination-ys" />
                                         </asp:GridView>
                                             </asp:Panel>
                                         <asp:SqlDataSource runat="server" ID="SqlDataSourceIcar1" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' 
                                             SelectCommand="SELECT  id_icar1, [descripcion] FROM [var_identi_car1] ORDER BY [id_icar1] DESC" 
                                             FilterExpression="descripcion LIKE '%{0}%'"                                             
                                             UpdateCommand="UPDATE [dbo].[var_identi_car1]
   SET [descripcion] = @descrip
      ,[fecha_upd] = GETDATE()
      ,[id_usuario] = @usuario
 WHERE id_icar1 = @idicar1"
                                             InsertCommand="INSERT INTO [dbo].[var_identi_car1]
           ([descripcion]
           ,[fecha_upd]
           ,[id_usuario])
     VALUES
           (@descripcion
           ,GETDATE()
           ,@usuario)">
                                             <InsertParameters>
                                                 <asp:Parameter Name="descripcion"></asp:Parameter>
                                                 <asp:Parameter Name="usuario"></asp:Parameter>
                                             </InsertParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="descrip"></asp:Parameter>
                                                 <asp:Parameter Name="usuario"></asp:Parameter>
                                                 <asp:Parameter Name="idicar1"></asp:Parameter>
                                             </UpdateParameters>
                                             <FilterParameters>
                                                 <asp:ControlParameter Name="descripcion" ControlID="TextSearchIcar1" PropertyName="Text" />
                                             </FilterParameters>
                                         </asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-4">
                                 <asp:UpdatePanel runat="server">

                               <ContentTemplate>
                                  <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorIcar2" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar2" ControlToValidate="txtIcar2" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                <div class="form-inline">
                                    <a id="btnAddICar2" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica" ><span class="glyphicon glyphicon-plus"></span></a>
                                    <a id="btnSearchIcar2" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"> <span class="glyphicon glyphicon-search"></span></a>
                                    <div id="displaySearchIcar2" style="display:none;" class="input-group input-group-sm">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar2" placeholder="Buscar por..." />
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar2" ToolTip="Buscar" OnClick="btnBuscarIcar2_Click" Text="" runat="server" >
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                </asp:LinkButton>
                                        </span>
                                    </div>
                                     <div id="displayAddIcar2" style="display:none;"  class="input-group input-group-sm">                                    
                                      
                                         <asp:TextBox ID="txtIcar2" CssClass="form-control" placeholder="ingrese caracteristica" runat="server"></asp:TextBox>
                                         
                                        <span class="input-group-btn">
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="btnIngresarIcar2" ValidationGroup="GrpAddIcar2" runat="server" OnClick="btnIngresarIcar2_Click" >
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                  <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar2" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar2_Click" >
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                </div>
                                 
                                <asp:Panel ID="Panel1"  CssClass="table-responsive" runat="server">
                                  <asp:GridView ID="GridIcar2" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridIcar2_PageIndexChanging" DataSourceID="SqlDataSourceIcar2" OnRowUpdating="GridIcar2_RowUpdating" OnRowCancelingEdit="GridIcar2_RowCancelingEdit" OnRowEditing="GridIcar2_RowEditing" DataKeyNames="id_icar2" PagerSettings-PageButtonCount="5">
                                             <Columns>
                                                 <asp:TemplateField HeaderText="(00 a 99)" SortExpression="id_icar2">                                                    
                                                     <ItemTemplate>
                                                         <asp:Label runat="server" Text='<%# String.Format("{0:00}", Eval("id_icar2")) %>' ID="labelIdIcar2"></asp:Label>
                                                     </ItemTemplate>
                                                      <ItemStyle HorizontalAlign="Center" />
                                                     <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                 </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Caracteristica 2" HeaderStyle-CssClass="danger text-center">
                                                     <EditItemTemplate>
                                                         <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("descripcion") %>' ID="txtDescripICAR2"></asp:TextBox>
                                                     </EditItemTemplate>
                                                     <ItemTemplate>
                                                         <asp:Label runat="server" Text='<%# Bind("descripcion") %>' ID="lblDescripcionICar2"></asp:Label>
                                                     </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Center" />
                                                 </asp:TemplateField>

                                                 <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True"></asp:CommandField>
                                             </Columns>
                                             <EmptyDataTemplate>
                                                 No se encontraron datos.
                                             </EmptyDataTemplate>
                                      <PagerStyle CssClass="pagination-ys" />
                                         </asp:GridView>
                                             </asp:Panel>
                                         <asp:SqlDataSource runat="server" ID="SqlDataSourceIcar2" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' 
                                             SelectCommand="SELECT  id_icar2, [descripcion] FROM [var_identi_car2] ORDER BY [id_icar2] DESC" 
                                             FilterExpression="descripcion LIKE '%{0}%'"                                             
                                             UpdateCommand="UPDATE [dbo].[var_identi_car2]
   SET [descripcion] = @descrip
      ,[fecha_upd] = GETDATE()
      ,[id_usuario] = @usuario
 WHERE id_icar2 = @idicar2"
                                             InsertCommand="INSERT INTO [dbo].[var_identi_car2]
           ([descripcion]
           ,[fecha_upd]
           ,[id_usuario])
     VALUES
           (@descripcion
           ,GETDATE()
           ,@usuario)">
                                             <InsertParameters>
                                                 <asp:Parameter Name="descripcion"></asp:Parameter>
                                                 <asp:Parameter Name="usuario"></asp:Parameter>
                                             </InsertParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="descrip"></asp:Parameter>
                                                 <asp:Parameter Name="usuario"></asp:Parameter>
                                                 <asp:Parameter Name="idicar2"></asp:Parameter>
                                             </UpdateParameters>
                                             <FilterParameters>
                                                 <asp:ControlParameter Name="descripcion" ControlID="TextSearchIcar2" PropertyName="Text" />
                                             </FilterParameters>
                                         </asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-4">

                            </div>

                        </div>

                        <div class="col-lg-4">
                            <div class="table-responsive">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropdownFamiliaIdenti1" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtCombi1Identi" CssClass="form-control" placeholder="ingrese combinacion 1" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btncombi1Identi" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btncombi1Identi_Click" />

                                </div>
                                <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Combi_identi1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Combi_identi1_RowCancelingEdit" OnRowEditing="GV_Combi_identi1_RowEditing" DataKeyNames="id_comb_1" OnRowUpdating="GV_Combi_identi1_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="(A00 a Z99)" HeaderStyle-CssClass="active text-center">
                                            <ItemTemplate>
                                                <asp:Label ID="labelidcarac2" runat="server" Text='<%# Eval("cod_letra") + String.Format("{0:00}", Eval("id_comb_1")) %>'></asp:Label>
                                            </ItemTemplate>

                                            <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Combinacion 1" HeaderStyle-CssClass="danger text-center">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("descripcion") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="labeldescrip" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                                            </ItemTemplate>

                                            <HeaderStyle CssClass="danger text-center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                            <HeaderStyle CssClass="active text-center"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="id_comb_1" Visible="False" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </div>
                     </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="Scripts/js/MantenedorSKU.js"></script>
</asp:Content>
