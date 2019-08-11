using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Informacion_Facturacion
    {
        public int id { get; set; } = 0;

        public string nombre_cuenta { get; set; } = string.Empty;
        public string rut { get; set; } = string.Empty;
        public string banco { get; set; } = string.Empty;
        public string tipo_cuenta { get; set; } = string.Empty;
        public string numero_cuenta { get; set; } = string.Empty;
        public string correo_confirmacion { get; set; } = string.Empty;
        public int? id_direccion { get; set; }

    }
}
