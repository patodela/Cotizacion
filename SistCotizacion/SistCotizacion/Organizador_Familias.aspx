﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Organizador_Familias.aspx.cs" Inherits="SistCotizacion.Organizador_Familias" %>

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
            <li><a href="#4" data-toggle="tab">Variables de Identificacion</a>
            </li>
            <li><a href="#5" data-toggle="tab">Identificador</a>
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
                                <asp:UpdatePanel runat="server" ID="udpFamilia">
                                    <ContentTemplate> 
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorFamilia" CssClass="control-label text-danger" ValidationGroup="GrpAddFamilia" ControlToValidate="txtFamilia" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddFamilia" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar Familia"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchFamilia" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchFamilia" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchFamilia" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarFamilia" ToolTip="Buscar" OnClick="btnBuscarFamilia_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddFamilia" style="display: none;" class="input-group input-group-sm">
                                                <asp:DropDownList ID="cmbOrganizadorFam" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceOrganizador" DataTextField="descripcion" DataValueField="id_org"></asp:DropDownList>
                                                <asp:TextBox ID="txtFamilia" CssClass="form-control" placeholder="Ingrese Familia" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="btnIngresarFamilia" OnClick="btnAddFamilia_Click" ValidationGroup="GrpAddFamilia" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshFamilia" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshFamilia_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>      
                                    <asp:GridView CssClass="table table-bordered table-hover" ID="GvFamilia" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GvFamilia_PageIndexChanging" OnRowCancelingEdit="GvFamilia_RowCancelingEdit" OnRowEditing="GvFamilia_RowEditing" DataKeyNames="id_fam" OnRowUpdating="GvFamilia_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField HeaderText="(A a Z)" HeaderStyle-CssClass="active text-center">
                                                <ItemTemplate>
                                                    <asp:Label ID="labelCodigoOrg" runat="server" Text='<%# String.Concat(Eval("cod_org"),Eval("cod_fam")) %>'></asp:Label>
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
                                        <PagerStyle CssClass="pagination-ys" />
                                    </asp:GridView>
                                <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="udpFamilia">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                    <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                </ContentTemplate>
                                </asp:UpdatePanel>
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
                                <asp:UpdatePanel runat="server" ID="udpGrupo">
                                    <ContentTemplate>

                                        <asp:HiddenField ID="TabName" runat="server" />
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorGrupo" CssClass="control-label text-danger" ValidationGroup="GrpAddGrupo" ControlToValidate="txtNombreGrupo" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddGrupo" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar Grupo"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchGrupo" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchGrupo" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchGrupo" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarGrupo" ToolTip="Buscar" OnClick="btnBuscarGrupo_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddGrupo" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtNombreGrupo" CssClass="form-control" placeholder="Ingrese grupo" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="AddGrupo" OnClick="btnAddGrupo_Click" ValidationGroup="GrpAddGrupo" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshGrupo" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshGrupo_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>
                                        <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Grupo" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GV_Grupo_PageIndexChanging" OnRowCancelingEdit="GV_Grupo_RowCancelingEdit" OnRowEditing="GV_Grupo_RowEditing" DataKeyNames="id_grupo" OnRowUpdating="GV_Grupo_RowUpdating">
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
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="udpGrupo">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-lg-6">
                                <asp:UpdatePanel runat="server" ID="udpArticulo">
                                    <ContentTemplate>

                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorArticulo" CssClass="control-label text-danger" ValidationGroup="GrpAddArticulo" ControlToValidate="txtArticulo" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddArticulo" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar Articulo"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchArticulo" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchArticulo" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchArticulo" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarArticulo" ToolTip="Buscar" OnClick="btnBuscarArticulo_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddArticulo" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtArticulo" CssClass="form-control" placeholder="Ingrese Articulo" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="AddArticulo" OnClick="btnAddArticulo_Click" ValidationGroup="GrpAddArticulo" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshArticulo" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshArticulo_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>
                                        <asp:GridView CssClass="table table-bordered table-hover" ID="Gv_Articulo" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="Gv_Articulo_PageIndexChanging" OnRowCancelingEdit="Gv_Articulo_RowCancelingEdit" OnRowEditing="Gv_Articulo_RowEditing" DataKeyNames="id_articulo" OnRowUpdating="Gv_Articulo_RowUpdating">
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
                                            <EmptyDataTemplate>
                                                No se encontraron datos.
                                            </EmptyDataTemplate>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="udpArticulo">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
                                <asp:UpdatePanel runat="server" ID="updGVCarac1">
                                    <ContentTemplate>

                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorMaterial" CssClass="control-label text-danger" ValidationGroup="GrpAddMaterial" ControlToValidate="txtCarac1" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddMaterial" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchMaterial" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchMaterial" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchCarac1" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarCarac1" ToolTip="Buscar" OnClick="btnBuscarCarac1_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddMaterial" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtCarac1" CssClass="form-control" placeholder="Ingrese caracteristica 1" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="AddCarac1" OnClick="AddCarac1_Click" ValidationGroup="GrpAddMaterial" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshCarac1" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshCarac1_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>
                                        <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac1" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GV_Carac1_PageIndexChanging" OnRowCancelingEdit="GV_Carac1_RowCancelingEdit" OnRowEditing="GV_Carac1_RowEditing" DataKeyNames="id_car1" OnRowUpdating="GV_Carac1_RowUpdating">
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
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGVCarac1">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                            <div class="col-lg-4">
                                <asp:UpdatePanel runat="server" ID="updGVCarac2">
                                    <ContentTemplate>


                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorCarac2" CssClass="control-label text-danger" ValidationGroup="GrpAddCarac2" ControlToValidate="txtCarac2" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddCarac2" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchCarac2" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchCarac2" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchCarac2" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarCarac2" ToolTip="Buscar" OnClick="btnBuscarCarac2_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddCarac2" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtCarac2" CssClass="form-control" placeholder="Ingrese caracteristica 2" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="AddCarac2" OnClick="btnAddCarac2_Click" ValidationGroup="GrpAddCarac2" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>

                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshCarac2" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshCarac2_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>

                                        <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac2" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GV_Carac2_PageIndexChanging" OnRowCancelingEdit="GV_Carac2_RowCancelingEdit" OnRowEditing="GV_Carac2_RowEditing" DataKeyNames="id_car2" OnRowUpdating="GV_Carac2_RowUpdating">
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
                                            <EmptyDataTemplate>
                                                No se encontraron datos.
                                            </EmptyDataTemplate>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGVCarac2">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-lg-4">
                                <asp:UpdatePanel runat="server" ID="updGVCarac3">
                                    <ContentTemplate>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorCarac3" CssClass="control-label text-danger" ValidationGroup="GrpAddCarac3" ControlToValidate="txtCarac3" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddCarac3" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchCarac3" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchCarac3" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchCarac3" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarCarac3" ToolTip="Buscar" OnClick="btnBuscarCarac3_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddCarac3" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtCarac3" CssClass="form-control" placeholder="Ingrese caracteristica 3" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="AddCarac3" OnClick="btnAddCarac3_Click" ValidationGroup="GrpAddCarac3" runat="server">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>

                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshCarac3" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshCarac3_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>
                                        <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Carac3" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GV_Carac3_PageIndexChanging" OnRowCancelingEdit="GV_Carac3_RowCancelingEdit" OnRowEditing="GV_Carac3_RowEditing" DataKeyNames="id_car3" OnRowUpdating="GV_Carac3_RowUpdating">
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
                                            <EmptyDataTemplate>
                                                No se encontraron datos.
                                            </EmptyDataTemplate>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGVCarac3">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <!-- variables de indentificacion  -->
            <div class="tab-pane" id="4">
                <h3>Variables de identificacion</h3>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h4><strong>Caracteristicas</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server" ID="updGridIcar1">

                                    <ContentTemplate>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="requiredIcar1" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar1" ControlToValidate="txtIcar1" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddICar1" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchIcar1" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchIcar1" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar1" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar1" ToolTip="Buscar" OnClick="btnBuscarIcar1_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddIcar1" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtIcar1" CssClass="form-control" placeholder="ingrese caracteristica 1" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ValidationGroup="GrpAddIcar1" runat="server" OnClick="btnIngresarIcar1_Click">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar1" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar1_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>

                                        <asp:Panel ID="PanelGridIcar1" CssClass="table-responsive" runat="server">
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
                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGridIcar1">
                                                <ProgressTemplate>
                                                    <div class="text-center">
                                                        <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
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
                                <asp:UpdatePanel runat="server" ID="updGridIcar2">

                                    <ContentTemplate>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorIcar2" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar2" ControlToValidate="txtIcar2" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddICar2" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchIcar2" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchIcar2" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar2" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar2" ToolTip="Buscar" OnClick="btnBuscarIcar2_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddIcar2" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtIcar2" CssClass="form-control" placeholder="ingrese caracteristica" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="btnIngresarIcar2" ValidationGroup="GrpAddIcar2" runat="server" OnClick="btnIngresarIcar2_Click">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar2" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar2_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>

                                        <asp:Panel ID="Panel1" CssClass="table-responsive" runat="server">
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
                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGridIcar2">
                                                <ProgressTemplate>
                                                    <div class="text-center">
                                                        <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
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
                                <asp:UpdatePanel runat="server" ID="updGridIcar3">

                                    <ContentTemplate>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar3" ControlToValidate="txtIcar3" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddICar3" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchIcar3" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchIcar3" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar3" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar3" ToolTip="Buscar" OnClick="btnBuscarIcar3_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddIcar3" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtIcar3" CssClass="form-control" placeholder="ingrese caracteristica" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary" ID="btnIngresarIcar3" ValidationGroup="GrpAddIcar3" runat="server" OnClick="btnIngresarIcar3_Click">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar3" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar3_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>

                                        <asp:Panel ID="Panel2" CssClass="table-responsive" runat="server">
                                            <asp:GridView ID="GridIcar3" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridIcar3_PageIndexChanging" DataSourceID="SqlDataSourceIcar3" OnRowUpdating="GridIcar3_RowUpdating" OnRowCancelingEdit="GridIcar3_RowCancelingEdit" OnRowEditing="GridIcar3_RowEditing" DataKeyNames="id_icar3" PagerSettings-PageButtonCount="5">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="(00 a 99)" SortExpression="id_icar3">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# String.Format("{0:00}", Eval("id_icar3")) %>' ID="labelIdIcar3"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Caracteristica 3" HeaderStyle-CssClass="danger text-center">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("descripcion") %>' ID="txtDescripICAR3"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("descripcion") %>' ID="lblDescripcionICar3"></asp:Label>
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
                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGridIcar3">
                                                <ProgressTemplate>
                                                    <div class="text-center">
                                                        <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </asp:Panel>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSourceIcar3" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>'
                                            SelectCommand="SELECT  id_icar3, [descripcion] FROM [var_identi_car3] ORDER BY [id_icar3] DESC"
                                            FilterExpression="descripcion LIKE '%{0}%'"
                                            UpdateCommand="UPDATE [dbo].[var_identi_car3]
   SET [descripcion] = @descrip
      ,[fecha_upd] = GETDATE()
      ,[id_usuario] = @usuario
 WHERE id_icar3 = @idicar3"
                                            InsertCommand="INSERT INTO [dbo].[var_identi_car3]
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
                                                <asp:Parameter Name="idicar3"></asp:Parameter>
                                            </UpdateParameters>
                                            <FilterParameters>
                                                <asp:ControlParameter Name="descripcion" ControlID="TextSearchIcar3" PropertyName="Text" />
                                            </FilterParameters>
                                        </asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="col-md-12">

                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server" ID="updGridIcar4">

                                    <ContentTemplate>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" CssClass="control-label text-danger" ValidationGroup="GrpAddIcar4" ControlToValidate="txtIcar4" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                        <div class="form-inline">
                                            <a id="btnAddICar4" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                            <a id="btnSearchIcar4" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                            <div id="displaySearchIcar4" style="display: none;" class="input-group input-group-sm">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchIcar4" placeholder="Buscar por..." />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarIcar4" ToolTip="Buscar" OnClick="btnBuscarIcar4_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <div id="displayAddIcar4" style="display: none;" class="input-group input-group-sm">

                                                <asp:TextBox ID="txtIcar4" CssClass="form-control" placeholder="ingrese caracteristica" runat="server"></asp:TextBox>

                                                <span class="input-group-btn">
                                                    <asp:LinkButton Text="" ToolTip="Ingresar" CssClass="btn btn-sm btn-primary" ID="btnIngresarIcar4" ValidationGroup="GrpAddIcar4" runat="server" OnClick="btnIngresarIcar4_Click">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                            <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshIcar4" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshIcar4_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                            </asp:LinkButton>
                                        </div>

                                        <asp:Panel ID="Panel3" CssClass="table-responsive" runat="server">
                                            <asp:GridView ID="GridIcar4" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridIcar4_PageIndexChanging" DataSourceID="SqlDataSourceIcar4" OnRowUpdating="GridIcar4_RowUpdating" OnRowCancelingEdit="GridIcar4_RowCancelingEdit" OnRowEditing="GridIcar4_RowEditing" DataKeyNames="id_icar4" PagerSettings-PageButtonCount="5">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="(00 a 99)" SortExpression="id_icar4">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# String.Format("{0:00}", Eval("id_icar4")) %>' ID="labelIdIcar4"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="active text-center"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Caracteristica 4" HeaderStyle-CssClass="danger text-center">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("descripcion") %>' ID="txtDescripICAR4"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("descripcion") %>' ID="lblDescripcionICar4"></asp:Label>
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
                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGridIcar4">
                                                <ProgressTemplate>
                                                    <div class="text-center">
                                                        <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                         <label class="label-info">Espere por favor...</label>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </asp:Panel>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSourceIcar4" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>'
                                            SelectCommand="SELECT  id_icar4, [descripcion] FROM [var_identi_car4] ORDER BY [id_icar4] DESC"
                                            FilterExpression="descripcion LIKE '%{0}%'"
                                            UpdateCommand="UPDATE [dbo].[var_identi_car4]
   SET [descripcion] = @descrip
      ,[fecha_upd] = GETDATE()
      ,[id_usuario] = @usuario
 WHERE id_icar4 = @idicar4"
                                            InsertCommand="INSERT INTO [dbo].[var_identi_car4]
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
                                                <asp:Parameter Name="idicar4"></asp:Parameter>
                                            </UpdateParameters>
                                            <FilterParameters>
                                                <asp:ControlParameter Name="descripcion" ControlID="TextSearchIcar4" PropertyName="Text" />
                                            </FilterParameters>
                                        </asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <!-- Identificador -->
            <div class="tab-pane" id="5">

                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h4><strong>Identificador</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server" ID="updGridCombiIdenti">
                                    <ContentTemplate>
                                        <div class="table-responsive">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidatorCombi" CssClass="control-label text-danger" ValidationGroup="GrpAddCombi" ControlToValidate="txtCombi1Identi" runat="server" ErrorMessage="*Debe ingresar un valor."></asp:RequiredFieldValidator>
                                            <div class="form-inline">
                                                <a id="btnAddCombi" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Ingresar caracteristica"><span class="glyphicon glyphicon-plus"></span></a>
                                                <a id="btnSearchCombi" class="btn btn-sm btn-info" data-toggle="tooltip" data-placement="top" title="Buscar"><span class="glyphicon glyphicon-search"></span></a>
                                                <div id="displayAddcombi" style="display: none;">
                                                    <div class="form-group input-group-sm">
                                                        <asp:DropDownList ID="DropdownOrganizador" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceOrganizador" DataTextField="descripcion" DataValueField="id_org"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSourceOrganizador" ConnectionString='<%$ ConnectionStrings:impexcom_cotizacionConnectionString %>' SelectCommand="SELECT [id_org], [cod_org]+' - ' + [descripcion] AS [descripcion]  FROM [organizador] WHERE ([descripcion] IS NOT NULL)"></asp:SqlDataSource>

                                                    </div>
                                                    <br />
                                                    <div class="input-group input-group-sm">

                                                        <asp:TextBox ID="txtCombi1Identi" CssClass="form-control" placeholder="ingrese combinacion" runat="server"></asp:TextBox>
                                                        <span class="input-group-btn">
                                                            <asp:LinkButton Text="" ToolTip="Ingresar" CssClass="btn btn-sm btn-primary" ID="btnIngresarCombi" ValidationGroup="GrpAddCombi" runat="server" OnClick="btncombi1Identi_Click">
                                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                                                            </asp:LinkButton>
                                                        </span>
                                                    </div>


                                                </div>
                                                <div id="displaySearchCombi" style="display: none;" class="input-group input-group-sm">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="TextSearchCombi" placeholder="Buscar por..." />
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton CssClass="btn btn-sm btn-primary" ID="btnBuscarCombiIdenti" ToolTip="Buscar" OnClick="btnBuscarCombiIdenti_Click" Text="" runat="server">
                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                                        </asp:LinkButton>
                                                    </span>
                                                </div>
                                                <asp:LinkButton Text="" CssClass="btn btn-sm btn-primary pull-right" ID="btnRefreshCombi" ToolTip="Refrescar tabla" runat="server" OnClick="btnRefreshCombi_Click">
                                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <asp:GridView CssClass="table table-bordered table-hover" ID="GV_Combi_identi1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowCancelingEdit="GV_Combi_identi1_RowCancelingEdit" OnRowEditing="GV_Combi_identi1_RowEditing" DataKeyNames="id_comb_1" OnRowUpdating="GV_Combi_identi1_RowUpdating" OnPageIndexChanging="GV_Combi_identi1_PageIndexChanging" PagerSettings-PageButtonCount="5">
                                            <Columns>
                                                <asp:TemplateField HeaderText="(A00000 a Z99999)" HeaderStyle-CssClass="active text-center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelidcarac2" runat="server" Text='<%# Eval("cod_comb_1")  %>'></asp:Label>
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
                                            <EmptyDataTemplate>
                                                No se encontraron datos.
                                            </EmptyDataTemplate>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updGridCombiIdenti">
                                            <ProgressTemplate>
                                                <div class="text-center">
                                                    <img src="Imagenes/Dual%20Ring-1s-30px.gif" />
                                                     <label class="label-info">Espere por favor...</label>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

        <script src="Scripts/js/MantenedorSKU.js"></script>
</asp:Content>
