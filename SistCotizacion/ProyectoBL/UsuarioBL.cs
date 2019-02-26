using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;

namespace ProyectoBL
{
    public class UsuarioBL
    {
        private UsuarioDA usuario = new UsuarioDA();
        DataTable dt;
        public bool bError { get; set; }
        public string sError { get; set; }

        //private string codUsuario { get; set; }
        //private string sPasswd { get; set; }

        public DataTable ObtenerUsuarios(MSSQLSUL.Seguridad.Usuario Usr) {


        }

    }
}
