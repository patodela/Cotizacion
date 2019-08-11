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
               
                var Prop = f.Name;
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
