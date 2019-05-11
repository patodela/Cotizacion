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
                BindGridviewOrganizador(GV_Carac1, DataUser);
                BindGridviewOrganizador(GV_Carac2, DataUser);
                BindGridviewOrganizador(GV_Carac3, DataUser);
                //BindGridviewOrganizador(GV_CuantiSecund, DataUser);
                //BindGridviewOrganizador(GV_Combi1, DataUser);
                //BindGridviewOrganizador(GV_Combi2, DataUser);
                BindGridviewOrganizador(GV_Combi_identi1, DataUser);
                //BindGridviewOrganizador(GV_Combi_identi2, DataUser);
                //FillComboboxFamilia(DropdownFamilia1);
                //FillComboboxFamilia(DropdownFamilia2);
                //FillComboboxFamilia(DropdownFamiliaIdenti1);
                //FillComboboxFamilia(DropdownFamiliaIdenti2);

            }


        }



        protected void gv_organizador_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "1";
            gv_organizador.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(gv_organizador,DataUser);
        }


       public void BindGridviewOrganizador(GridView gvDatos,MSSQLSUL.Seguridad.Usuario DataUser)
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
                    break;
                case "GV_Grupo":
                    data = Organizador.GetDataSKU(nombreTabla.VAR_PRINCIPAL_GRUPO); 
                    break;
                case "Gv_Articulo":
                    data = Organizador.GetDataSKU(nombreTabla.VAR_PRINCIPAL_ARTICULO);
                    break;
                case "GV_Carac1":
                    data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_1);
                    break;
                case "GV_Carac2":
                    data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_2);
                    break;
                case "GV_Carac3":
                    data = Organizador.GetDataSKU(nombreTabla.VCP_CARACTERISTICA_3);
                    break;
                case "GV_CuantiSecund":
                    data = Organizador.GetDataSKU(nombreTabla.VAR_CUANTIFICACION_SECUNDARIA);//Piedra Secundaria
                    break;
                case "GV_Combi1":
                    data = Organizador.GetDataSKU(nombreTabla.VAR_CUANTI_COMBINACION_1);
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

        protected void GvFamilia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "1";
            GvFamilia.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GvFamilia,DataUser);
        }

        protected void gv_organizador_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "1";
            gv_organizador.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(gv_organizador,DataUser);
        }

        protected void GvFamilia_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "1";
            GvFamilia.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GvFamilia,DataUser);
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

        }

        protected void GvFamilia_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "1";
            GvFamilia.EditIndex = -1;

            int id_familia;
            string descrip = string.Empty;
            descrip = ((TextBox)GvFamilia.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_familia = Convert.ToInt32(gv_organizador.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.FAMILIA, id_familia, descrip);

            BindGridviewOrganizador(GvFamilia, DataUser);
            //FillComboboxFamilia(DropdownFamilia1);
            //FillComboboxFamilia(DropdownFamilia2);
            //FillComboboxFamilia(DropdownFamiliaIdenti1);
            //FillComboboxFamilia(DropdownFamiliaIdenti2);
        }

        protected void GV_Grupo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Grupo.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Grupo, DataUser);
        }

        protected void GV_Grupo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Grupo.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Grupo, DataUser);
        }

        protected void GV_Grupo_RowUpdating(object sender, GridViewUpdateEventArgs e)
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

            BindGridviewOrganizador(GV_Grupo, DataUser);
        }

        protected void btnAddGrupo_Click(object sender, EventArgs e)
        {
            TabName.Value = "2";
            string descripcion = txtNombreGrupo.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);            
            org.add_descripcion_SKU(nombreTabla.VAR_PRINCIPAL_GRUPO, descripcion);
            BindGridviewOrganizador(GV_Grupo, DataUser);
        }

        protected void Gv_Articulo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            Gv_Articulo.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(Gv_Articulo, DataUser);
        }

        protected void Gv_Articulo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            Gv_Articulo.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(Gv_Articulo, DataUser);
        }

        protected void Gv_Articulo_RowUpdating(object sender, GridViewUpdateEventArgs e)
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

            BindGridviewOrganizador(Gv_Articulo, DataUser);
        }

        protected void btnAddArticulo_Click(object sender, EventArgs e)
        {
            TabName.Value = "2";
            string descripcion = txtArticulo.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_PRINCIPAL_ARTICULO, descripcion);
            BindGridviewOrganizador(Gv_Articulo, DataUser);
        }

        protected void btnMaterial_Click(object sender, EventArgs e)
        {
            TabName.Value = "2";
            string descripcion = txtCaracteristica1.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_1, descripcion);
            BindGridviewOrganizador(GV_Carac1, DataUser);
        }

        protected void GV_Carac1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac1.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac1, DataUser);
        }

        protected void GV_Carac1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac1.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac1, DataUser);
        }

        protected void GV_Carac1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac1.EditIndex = -1;
            int id_car1;
            string nombre_carac1 = string.Empty;
            nombre_carac1 = ((TextBox)GV_Carac1.Rows[e.RowIndex].FindControl("txtEditcarac1")).Text;
            id_car1 = Convert.ToInt32(GV_Carac1.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VCP_CARACTERISTICA_1, id_car1, nombre_carac1);

            BindGridviewOrganizador(GV_Carac1, DataUser);
        }

        protected void btnAddCarac2_Click(object sender, EventArgs e)
        {
            TabName.Value = "2";
            string descripcion = txtCarac2.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_2, descripcion);
            BindGridviewOrganizador(GV_Carac2, DataUser);
        }

        protected void GV_Carac2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac2.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac2, DataUser);
        }

        protected void GV_Carac2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac2.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac2, DataUser);
        }

        protected void GV_Carac2_RowUpdating(object sender, GridViewUpdateEventArgs e)
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

            BindGridviewOrganizador(GV_Carac2, DataUser);
        }

        protected void btnAddCarac3_Click(object sender, EventArgs e)
        {
            TabName.Value = "2";
            string descripcion = txtCarac3.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VCP_CARACTERISTICA_3, descripcion);
            BindGridviewOrganizador(GV_Carac3, DataUser);
        }

        protected void GV_Carac3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac3.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac3, DataUser);
        }

        protected void GV_Carac3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac3.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Carac3, DataUser);
        }

        protected void GV_Carac3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "2";
            GV_Carac3.EditIndex = -1;
            int id_car3;
            string nombre_carac3 = string.Empty;
            nombre_carac3 = ((TextBox)GV_Carac3.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_car3 = Convert.ToInt32(GV_Carac3.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VCP_CARACTERISTICA_3, id_car3, nombre_carac3);

            BindGridviewOrganizador(GV_Carac3, DataUser);
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
                            descripcion = p.Field<string>("cod_fam") +"-"+ p.Field<string>("descripcion")
                        };
            combobox.DataSource = datasource;
            combobox.DataTextField = "descripcion";
            combobox.DataValueField = "id_fam";
            combobox.DataBind();
        }

        protected void btncombi1Identi_Click(object sender, EventArgs e)
        {
            TabName.Value = "4";
            string descripcion = txtCombi1Identi.Text;
            string codLetra = DropdownFamiliaIdenti1.SelectedItem.Text.Substring(0,1);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_IDENTI_COMBINACION_1, descripcion, codLetra);
            BindGridviewOrganizador(GV_Combi_identi1, DataUser);
        }

        protected void GV_Combi_identi1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi1.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi_identi1, DataUser);
        }

        protected void GV_Combi_identi1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi1.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi_identi1, DataUser);
        }

        protected void GV_Combi_identi1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi1.EditIndex = -1;
            int id_combi1;
            string nombre_combi1= string.Empty;
            nombre_combi1 = ((TextBox)GV_Combi_identi1.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_combi1= Convert.ToInt32(GV_Combi_identi1.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VAR_IDENTI_COMBINACION_1, id_combi1, nombre_combi1);

            BindGridviewOrganizador(GV_Combi_identi1, DataUser);
        }


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
                    (this.Master as NavContenido).MostrarMensaje("No puede ingresar valor, el limite es :"+limite.ToString());
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
            GridIcar2.EditIndex = -1;
            GridIcar2.DataBind();
        }
        #endregion
    }
}