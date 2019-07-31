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
        public int tipo_cliente { get; set; }
        public int codigo_folio { get; set; }
        public DateTime fecha_emision { get; set; }
        public int actualizaciones { get; set; }
        public DateTime fecha_actualizacion { get; set; }
        public string nombre { get; set; }
        public string rut { get; set; }
        public string area_profesion { get; set; }
        public string identidad { get; set; }
        public DateTime? fecha_nacimiento { get; set; }
        public string contacto1 { get; set; }
        public string contacto2 { get; set; }

        public int id_direcion { get; set; }

        public int id_dir_empresa { get; set; }
        public string logo_empresa { get; set; }

        public int estado { get; set; }

        public int  id_usuario { get; set; }

        public int? id_info_empresa { get; set; }

        public int? id_info_factura { get; set; }

        public string NombreEntidad { get; set; }



    }
}
