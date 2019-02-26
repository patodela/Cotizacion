using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;
using System.Data;


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


            }
        }

        protected void gv_organizador_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_organizador.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(gv_organizador,DataUser);
        }


       public void BindGridviewOrganizador(GridView gvDatos,MSSQLSUL.Seguridad.Usuario DataUser)
        {
            OrganizadorBL Organizador = new OrganizadorBL();
            DataTable data = new DataTable();
            if (gvDatos.ID == "gv_organizador")
            {
                data = Organizador.GetDataOrganizador(DataUser);
                
            }
            else if(gvDatos.ID == "GvFamilia")
            {
                data = Organizador.GetDataFamilia(DataUser);
            }

            gvDatos.DataSource = data;           
            gvDatos.DataBind();
          
        }

        protected void GvFamilia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvFamilia.EditIndex = -1;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GvFamilia,DataUser);
        }

        protected void gv_organizador_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_organizador.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(gv_organizador,DataUser);
        }

        protected void GvFamilia_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvFamilia.EditIndex = e.NewEditIndex;
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            BindGridviewOrganizador(GvFamilia,DataUser);
        }

        protected void gv_organizador_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          
           gv_organizador.EditIndex = -1;
           
            int id_organizacion;
            string descrip = string.Empty;
            descrip = ((TextBox)gv_organizador.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_organizacion = Convert.ToInt32(gv_organizador.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL();
            Organizador.actualiza_organizador(DataUser, 1, id_organizacion, descrip);

            BindGridviewOrganizador(gv_organizador, DataUser);

        }

        protected void GvFamilia_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GvFamilia.EditIndex = -1;

            int id_familia;
            string descrip = string.Empty;
            descrip = ((TextBox)GvFamilia.Rows[e.RowIndex].FindControl("txtEditDescrip")).Text;
            id_familia = Convert.ToInt32(gv_organizador.DataKeys[e.RowIndex].Value);
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];

            OrganizadorBL Organizador = new OrganizadorBL();
            Organizador.actualiza_organizador(DataUser, 2, id_familia, descrip);

            BindGridviewOrganizador(GvFamilia, DataUser);
        }
    }
}