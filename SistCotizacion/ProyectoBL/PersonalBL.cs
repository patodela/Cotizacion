using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;

namespace ProyectoBL
{
    public class PersonalBL
    {
        private MSSQLSUL.Seguridad.Usuario DataUser { get; set; }
        private PersonalDA dAcces { get; set; }

        public PersonalBL(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            this.DataUser = strUsr;
            dAcces = new PersonalDA(DataUser);
        }
        public DataTable GetAllPersonal(string folio = null)
        {
            try
            {
                DataTable dtPersonal = new DataTable();
                dtPersonal = dAcces.GetAllPersonal(folio);
                return dtPersonal;

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message, ex);
            }
        }
    }
}
