using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Cliente
    {
        public int id { get; set; }
        public int id_tipo_cliente { get; set; }
        public int id_codigo_folio { get; set; }
        public DateTime fecha_emision { get; set; }
        public int actualizaciones { get; set; }
        public DateTime fecha_actualizacion { get; set; }
        public string nombre { get; set; } = string.Empty;
        public string rut { get; set; } = string.Empty;
        public string area_profesion { get; set; } = string.Empty;
        public string identidad { get; set; } = string.Empty;
        public DateTime? fecha_nacimiento { get; set; } = new DateTime(1900,1,1);
        public string contacto1 { get; set; } = string.Empty;
        public string contacto2 { get; set; } = string.Empty;

        public int? id_direccion { get; set; }
        
        public string logo_empresa { get; set; } = string.Empty;

        public int estado { get; set; }

        public int  id_usuario { get; set; }

        public int? id_info_empresa { get; set; }

        public int id_info_factura { get; set; }

        public string NombreEntidad { get; set; } = string.Empty;



    }
}
