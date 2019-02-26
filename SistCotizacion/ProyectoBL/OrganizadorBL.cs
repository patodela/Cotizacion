using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using MSSQLSUL;
using System.Data;


namespace ProyectoBL
{
    public class OrganizadorBL
    {

        public OrganizadorBL() { }

        public DataTable GetDataOrganizador(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            DataTable OrgaData = new DataTable();
            OrganizadorDA dAcces = new OrganizadorDA();
            OrgaData = dAcces.GetOrganizador(strUsr);
            return OrgaData;
        }
        public DataTable GetDataFamilia(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            DataTable OrgaData = new DataTable();
            OrganizadorDA dAcces = new OrganizadorDA();
            OrgaData = dAcces.GetFamilia(strUsr);
            return OrgaData;
        }
        public void actualiza_organizador(MSSQLSUL.Seguridad.Usuario userConnection, int organizadorTipo, int idOrganizacion, string descripcion)
        {
            try
            {
                OrganizadorDA dataAccess = new OrganizadorDA();
                dataAccess.Upd_Organizador_Familia(userConnection, organizadorTipo, idOrganizacion, descripcion);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            
        }
    }
}
