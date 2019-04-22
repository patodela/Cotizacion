using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistCotizacion.Master
{
    public class PContenidoPostLogin : System.Web.UI.Page
    {


        public void MostrarMensaje(String vMensaje, String vTitulo = "Información")
        {
            NavContenido vM = new NavContenido();
            vM.MostrarMensaje(vMensaje, vTitulo);
        }


        public void MostrarError(String vMensaje, String vTitulo = "Error", Exception vException = null)
        {
            NavContenido vM = new NavContenido();
            vM.MostrarError(vMensaje, vTitulo, vException);           
        }

    }
}
