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
             if (!IsPostBack)
            {
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                BindGridviewOrganizador(gv_organizador,DataUser);
                BindGridviewOrganizador(GvFamilia,DataUser);
                BindGridviewOrganizador(GV_Grupo, DataUser);
                BindGridviewOrganizador(Gv_Articulo, DataUser);
                BindGridviewOrganizador(GV_Carac1, DataUser);
                BindGridviewOrganizador(GV_Carac2, DataUser);
                BindGridviewOrganizador(GV_Carac3, DataUser);
                BindGridviewOrganizador(GV_CuantiSecund, DataUser);
                BindGridviewOrganizador(GV_Combi1, DataUser);
                BindGridviewOrganizador(GV_Combi2, DataUser);
                BindGridviewOrganizador(GV_Combi_identi1, DataUser);
                BindGridviewOrganizador(GV_Combi_identi2, DataUser);
                FillComboboxFamilia(DropdownFamilia1);
                FillComboboxFamilia(DropdownFamilia2);
                FillComboboxFamilia(DropdownFamiliaIdenti1);
                FillComboboxFamilia(DropdownFamiliaIdenti2);

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
            FillComboboxFamilia(DropdownFamilia1);
            FillComboboxFamilia(DropdownFamilia2);
            FillComboboxFamilia(DropdownFamiliaIdenti1);
            FillComboboxFamilia(DropdownFamiliaIdenti2);
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

        protected void btnAddPiedraSecundaria_Click(object sender, EventArgs e)
        {
            TabName.Value = "3";
            string descripcion = txtCuantiSecund.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_CUANTIFICACION_SECUNDARIA, descripcion);
            BindGridviewOrganizador(GV_CuantiSecund, DataUser);
        }

        protected void GV_CuantiSecund_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "3";
            GV_CuantiSecund.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_CuantiSecund, DataUser);
        }

        protected void GV_CuantiSecund_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "3";
            GV_CuantiSecund.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_CuantiSecund, DataUser);
        }

        protected void GV_CuantiSecund_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "3";
            GV_CuantiSecund.EditIndex = -1;
            int id_cuanti_secund;
            string nombre_secund = string.Empty;
            nombre_secund = ((TextBox)GV_CuantiSecund.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_cuanti_secund = Convert.ToInt32(GV_CuantiSecund.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VAR_CUANTIFICACION_SECUNDARIA, id_cuanti_secund, nombre_secund);

            BindGridviewOrganizador(GV_CuantiSecund, DataUser);
        }

        protected void btncombi1_Click(object sender, EventArgs e)
        {
            TabName.Value = "3";
            string descripcion = txtComb1.Text;
            string codLetra = DropdownFamilia1.SelectedItem.Text;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_CUANTI_COMBINACION_1, descripcion);
            BindGridviewOrganizador(GV_Combi1, DataUser);
        }

        protected void GV_Combi1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi1.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi1, DataUser);
        }

        protected void GV_Combi1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi1.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi1, DataUser);
        }

        protected void GV_Combi1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi1.EditIndex = -1;
            int id_combi1;
            string nombre_combi1 = string.Empty;
            nombre_combi1 = ((TextBox)GV_Combi1.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_combi1 = Convert.ToInt32(GV_Combi1.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VAR_CUANTI_COMBINACION_1, id_combi1, nombre_combi1);

            BindGridviewOrganizador(GV_Combi1, DataUser);
        }

        protected void btnCombi2_Click(object sender, EventArgs e)
        {
            TabName.Value = "3";
            string descripcion = txtCombi2.Text;
            string codLetra = DropdownFamilia2.SelectedItem.Text.Substring(0,1);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_CUANTI_COMBINACION_2, descripcion, codLetra);
            BindGridviewOrganizador(GV_Combi2, DataUser);
        }

        protected void GV_Combi2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi2.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi2, DataUser);
        }

        protected void GV_Combi2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi2.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi2, DataUser);
        }

        protected void GV_Combi2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "3";
            GV_Combi2.EditIndex = -1;
            int id_combi2;
            string nombre_combi2 = string.Empty;
            nombre_combi2 = ((TextBox)GV_Combi2.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_combi2 = Convert.ToInt32(GV_Combi2.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VAR_CUANTI_COMBINACION_2, id_combi2, nombre_combi2);

            BindGridviewOrganizador(GV_Combi2, DataUser);
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
                            id_fam = p.Field<Byte>("id_fam"),
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

        protected void btncombi2Identi_Click(object sender, EventArgs e)
        {
            TabName.Value = "4";
            string descripcion = txtCombi2Identi.Text;
            string codLetra = DropdownFamiliaIdenti2.SelectedItem.Text.Substring(0,1);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            OrganizadorBL org = new OrganizadorBL(DataUser);
            org.add_descripcion_SKU(nombreTabla.VAR_IDENTI_COMBINACION_2, descripcion, codLetra);
            BindGridviewOrganizador(GV_Combi_identi2, DataUser);
        }

        protected void GV_Combi_identi2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi2.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi_identi2, DataUser);
        }

        protected void GV_Combi_identi2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi2.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GV_Combi_identi2, DataUser);
        }

        protected void GV_Combi_identi2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TabName.Value = "4";
            GV_Combi_identi2.EditIndex = -1;
            int id_combi2;
            string nombre_combi2 = string.Empty;
            nombre_combi2 = ((TextBox)GV_Combi_identi2.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_combi2 = Convert.ToInt32(GV_Combi_identi2.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL(DataUser);
            Organizador.actualiza_organizador(nombreTabla.VAR_IDENTI_COMBINACION_2, id_combi2, nombre_combi2);

            BindGridviewOrganizador(GV_Combi_identi2, DataUser);
        }
    }
}