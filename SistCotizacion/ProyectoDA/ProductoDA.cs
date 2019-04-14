using MSSQLSUL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    public class ProductoDA
    {

        public int id_producto { get; set; } = 0;
        public byte[] imagen { get; set; } = new byte[0];
        public string nombre { get; set; } = string.Empty;
        public string skuprov1 { get; set; } = string.Empty;
        public string skuprov2 { get; set; } = string.Empty;
        public DateTime fecha_ingreso { get; set; } = DateTime.MinValue;
        public DateTime fecha_actualiza { get; set; } = DateTime.MinValue;
        public int id_usuario { get; set; } = 0;
        public bool activo { get; set; } = true;
        public string nombre_usuario { get; set; } = string.Empty;

        public string operacion { get; set; }


        private MSSQLSUL.Seguridad.Usuario UsrConn { get; set; }

        public ProductoDA(MSSQLSUL.Seguridad.Usuario _usrConn)
        {
            UsrConn = _usrConn;
        }
        public ProductoDA() { }

        public List<ProductoDA> Obtener(ProductoDA _Producto)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }
            List<ProductoDA> LstProducto = new List<ProductoDA>();
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@operacion",operacion );
            vParam.Add("@imagen", _Producto.imagen);
            vParam.Add("@nombre", _Producto.nombre);
            vParam.Add("@skuprovedor1", _Producto.skuprov1);
            vParam.Add("@skuprovedor2", _Producto.skuprov2);
            vParam.Add("@id_usuario", _Producto.id_usuario);
            
            //  vParam.Add("@sError", null);
      


            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Producto]", ref vError, vParaMetros: vParam);
                if (vResp.Rows.Count > 0)
                {
                    var data = (from rw in vResp.AsEnumerable()
                                select new ProductoDA()
                                {
                                    
                                    id_producto = Convert.ToInt32(rw["id_producto"]),
                                    imagen = (byte[])rw["imagen"],
                                    nombre = rw["nombre"].ToString(),
                                    skuprov1 = rw["skuprovedor1"].ToString(),
                                    skuprov2 = rw["skuprovedor2"].ToString(),
                                    fecha_ingreso = Convert.ToDateTime(rw["fecha_ingreso"]),
                                    fecha_actualiza =  !string.IsNullOrEmpty(rw["fecha_actualiza"].ToString()) ? Convert.ToDateTime(rw["fecha_actualiza"].ToString()) : DateTime.MinValue,
                                    nombre_usuario = rw["nombre_usuario"].ToString(),
                                    activo = Convert.ToBoolean(rw["activo"])
                                }
                                );
                    LstProducto = data.ToList();

                }

                vCon.Confirmar();
                return LstProducto;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }
        public void Actualizar(ProductoDA _Producto)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@operacion", operacion);
            vParam.Add("@imagen", _Producto.imagen);
            vParam.Add("@nombre", _Producto.nombre);
            vParam.Add("@skuprovedor1", _Producto.skuprov1);
            vParam.Add("@skuprovedor2", _Producto.skuprov2);
            vParam.Add("@id_usuario", _Producto.id_usuario);
            vParam.Add("@id_producto", _Producto.id_producto);
            vParam.Add("@activo", _Producto.activo);
            //  vParam.Add("@sError", null);



            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Producto]", ref vError, vParaMetros: vParam);
                

                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }
        public void Ingresar(ProductoDA _Producto)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(UsrConn);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@operacion",operacion);
            vParam.Add("@imagen", _Producto.imagen);
            vParam.Add("@nombre", _Producto.nombre);
            vParam.Add("@skuprovedor1", _Producto.skuprov1);
            vParam.Add("@skuprovedor2", _Producto.skuprov2);
            vParam.Add("@id_usuario", _Producto.id_usuario);
           
            //  vParam.Add("@sError", null);



            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Producto]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }
    }
}
