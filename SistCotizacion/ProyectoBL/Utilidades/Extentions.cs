using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

namespace ProyectoBL.Utilidades
{
    public static class Extentions
    {
        public static bool CompareObject<T>(this T val1, T val2)
        {
            bool resp = false;
            PropertyInfo[] fi = val1.GetType().GetProperties();
            foreach (PropertyInfo f in fi)
            {
                string[] KeyArraysOmitidas = { "id_direccion", "id_usuario", "id_info_empresa",
                                               "id_info_factura","id_tipo_cliente", "id_codigo_folio",
                                                "fecha_emision","actualizaciones","estado","fecha_actualizacion","NombreEntidad"};
                var Prop = f.Name;
                if (KeyArraysOmitidas.Any(a => Prop.Contains(a)))
                {
                    continue;
                }
                var valA = f.GetValue(val1);
                var valB = f.GetValue(val2);
                if (!Equals(valA,valB))
                {
                    resp = true;
                    break;
                }
            }
            return resp;
            
        }

    }
}
