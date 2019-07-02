using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoBL;

namespace SistCotizacion
{
    public partial class EntidadProveedor : System.Web.UI.Page
    {
        MSSQLSUL.Seguridad.Usuario DataUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataUser = (MSSQLSUL.Seguridad.Usuario)Session["Usuario"];
            var folio = new GeneraFolioBL(DataUser);
            string numeroFolio = folio.GetFolioFichaProveedor(8, true);
            FolioDoc.Text = numeroFolio;
        }
    }
}