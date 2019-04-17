<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Organizador_Familias.aspx.cs" Inherits="SistCotizacion.Organizador_Familias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <script type="text/javascript">

        $(document).ready(function () {
           
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "1";
                $('#TabPanel a[href="#' + tabName + '"]').tab('show');
                $("#TabPanel a").click(function () {
                    $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
                });
        });
        
</script>

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
                                            <asp:TemplateField HeaderText="FAMILIAS" HeaderStyle-CssClass=" danger text-center">
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
                                                    <asp:Label ID="labelCodigoOrg" runat="server" Text='<%# String.Format("{0:00}", Eval("id_articulo")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ARTICULO" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:TemplateField HeaderText="Caracteristica 1: Material" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:TemplateField HeaderText="Caracteristica 2: Talla" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:TemplateField HeaderText="Caracteristica 3: Piedra principal" HeaderStyle-CssClass=" danger text-center">
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
            <div class="tab-pane" id="3">
                <h3>Variables de cuantificacion secundaria</h3>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3><strong>Variables de Cuantificacion secundaria y tercearia</strong></h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-lg-12">
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                        <div class="form-group">

                                            <asp:TextBox ID="txtCuantiSecund" CssClass="form-control" placeholder="Piedra Secundaria" runat="server"></asp:TextBox>
                                        </div><asp:Button ID="btnAddPiedraSecundaria" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnAddPiedraSecundaria_Click" />
                                        
                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_CuantiSecund" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_CuantiSecund_RowCancelingEdit" OnRowEditing="GV_CuantiSecund_RowEditing" DataKeyNames="id_secundaria" OnRowUpdating="GV_CuantiSecund_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(00-99)" HeaderStyle-CssClass="active text-center" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblidsecundaria" runat="server" Text='<%# String.Format("{0:00}", Eval("id_secundaria")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center" Font-Bold="True"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Piedra Secundaria" HeaderStyle-CssClass=" danger text-center">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditDescrip" CssClass="form-control" runat="server" Text='<%# Eval("piedra_secundaria") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="labelpiedrasecund" runat="server" Text='<%# Eval("piedra_secundaria") %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass=" danger text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Acción" HeaderStyle-CssClass="active text-center" ShowEditButton="True">
                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="id_secundaria" Visible="False" />
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
                                            <asp:DropDownList ID="DropdownFamilia1" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtComb1" CssClass="form-control" placeholder="Nombre: combinacion 1" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btncombi1" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btncombi1_Click" />

                                    </div>
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Combi1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Combi1_RowCancelingEdit" OnRowEditing="GV_Combi1_RowEditing" DataKeyNames="id_comb_1" OnRowUpdating="GV_Combi1_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A000 a Z999)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelidcarac2" runat="server" Text='<%# String.Format("{0:000}", Eval("id_comb_1")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Combinacion 1" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:BoundField DataField="id_comb_1" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                         <div class="form-group">
                                            <asp:DropDownList ID="DropdownFamilia2" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtCombi2" CssClass="form-control" placeholder="Nombre combinacion 2" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnCombi2" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btnCombi2_Click" />
                                       
                                    </div>
                                     <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Combi2" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Combi2_RowCancelingEdit" OnRowEditing="GV_Combi2_RowEditing" DataKeyNames="id_comb_2" OnRowUpdating="GV_Combi2_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A000 a Z999)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcombi2" runat="server" Text='<%# String.Format("{0:000}", Eval("id_comb_2")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Combinacion 2" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:BoundField DataField="id_comb_2" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="4">
                <h3>Variables de identificacion</h3>

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
                                            <asp:TemplateField HeaderText="Combinacion 1" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:BoundField DataField="id_comb_1" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                            <div class="col-lg-4">
                                <div class="table-responsive">
                                    <div class="form-inline">

                                         <div class="form-group">
                                            <asp:DropDownList ID="DropdownFamiliaIdenti2" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtCombi2Identi" CssClass="form-control" placeholder="Nombre combinacion 2" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btncombi2Identi" runat="server" CssClass="btn btn-default" Text="Ingresar" OnClick="btncombi2Identi_Click" />
                                       
                                    </div>
                                     <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Combi_identi2" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_Combi_identi2_RowCancelingEdit" OnRowEditing="GV_Combi_identi2_RowEditing" DataKeyNames="id_comb_2" OnRowUpdating="GV_Combi_identi2_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A00 a Z99)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcombi2" runat="server" Text='<%# Eval("cod_letra") + String.Format("{0:00}", Eval("id_comb_2")) %>'></asp:Label>
                                                </ItemTemplate>

                                                <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="combinacion 2" HeaderStyle-CssClass=" danger text-center">
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
                                            <asp:BoundField DataField="id_comb_2" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
            </div>
        </div>
    </div>






</asp:Content>
