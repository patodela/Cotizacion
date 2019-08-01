using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;
using ProyectoDA.Model;

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

        public Folio GetFolioFichaProveedor(int idioma,bool temporal) {
            var response = new Folio();
            try
            {
                DataTable FolioData = new DataTable();
                FolioData = dAcces.GetFolio(3, idioma, temporal);
                response = new Folio
                {
                    idFolio = Convert.ToInt32(FolioData.Rows[0][1]),
                    cod_folio = FolioData.Rows[0][0].ToString()
                };
                return response;            
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message,ex);
            }
            return response;
        }
    }
}
