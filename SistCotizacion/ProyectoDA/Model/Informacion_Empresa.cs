using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Informacion_Empresa
    {
        public int id { get; set; }
        public string rut { get; set; }
        public string razon_social { get; set; }
        public string nombre_fantasia { get; set; }
        public DateTime fecha_fundacion { get; set; }
        public string pagina_web { get; set; }
        public string contacto_corp1 { get; set; }
        public string contacto_corp2 { get; set; }

        

    }
}
