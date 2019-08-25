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
        public string rut { get; set; } = string.Empty;
        public string razon_social { get; set; } = string.Empty;
        public string nombre_fantasia { get; set; } = string.Empty;
        public DateTime fecha_fundacion { get; set; } = new DateTime(1900, 1, 1);
        public string pagina_web { get; set; } = string.Empty;
        public string contacto_corp1 { get; set; } = string.Empty;
        public string contacto_corp2 { get; set; } = string.Empty;

        

    }
}
