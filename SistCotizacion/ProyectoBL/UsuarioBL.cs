using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;


namespace ProyectoBL
{
    public class UsuarioBL
    {
         private UsuarioDA usuario = new UsuarioDA();
        public bool bError { get; set; }
        public string sError { get; set; }

        private string codUsuario { get; set; }
        private string  sPasswd { get; set; }

        public UsuarioBL(string coduser,string spass)
        {
            codUsuario = coduser;
            sPasswd = spass;
        }

        public bool existeUsuario()
        {
            if (usuario.existeUsuario(codUsuario,sPasswd))
            {
                return true;
            }
            else
            {
                sError = usuario.sError;
                return false;
            }

         }

    }
}
