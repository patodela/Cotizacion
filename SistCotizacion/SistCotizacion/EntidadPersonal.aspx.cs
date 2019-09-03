using ProyectoBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistCotizacion
{
    public partial class EntidadPersonal : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            var pasoLoad = Convert.ToInt16(Session["PasoLoad"]);
            if (!IsPostBack && pasoLoad == 0)
            {
                Session["PasoLoad"] = 1;
                DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
                var folio = new GeneraFolioBL(DataUser);
                var numeroFolio = folio.GetFolioFicha(1, 8, true);
                FolioDoc.Text = numeroFolio.cod_folio;
                TxtFechaEmision.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("PasoLoad");
            Response.Redirect("/SearchPersonal.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}