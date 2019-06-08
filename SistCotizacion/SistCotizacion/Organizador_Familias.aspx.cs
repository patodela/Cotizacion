using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;
using System.Data;
using MSSQLSUL.Seguridad;


namespace SistCotizacion
{
    public partial class Organizador_Familias : System.Web.UI.Page
    {
        
    
       MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!Page.IsPostBack)
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                BindGridviewOrganizador(gv_organizador, DataUser);
                BindGridviewOrganizador(GvFamilia, DataUser);
                BindGridviewOrganizador(GV_Grupo, DataUser);
                BindGridviewOrganizador(Gv_Articulo, DataUser);
                //BindGridviewOrganizador(GV_Carac1, DataUser);
                BindGridviewOrganizador(GV_Carac2, DataUser);
                BindGridviewOrganizador(GV_Carac3, DataUser);
                //BindGridviewOrganizador(GV_CuantiSecund, DataUser);
                //BindGridviewOrganizador(GV_Combi1, DataUser);
                //BindGridviewOrganizador(GV_Combi2, DataUser);
                //BindGridviewOrganizador(GV_Combi_identi1, DataUser);
                //BindGridviewOrganizador(GV_Combi_identi2, DataUser);
                //FillComboboxFamilia(DropdownFamilia1);
                //FillComboboxFamilia(DropdownFamilia2);
                //FillComboboxFamilia(DropdownFamiliaIdenti1);
                //FillComboboxFamilia(DropdownFamiliaIdenti2);
                btnRefreshCombi_Click(sender, e);
                btnRefreshCarac1_Click(sender, e);


            }


        }





       public void BindGridviewOrganizador(GridView gvDatos,MSSQLSUL.Seguridad.Usuario DataUser)
        {
            try
            {
                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                DataTable data = new DataTable();

                switch (gvDatos.ID)
                {
                    case "gv_organizador":
                        data = Organizador.GetDataSKU(nombreTabla.ORGANIZADOR);
                        break;
                    case "GvFamilia":
                        data = Organizador.GetDataSKU(nombreTabla.FAMILIA);
                        Session["DataFamilia"] = data;
                        break;
                    case "GV_Grupo":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_PRINCIPAL_GRUPO);
                        Session["DataGrupo"] = data;
                        break;
                    case "Gv_Articulo":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_PRINCIPAL_ARTICULO);
                        Session["DataArticulo"] = data;
                        break;
                    case "GV_Carac1":
                        data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_1);
                        Session["DataCaracteristica1"] = data;
                        break;
                    case "GV_Carac2":
                        data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_2);
                        Session["DataCaracteristica2"] = data;
                        break;
                    case "GV_Carac3":
                        data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_3);
                        Session["DataCaracteristica3"] = data;
                        break;
                    case "GV_CuantiSecund":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_CUANTIFICACION_SECUNDARIA);//Piedra Secundaria
                        break;
                    case "GV_Combi1":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_CUANTI_COMBINACION_1);
                        Session["DataIdenticombi1"] = data;
                        break;
                    case "GV_Combi2":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_CUANTI_COMBINACION_2);
                        break;
                    case "GV_Combi_identi1":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_IDENTI_COMBINACION_1);
                        break;
                    case "GV_Combi_identi2":
                        data = Organizador.GetDataSKU(nombreTabla.VAR_IDENTI_COMBINACION_2);
                        break;
                    default:
                        break;
                }


                gvDatos.DataSource = data;
                gvDatos.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al consultar datos", "Error", ex);
            }
           
          
        }



        #region VARIABLES ESTRUCTURALES
            #region ORGANIZADOR
            protected void gv_organizador_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "1";
                gv_organizador.EditIndex = -1;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                BindGridviewOrganizador(gv_organizador, DataUser);
            }
            protected void gv_organizador_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "1";
                gv_organizador.EditIndex = e.NewEditIndex;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                BindGridviewOrganizador(gv_organizador, DataUser);
            }



            protected void gv_organizador_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                TabName.Value = "1";
                gv_organizador.EditIndex = -1;

                int id_organizacion;
                string descrip = string.Empty;
                descrip = ((TextBox)gv_organizador.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
                id_organizacion = Convert.ToInt32(gv_organizador.DataKeys[e.RowIndex].Value);
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                Organizador.actualiza_organizador(nombreTabla.ORGANIZADOR, id_organizacion, descrip);

                BindGridviewOrganizador(gv_organizador, DataUser);
                SqlDataSourceOrganizador.DataBind();
            }


            #endregion
            #region FAMILIA
            protected void GvFamilia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
                {
                    TabName.Value = "1";
                    GvFamilia.EditIndex = -1;
                    GvFamilia.DataSource = Session["DataFamilia"] as DataTable;
                    GvFamilia.DataBind();
                }
                protected void GvFamilia_RowEditing(object sender, GridViewEditEventArgs e)
                {
                    TabName.Value = "1";
                    GvFamilia.EditIndex = e.NewEditIndex;
                    GvFamilia.DataSource = Session["DataFamilia"] as DataTable;
                    GvFamilia.DataBind();
                }
                protected void GvFamilia_RowUpdating(object sender, GridViewUpdateEventArgs e)
                {

                    try
                    {
                        TabName.Value = "1";
                        GvFamilia.EditIndex = -1;

                        int id_familia;
                        string descrip = string.Empty;
                        descrip = ((TextBox)GvFamilia.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
                        id_familia = Convert.ToInt32(GvFamilia.DataKeys[e.RowIndex].Value);
                        DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                        OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                        Organizador.actualiza_organizador(nombreTabla.FAMILIA, id_familia, descrip);

                        btnRefreshFamilia_Click(sender, e);
                        (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
                    }
                    catch (Exception ex)
                    {
                        (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
                    }


                }
                public void FillComboboxFamilia(DropDownList combobox)
                {

                    OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                    DataTable data = new DataTable();
                    data = Organizador.GetDataSKU(nombreTabla.FAMILIA);
                    var datasource = from p in data.AsEnumerable()
                                     where p.Field<string>("descripcion") != null
                                     select new
                                     {
                                         id_fam = p.Field<int>("id_fam"),
                                         descripcion = p.Field<string>("cod_fam") + "-" + p.Field<string>("descripcion")
                                     };
                    combobox.DataSource = datasource;
                    combobox.DataTextField = "descripcion";
                    combobox.DataValueField = "id_fam";
                    combobox.DataBind();
                }

                protected void btnBuscarFamilia_Click(object sender, EventArgs e)
                {
                    try
                    {

                        string textfilter = txtSearchFamilia.Text;
                        DataTable dt = GetDataByTabla(nombreTabla.FAMILIA);
                        string filter = "descripcion LIKE '%" + textfilter + "%'";
                        dt.DefaultView.RowFilter = filter;
                        GvFamilia.DataSource = dt.DefaultView;
                        GvFamilia.DataBind();
                        dt = dt.DefaultView.ToTable();
                        Session["DataFamilia"] = dt;


                    }
                    catch (Exception ex)
                    {

                        (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
                    }
                }

                protected void btnAddFamilia_Click(object sender, EventArgs e)
                {
                    try
                    {
                        TabName.Value = "1";
                        string descripcion = txtFamilia.Text;
                        string codLetra = cmbOrganizadorFam.SelectedItem.Text.Substring(0, 1);
                        DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                        OrganizadorBL org = new OrganizadorBL(DataUser);
                        org.add_descripcion_SKU(nombreTabla.FAMILIA, descripcion, codLetra);
                        btnRefreshFamilia_Click(sender, e);
                        (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
                    }
                    catch (Exception ex)
                    {

                        (this.Master as NavContenido).MostrarError("Ha ocurrido un error ", "Error", ex);
                    }
                }

                protected void btnRefreshFamilia_Click(object sender, EventArgs e)
                {
                    DataTable dt = GetDataByTabla(nombreTabla.FAMILIA);
                    GvFamilia.DataSource = dt;
                    GvFamilia.DataBind();
                    Session["DataFamilia"] = dt;
                }

                protected void GvFamilia_PageIndexChanging(object sender, GridViewPageEventArgs e)
                {
                    try
                    {
                        TabName.Value = "4";
                        GvFamilia.PageIndex = e.NewPageIndex;
                        GvFamilia.DataSource = Session["DataFamilia"] as DataTable;
                        GvFamilia.DataBind();
                    }
                    catch (Exception ex)
                    {

                        (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
                    }
                }
                #endregion
        #endregion

        #region VARIABLES GENERALES
        #region GRUPO
        protected void GV_Grupo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Grupo.EditIndex = -1;
            GV_Grupo.DataSource = Session["DataGrupo"] as DataTable;
            GV_Grupo.DataBind();
        }

        protected void GV_Grupo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Grupo.EditIndex = e.NewEditIndex;
            GV_Grupo.DataSource = Session["DataGrupo"] as DataTable;
            GV_Grupo.DataBind();
        }

        protected void GV_Grupo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                TabName.Value = "2";
                GV_Grupo.EditIndex = -1;
                int id_grupo;
                string nombre_grupo = string.Empty;
                nombre_grupo = ((TextBox)GV_Grupo.Rows[e.RowIndex].FindControl("txtEditGrupo")).Text;
                id_grupo = Convert.ToInt32(GV_Grupo.DataKeys[e.RowIndex].Value);
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                Organizador.actualiza_organizador(nombreTabla.VAR_PRINCIPAL_GRUPO, id_grupo, nombre_grupo);
                btnRefreshGrupo_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
            }

        }

        protected void btnAddGrupo_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "2";
                string descripcion = txtNombreGrupo.Text;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                OrganizadorBL org = new OrganizadorBL(DataUser);
                org.add_descripcion_SKU(nombreTabla.VAR_PRINCIPAL_GRUPO, descripcion);
                btnRefreshGrupo_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
            }

        }
        protected void btnBuscarGrupo_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "2";
                string textfilter = txtSearchGrupo.Text;
                DataTable dt = GetDataByTabla(nombreTabla.VAR_PRINCIPAL_GRUPO);
                string filter = "nombre_grupo LIKE '%" + textfilter + "%'";
                dt.DefaultView.RowFilter = filter;
                GV_Grupo.DataSource = dt.DefaultView;
                GV_Grupo.DataBind();
                dt = dt.DefaultView.ToTable();
                Session["DataGrupo"] = dt;


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
            }
        }

        protected void btnRefreshGrupo_Click(object sender, EventArgs e)
        {
            DataTable dt = GetDataByTabla(nombreTabla.VAR_PRINCIPAL_GRUPO);
            GV_Grupo.DataSource = dt;
            GV_Grupo.DataBind();
            Session["DataGrupo"] = dt;
        }

        protected void GV_Grupo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                TabName.Value = "2";
                GV_Grupo.PageIndex = e.NewPageIndex;
                GV_Grupo.DataSource = Session["DataGrupo"] as DataTable;
                GV_Grupo.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }
        #endregion

             #region ARTICULO
        protected void Gv_Articulo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            Gv_Articulo.EditIndex = -1;
            Gv_Articulo.DataSource = Session["DataArticulo"] as DataTable;
            Gv_Articulo.DataBind();
        }

        protected void Gv_Articulo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            Gv_Articulo.EditIndex = e.NewEditIndex;
            Gv_Articulo.DataSource = Session["DataArticulo"] as DataTable;
            Gv_Articulo.DataBind();
        }

        protected void Gv_Articulo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TabName.Value = "2";
                Gv_Articulo.EditIndex = -1;
                int id_grupo;
                string nombre_grupo = string.Empty;
                nombre_grupo = ((TextBox)Gv_Articulo.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
                id_grupo = Convert.ToInt32(Gv_Articulo.DataKeys[e.RowIndex].Value);
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                Organizador.actualiza_organizador(nombreTabla.VAR_PRINCIPAL_ARTICULO, id_grupo, nombre_grupo);
                btnRefreshArticulo_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
            }

        }

        protected void btnAddArticulo_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "2";
                string descripcion = txtArticulo.Text;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                OrganizadorBL org = new OrganizadorBL(DataUser);
                org.add_descripcion_SKU(nombreTabla.VAR_PRINCIPAL_ARTICULO, descripcion);
                btnRefreshArticulo_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
            }


        }

        protected void btnBuscarArticulo_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "2";
                string textfilter = txtSearchArticulo.Text;
                DataTable dt = GetDataByTabla(nombreTabla.VAR_PRINCIPAL_ARTICULO);
                string filter = "nombre_articulo LIKE '%" + textfilter + "%'";
                dt.DefaultView.RowFilter = filter;
                Gv_Articulo.DataSource = dt.DefaultView;
                Gv_Articulo.DataBind();
                dt = dt.DefaultView.ToTable();
                Session["DataArticulo"] = dt;


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
            }
        }

        protected void btnRefreshArticulo_Click(object sender, EventArgs e)
        {
            DataTable dt = GetDataByTabla(nombreTabla.VAR_PRINCIPAL_ARTICULO);
            Gv_Articulo.DataSource = dt;
            Gv_Articulo.DataBind();
            Session["DataArticulo"] = dt;
        }

        protected void Gv_Articulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                TabName.Value = "2";
                Gv_Articulo.PageIndex = e.NewPageIndex;
                Gv_Articulo.DataSource = Session["DataArticulo"] as DataTable;
                Gv_Articulo.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        #endregion

        #endregion

        #region VARIABLES ESPECIFICAS

        #region CARACTERISTICA 1
        protected void GV_Carac1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "3";
                GV_Carac1.EditIndex = -1;
                GV_Carac1.DataSource = Session["DataCaracteristica1"] as DataTable;
                GV_Carac1.DataBind();
        }

            protected void GV_Carac1_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "3";
                GV_Carac1.EditIndex = e.NewEditIndex;
                GV_Carac1.DataSource = Session["DataCaracteristica1"] as DataTable;
                GV_Carac1.DataBind();
            
        }

            protected void GV_Carac1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "3";
                    GV_Carac1.EditIndex = -1;
                    int id_car1;
                    string nombre_carac1 = string.Empty;
                    nombre_carac1 = ((TextBox)GV_Carac1.Rows[e.RowIndex].FindControl("txtEditcarac1")).Text;
                    id_car1 = Convert.ToInt32(GV_Carac1.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                    Organizador.actualiza_organizador(nombreTabla.VCP_CARACTERISTICA_1, id_car1, nombre_carac1);
                    btnRefreshCarac1_Click(sender, e);
                    (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
                }
                catch (Exception ex)
                {
                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
                }


            }
            protected void GV_Carac1_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                try
                {
                    TabName.Value = "3";
                    GV_Carac1.PageIndex = e.NewPageIndex;
                    GV_Carac1.DataSource = Session["DataCaracteristica1"] as DataTable;
                    GV_Carac1.DataBind();
                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
                }
            }

            protected void btnRefreshCarac1_Click(object sender, EventArgs e)
            {
                DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_1);
                GV_Carac1.DataSource = dt;
                GV_Carac1.DataBind();
                Session["DataCaracteristica1"] = dt;
            }

            protected void AddCarac1_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "3";
                    string descripcion = txtCarac1.Text;
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    OrganizadorBL org = new OrganizadorBL(DataUser);
                    org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_1, descripcion);
                    btnRefreshCarac1_Click(sender, e);
                    (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
                }
                catch (Exception ex)
                {
                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
                }
            }

            protected void btnBuscarCarac1_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "3";
                    string textfilter = TextSearchCarac1.Text;
                    DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_1);
                    string filter = "material LIKE '%" + textfilter + "%'";
                    dt.DefaultView.RowFilter = filter;
                    GV_Carac1.DataSource = dt.DefaultView;
                    GV_Carac1.DataBind();
                    dt = dt.DefaultView.ToTable();
                    Session["DataCaracteristica1"] = dt;


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
                }
            }

        #endregion  

            #region CARACTERISTICA 2

        protected void btnAddCarac2_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "3";
                string descripcion = txtCarac2.Text;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                OrganizadorBL org = new OrganizadorBL(DataUser);
                org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_2, descripcion);
                btnRefreshCarac2_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
            }
            
        }

        protected void GV_Carac2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Carac2.EditIndex = -1;
            GV_Carac2.DataSource = Session["DataCaracteristica2"] as DataTable;
            GV_Carac2.DataBind();
        }

        protected void GV_Carac2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Carac2.EditIndex = e.NewEditIndex;
            GV_Carac2.DataSource = Session["DataCaracteristica2"] as DataTable;
            GV_Carac2.DataBind();
        }

        protected void GV_Carac2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TabName.Value = "2";
                GV_Carac2.EditIndex = -1;
                int id_car2;
                string nombre_carac2 = string.Empty;
                nombre_carac2 = ((TextBox)GV_Carac2.Rows[e.RowIndex].FindControl("txtEditTalla")).Text;
                id_car2 = Convert.ToInt32(GV_Carac2.DataKeys[e.RowIndex].Value);
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                Organizador.actualiza_organizador(nombreTabla.VCP_CARACTERISTICA_2, id_car2, nombre_carac2);
                btnRefreshCarac2_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
                
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
            }
           
        }

        protected void btnBuscarCarac2_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "3";
                string textfilter = txtSearchCarac2.Text;
                DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_2);
                string filter = "Talla LIKE '%" + textfilter + "%'";
                dt.DefaultView.RowFilter = filter;
                GV_Carac2.DataSource = dt.DefaultView;
                GV_Carac2.DataBind();
                dt = dt.DefaultView.ToTable();
                Session["DataCaracteristica2"] = dt;


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
            }
        }

        protected void btnRefreshCarac2_Click(object sender, EventArgs e)
        {
            DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_2);
            GV_Carac2.DataSource = dt;
            GV_Carac2.DataBind();
            Session["DataCaracteristica2"] = dt;
        }

        protected void GV_Carac2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                TabName.Value = "3";
                GV_Carac2.PageIndex = e.NewPageIndex;
                GV_Carac2.DataSource = Session["DataCaracteristica2"] as DataTable;
                GV_Carac2.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        #endregion

            #region CARACTERISTCA 3


        protected void btnAddCarac3_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "3";
                string descripcion = txtCarac3.Text;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                OrganizadorBL org = new OrganizadorBL(DataUser);
                org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_3, descripcion);
                btnRefreshCarac3_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
            }
            catch (Exception ex)
            {
                (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
            }
            
        }

        protected void GV_Carac3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac3.EditIndex = -1;
            GV_Carac3.DataSource = Session["DataCaracteristica3"] as DataTable;
            GV_Carac3.DataBind();
        }

        protected void GV_Carac3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Carac3.EditIndex = e.NewEditIndex;
            GV_Carac3.DataSource = Session["DataCaracteristica3"] as DataTable;
            GV_Carac3.DataBind();
        }

        protected void GV_Carac3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TabName.Value = "3";
                GV_Carac3.EditIndex = -1;
                int id_car3;
                string nombre_carac3 = string.Empty;
                nombre_carac3 = ((TextBox)GV_Carac3.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
                id_car3 = Convert.ToInt32(GV_Carac3.DataKeys[e.RowIndex].Value);
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                Organizador.actualiza_organizador(nombreTabla.VCP_CARACTERISTICA_3, id_car3, nombre_carac3);
                btnRefreshCarac3_Click(sender, e);
                (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
            }
            
        }


        protected void btnBuscarCarac3_Click(object sender, EventArgs e)
        {
            try
            {
                TabName.Value = "3";
                string textfilter = txtSearchCarac3.Text;
                DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_3);
                string filter = "Piedra_Principal LIKE '%" + textfilter + "%'";
                dt.DefaultView.RowFilter = filter;
                GV_Carac3.DataSource = dt.DefaultView;
                GV_Carac3.DataBind();
                dt = dt.DefaultView.ToTable();
                Session["DataCaracteristica3"] = dt;


            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
            }
        }

        protected void btnRefreshCarac3_Click(object sender, EventArgs e)
        {
            DataTable dt = GetDataByTabla(nombreTabla.VCP_CARACTERISTICA_3);
            GV_Carac3.DataSource = dt;
            GV_Carac3.DataBind();
            Session["DataCaracteristica3"] = dt;
        }

        protected void GV_Carac3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                TabName.Value = "3";
                GV_Carac3.PageIndex = e.NewPageIndex;
                GV_Carac3.DataSource = Session["DataCaracteristica3"] as DataTable;
                GV_Carac3.DataBind();
            }
            catch (Exception ex)
            {

                (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
            }
        }

        #endregion

        #endregion

        #region VARIABLES IDENTIFICADORES
        #region GRID IDENTIFICADOR CARACTERISTICA 1
        protected void btnIngresarIcar1_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string txtdescrip = txtIcar1.Text;
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    DataView dtcount = (DataView)SqlDataSourceIcar1.Select(DataSourceSelectArguments.Empty);
                    int cant = dtcount.Count;
                    OrganizadorBL Org = new OrganizadorBL(null);
                    int limite = Org.GetLimite(nombreTabla.VAR_IDENTI_CAR1);
                    if (cant < limite)
                    {
                        SqlDataSourceIcar1.InsertParameters["descripcion"].DefaultValue = txtdescrip;
                        SqlDataSourceIcar1.InsertParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                        SqlDataSourceIcar1.Insert();
                        GridIcar1.DataBind();
                        txtIcar1.Text = string.Empty;
                        (this.Master as NavContenido).MostrarMensaje("Caracteristica ingresada con exito!.");
                    }
                    else
                    {
                        (this.Master as NavContenido).MostrarMensaje("No puede ingresar valor, el limite es :" + limite.ToString());
                    }

                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar caracteristica", "Error", ex);
                }

            }

            protected void GridIcar1_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar1.EditIndex = e.NewEditIndex;
                GridIcar1.DataBind();

            }

            protected void GridIcar1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar1.EditIndex = -1;
                GridIcar1.DataBind();
            }

            protected void GridIcar1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GridIcar1.EditIndex = -1;
                    string descripcionIcar1 = ((TextBox)GridIcar1.Rows[e.RowIndex].FindControl("txtDescripICAR1")).Text;
                    int idICar1 = Convert.ToInt32(GridIcar1.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    SqlDataSourceIcar1.UpdateParameters["descrip"].DefaultValue = descripcionIcar1;
                    SqlDataSourceIcar1.UpdateParameters["idicar1"].DefaultValue = idICar1.ToString();
                    SqlDataSourceIcar1.UpdateParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                    SqlDataSourceIcar1.Update();
                    GridIcar1.DataBind();


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar caracteristica", "Error", ex);
                }



            }



            protected void GridIcar1_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridIcar1.PageIndex = e.NewPageIndex;
                GridIcar1.DataBind();
            }

            protected void btnBuscarIcar1_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
            }

            protected void btnRefreshIcar1_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
                TextSearchIcar1.Text = string.Empty;
                txtIcar1.Text = string.Empty;
            }


            #endregion

            #region GRID IDENTIFICADOR CARACTERISTICA 2
            protected void btnBuscarIcar2_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
            }

            protected void btnIngresarIcar2_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string txtdescrip = txtIcar2.Text;
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    DataView dtcount = (DataView)SqlDataSourceIcar2.Select(DataSourceSelectArguments.Empty);
                    int cant = dtcount.Count;
                    OrganizadorBL Org = new OrganizadorBL(null);
                    int limite = Org.GetLimite(nombreTabla.VAR_IDENTI_CAR1);
                    if (cant < limite)
                    {
                        SqlDataSourceIcar2.InsertParameters["descripcion"].DefaultValue = txtdescrip;
                        SqlDataSourceIcar2.InsertParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                        SqlDataSourceIcar2.Insert();
                        GridIcar2.DataBind();
                        txtIcar2.Text = string.Empty;
                        (this.Master as NavContenido).MostrarMensaje("Caracteristica ingresada con exito!.");
                    }
                    else
                    {
                        (this.Master as NavContenido).MostrarMensaje("No puede ingresar valor, el limite es :" + limite.ToString());
                    }

                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar caracteristica", "Error", ex);
                }
            }

            protected void btnRefreshIcar2_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
                TextSearchIcar2.Text = string.Empty;
                txtIcar2.Text = string.Empty;
            }

            protected void GridIcar2_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridIcar2.PageIndex = e.NewPageIndex;
                GridIcar2.DataBind();
            }

            protected void GridIcar2_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GridIcar2.EditIndex = -1;
                    string descripcionIcar2 = ((TextBox)GridIcar2.Rows[e.RowIndex].FindControl("txtDescripICAR2")).Text;
                    int idICar2 = Convert.ToInt32(GridIcar2.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    SqlDataSourceIcar2.UpdateParameters["descrip"].DefaultValue = descripcionIcar2;
                    SqlDataSourceIcar2.UpdateParameters["idicar2"].DefaultValue = idICar2.ToString();
                    SqlDataSourceIcar2.UpdateParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                    SqlDataSourceIcar2.Update();
                    GridIcar2.DataBind();


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar caracteristica", "Error", ex);
                }
            }

            protected void GridIcar2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar2.EditIndex = -1;
                GridIcar2.DataBind();
            }

            protected void GridIcar2_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar2.EditIndex = e.NewEditIndex;
                GridIcar2.DataBind();
            }


            #endregion

            #region GRID IDENTIFICADOR CARACTERISTICA 3
            protected void btnBuscarIcar3_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
            }

            protected void btnIngresarIcar3_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string txtdescrip = txtIcar3.Text;
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    DataView dtcount = (DataView)SqlDataSourceIcar3.Select(DataSourceSelectArguments.Empty);
                    int cant = dtcount.Count;
                    OrganizadorBL Org = new OrganizadorBL(null);
                    int limite = Org.GetLimite(nombreTabla.VAR_IDENTI_CAR1);
                    if (cant < limite)
                    {
                        SqlDataSourceIcar3.InsertParameters["descripcion"].DefaultValue = txtdescrip;
                        SqlDataSourceIcar3.InsertParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                        SqlDataSourceIcar3.Insert();
                        GridIcar3.DataBind();
                        txtIcar3.Text = string.Empty;
                        (this.Master as NavContenido).MostrarMensaje("Caracteristica ingresada con exito!.");
                    }
                    else
                    {
                        (this.Master as NavContenido).MostrarMensaje("No puede ingresar valor, el limite es :" + limite.ToString());
                    }

                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar caracteristica", "Error", ex);
                }
            }

            protected void btnRefreshIcar3_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
                TextSearchIcar3.Text = string.Empty;
                txtIcar3.Text = string.Empty;
            }

            protected void GridIcar3_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridIcar3.PageIndex = e.NewPageIndex;
                GridIcar3.DataBind();
            }

            protected void GridIcar3_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GridIcar3.EditIndex = -1;
                    string descripcionIcar3 = ((TextBox)GridIcar3.Rows[e.RowIndex].FindControl("txtDescripICAR3")).Text;
                    int idICar3 = Convert.ToInt32(GridIcar3.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    SqlDataSourceIcar3.UpdateParameters["descrip"].DefaultValue = descripcionIcar3;
                    SqlDataSourceIcar3.UpdateParameters["idicar3"].DefaultValue = idICar3.ToString();
                    SqlDataSourceIcar3.UpdateParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                    SqlDataSourceIcar3.Update();
                    GridIcar3.DataBind();


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar caracteristica", "Error", ex);
                }
            }

            protected void GridIcar3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar3.EditIndex = -1;
                GridIcar3.DataBind();
            }

            protected void GridIcar3_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar3.EditIndex = e.NewEditIndex;
                GridIcar3.DataBind();
            }
            #endregion

            #region GRID IDENTIFICADOR CARACTERISTICA 4
            protected void btnBuscarIcar4_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
            }

            protected void btnIngresarIcar4_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string txtdescrip = txtIcar4.Text;
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    DataView dtcount = (DataView)SqlDataSourceIcar4.Select(DataSourceSelectArguments.Empty);
                    int cant = dtcount.Count;
                    OrganizadorBL Org = new OrganizadorBL(null);
                    int limite = Org.GetLimite(nombreTabla.VAR_IDENTI_CAR1);
                    if (cant < limite)
                    {
                        SqlDataSourceIcar4.InsertParameters["descripcion"].DefaultValue = txtdescrip;
                        SqlDataSourceIcar4.InsertParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                        SqlDataSourceIcar4.Insert();
                        GridIcar4.DataBind();
                        txtIcar4.Text = string.Empty;
                        (this.Master as NavContenido).MostrarMensaje("Caracteristica ingresada con exito!.");
                    }
                    else
                    {
                        (this.Master as NavContenido).MostrarMensaje("No puede ingresar valor, el limite es :" + limite.ToString());
                    }

                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al ingresar caracteristica", "Error", ex);
                }
            }

            protected void btnRefreshIcar4_Click(object sender, EventArgs e)
            {
                TabName.Value = "4";
                TextSearchIcar4.Text = string.Empty;
                txtIcar4.Text = string.Empty;
            }

            protected void GridIcar4_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridIcar3.PageIndex = e.NewPageIndex;
                GridIcar3.DataBind();
            }

            protected void GridIcar4_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GridIcar4.EditIndex = -1;
                    string descripcionIcar4 = ((TextBox)GridIcar4.Rows[e.RowIndex].FindControl("txtDescripICAR4")).Text;
                    int idICar4 = Convert.ToInt32(GridIcar4.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    SqlDataSourceIcar4.UpdateParameters["descrip"].DefaultValue = descripcionIcar4;
                    SqlDataSourceIcar4.UpdateParameters["idicar4"].DefaultValue = idICar4.ToString();
                    SqlDataSourceIcar4.UpdateParameters["usuario"].DefaultValue = DataUser.id_usuario.ToString();
                    SqlDataSourceIcar4.Update();
                    GridIcar4.DataBind();


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar caracteristica", "Error", ex);
                }
            }

            protected void GridIcar4_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar4.EditIndex = -1;
                GridIcar4.DataBind();
            }

            protected void GridIcar4_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "4";
                GridIcar4.EditIndex = e.NewEditIndex;
                GridIcar4.DataBind();
            }
            #endregion

            #region  GRID IDENTIFICADOR COMBINACION 1
            protected void btncombi1Identi_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string descripcion = txtCombi1Identi.Text;
                    string codLetra = DropdownOrganizador.SelectedItem.Text.Substring(0, 1);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                    OrganizadorBL org = new OrganizadorBL(DataUser);
                    org.add_descripcion_SKU(nombreTabla.VAR_IDENTI_COMBINACION_1, descripcion, codLetra);
                    btnRefreshCombi_Click(sender, e);
                    (this.Master as NavContenido).MostrarMensaje("Datos ingresados correctamente.");
                }
                catch (Exception ex)
                {
                   (this.Master as NavContenido).MostrarError("Ha ocurrido un error ingresar datos", "Error", ex);
                }
             
            }

            protected void GV_Combi_identi1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                TabName.Value = "4";
                GV_Combi_identi1.EditIndex = -1;
                GV_Combi_identi1.DataSource = Session["DataIdenticombi1"] as DataTable;
                GV_Combi_identi1.DataBind();
            }

            protected void GV_Combi_identi1_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TabName.Value = "4";
                GV_Combi_identi1.EditIndex = e.NewEditIndex;
                GV_Combi_identi1.DataSource = Session["DataIdenticombi1"] as DataTable;
                GV_Combi_identi1.DataBind();

            }

            protected void GV_Combi_identi1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GV_Combi_identi1.EditIndex = -1;
                    int id_combi1;
                    string nombre_combi1 = string.Empty;
                    nombre_combi1 = ((TextBox)GV_Combi_identi1.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
                    id_combi1 = Convert.ToInt32(GV_Combi_identi1.DataKeys[e.RowIndex].Value);
                    DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

                    OrganizadorBL Organizador = new OrganizadorBL(DataUser);
                    Organizador.actualiza_organizador(nombreTabla.VAR_IDENTI_COMBINACION_1, id_combi1, nombre_combi1);
                    btnRefreshCombi_Click(sender, e);
                    (this.Master as NavContenido).MostrarMensaje("Datos actualizados correctamente.");
                }
                catch (Exception ex)
                {
                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al actualizar registro", "Error", ex);
                }
                
            }

            protected void btnBuscarCombiIdenti_Click(object sender, EventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    string textfilter = TextSearchCombi.Text;
                    DataTable dt = GetDataByTabla(nombreTabla.VAR_IDENTI_COMBINACION_1);
                    string filter = "descripcion LIKE '%" + textfilter + "%'";
                    dt.DefaultView.RowFilter = filter;
                    GV_Combi_identi1.DataSource = dt.DefaultView;
                    GV_Combi_identi1.DataBind();
                    dt = dt.DefaultView.ToTable();
                    Session["DataIdenticombi1"] = dt;


                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error al buscar registro", "Error", ex);
                }


            }

            protected void GV_Combi_identi1_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                try
                {
                    TabName.Value = "4";
                    GV_Combi_identi1.PageIndex = e.NewPageIndex;
                    GV_Combi_identi1.DataSource = Session["DataIdenticombi1"] as DataTable;
                    GV_Combi_identi1.DataBind();
                }
                catch (Exception ex)
                {

                    (this.Master as NavContenido).MostrarError("Ha ocurrido un error", "Error", ex);
                }



            }

            protected void btnRefreshCombi_Click(object sender, EventArgs e)
            {
                // TabName.Value = "4";
                DataTable dt = GetDataByTabla(nombreTabla.VAR_IDENTI_COMBINACION_1);
                GV_Combi_identi1.DataSource = dt;
                GV_Combi_identi1.DataBind();
                Session["DataIdenticombi1"] = dt;

            }
            #endregion
        #endregion


        public DataTable GetDataByTabla(nombreTabla _tabla)
        {
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            DataTable data = new DataTable();
            data = Organizador.GetDataSKU(_tabla);
            return data;
        }
       
    }
}