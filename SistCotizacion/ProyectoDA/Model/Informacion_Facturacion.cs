using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Informacion_Facturacion
    {
        public int id { get; set; }
       
        public string nombre_cuenta { get; set; }
        public string rut { get; set; }
        public string banco { get; set; }
        public string tipo_cuenta { get; set; }
        public string numero_cuenta { get; set; }
        public string correo_confirmacion { get; set; }
        public int? id_direccion { get; set; }

    }
}
