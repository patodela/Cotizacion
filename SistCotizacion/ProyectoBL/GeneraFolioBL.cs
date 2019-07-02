using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;

namespace ProyectoBL
{
    public class GeneraFolioBL
    {
        private MSSQLSUL.Seguridad.Usuario DataUser { get; set; }
        private FolioDocumentosDA dAcces { get; set; }


        public GeneraFolioBL(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            this.DataUser = strUsr;
            dAcces = new FolioDocumentosDA(DataUser);
        }

        public string GetFolioFichaProveedor(int idioma,bool temporal) {
            var response = string.Empty;
            try
            {
                DataTable FolioData = new DataTable();
                FolioData = dAcces.GetFolio(3, idioma, temporal);
                response = FolioData.Rows[0][0].ToString();
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message,ex);
            }
            return response;
        }
    }
}
