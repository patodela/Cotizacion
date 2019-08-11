using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Direccion
    {
        public int id_direccion { get; set; } = 0;
        public string pais { get; set; } = string.Empty;
        public string region { get; set; } = string.Empty;
        public string ciudad { get; set; } = string.Empty;
        public string direccion { get; set; } = string.Empty;
        public string zip { get; set; } = string.Empty;

        public string giro_actividad { get; set; } = string.Empty;
    }
}
