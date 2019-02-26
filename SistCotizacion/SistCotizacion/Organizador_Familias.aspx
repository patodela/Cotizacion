<%@ Page Title="" Language="C#" MasterPageFile="~/NavContenido.Master" AutoEventWireup="true" CodeBehind="Organizador_Familias.aspx.cs" Inherits="SistCotizacion.Organizador_Familias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNavContenido" runat="server">


    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h4><strong>Organizadores y Familias</strong></h4>
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
                        </asp:GridView>
                    </div>

                </div>
                <div class="col-lg-6">
                    <div class="table-responsive">
                        <asp:GridView CssClass="table table-bordered table-hover" ID="GvFamilia" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GvFamilia_RowCancelingEdit" OnRowEditing="GvFamilia_RowEditing" DataKeyNames="id_fam" OnRowUpdating="GvFamilia_RowUpdating">
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
                                <asp:BoundField DataField="id_fam" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </div>




</asp:Content>
