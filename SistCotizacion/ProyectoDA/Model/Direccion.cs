using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA.Model
{
    public class Direccion
    {
        public int id_direccion { get; set; }
        public string pais { get; set; }
        public string region { get; set; }
        public string ciudad { get; set; }
        public string direccion { get; set; }
        public string zip { get; set; }

    }
}
