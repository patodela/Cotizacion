using MSSQLSUL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    public class ProductoCombinacionSKUDA
    {
        public int idcombisku { get; set; } = -1;
        public int id_producto { get; set; } = -1;
        public int id_org { get; set; } = -1;
        public int id_fam { get; set; } = -1;
        public int id_grupo { get; set; } = -1;
        public int id_articulo { get; set; } = -1;
        public int id_car1 { get; set; } = -1;
        public int id_car2 { get; set; } = -1;
        public int id_car3 { get; set; } = -1;
        public int id_comb1 { get; set; } = -1;
        public int id_comb2 { get; set; } = -1;
        public DateTime fecha_ingreso { get; set; } = DateTime.MinValue;
        public bool activo { get; set; } = true;
        public int id_usuario { get; set; } = 0;
        public string nombre_usuario { get; private set; } = string.Empty;
        public DateTime fecha_actualiza { get; private set; } = DateTime.MinValue;

        public string operacion { get; set; }

        public ProductoCombinacionSKUDA() { }


        private MSSQLSUL.Seguridad.Usuario UsrConn { get; set; }

        public ProductoCombinacionSKUDA(MSSQLSUL.Seguridad.Usuario _usrConn)
        {
            UsrConn = _usrConn;
        }


        public List<ProductoCombinacionSKUDA> Obtener(string operacion)
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
            List<ProductoCombinacionSKUDA> LstProductoKU = new List<ProductoCombinacionSKUDA>();
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@operacion", operacion);
            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Combinacion_Producto_SKU]", ref vError, vParaMetros: vParam);
                if (vResp.Rows.Count > 0)
                {
                    var data = (from rw in vResp.AsEnumerable()
                                select new ProductoCombinacionSKUDA()
                                {

                                    idcombisku = Convert.ToInt32(rw["idcombisku"]),
                                    id_producto = Convert.ToInt32(rw["id_producto"]),
                                    id_org = Convert.ToInt32(rw["id_org"]),
                                    id_fam = Convert.ToInt32(rw["id_fam"]),
                                    id_grupo = Convert.ToInt32(rw["id_grupo"]),
                                    id_articulo = Convert.ToInt32(rw["id_articulo"]),
                                    id_car1 = Convert.ToInt32(rw["id_car1"]),
                                    id_car2 = Convert.ToInt32(rw["id_car2"]),
                                    id_car3 = Convert.ToInt32(rw["id_car3"]),
                                    id_comb1 = Convert.ToInt32(rw["id_comb1"]),
                                    id_comb2 = Convert.ToInt32(rw["id_comb2"]),
                                    fecha_ingreso = Convert.ToDateTime(rw["fecha_ingreso"]),
                                    fecha_actualiza =Convert.ToDateTime(rw["fecha_actualiza"].ToString()),
                                    nombre_usuario = rw["nombre_usuario"].ToString(),
                                    activo = Convert.ToBoolean(rw["activo"])
                                }
                                );
                    LstProductoKU = data.ToList();

                }

                vCon.Confirmar();
                return LstProductoKU;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }

        public void IngresarSKU(ProductoCombinacionSKUDA CombinacionSKU)
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
            vParam.Add("@id_producto", CombinacionSKU.id_producto);
            vParam.Add("@id_org", CombinacionSKU.id_org);
            vParam.Add("@id_fam", CombinacionSKU.id_fam);
            vParam.Add ("@id_grupo", CombinacionSKU.id_grupo);
            vParam.Add("@id_articulo", CombinacionSKU.id_articulo);
            vParam.Add("@id_car1", CombinacionSKU.id_car1);
            vParam.Add("@id_car2", CombinacionSKU.id_car2);
            vParam.Add("@id_car3", CombinacionSKU.id_car3);
            vParam.Add("@id_comb1", CombinacionSKU.id_comb1);
            vParam.Add("@id_comb2", CombinacionSKU.id_comb2);
            vParam.Add("@id_usuario", CombinacionSKU.id_usuario);

            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Combinacion_Producto_SKU]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }


        public void ActualizarSKU(ProductoCombinacionSKUDA _CombinacionSKU)
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
            vParam.Add("@idcombisku", _CombinacionSKU.idcombisku);
            vParam.Add("@id_producto", _CombinacionSKU.id_producto);
            vParam.Add("@id_org", _CombinacionSKU.id_org);
            vParam.Add("@id_fam", _CombinacionSKU.id_fam);
            vParam.Add("@id_grupo", _CombinacionSKU.id_grupo);
            vParam.Add("@id_articulo", _CombinacionSKU.id_articulo);
            vParam.Add("@activo", _CombinacionSKU.activo);
            vParam.Add("@id_car1", _CombinacionSKU.id_car1);
            vParam.Add("@id_car2", _CombinacionSKU.id_car2);
            vParam.Add("@id_car3", _CombinacionSKU.id_car3);
            vParam.Add("@id_comb1", _CombinacionSKU.id_comb1);
            vParam.Add("@id_comb1", _CombinacionSKU.id_comb2);
            vParam.Add("@id_usuario", _CombinacionSKU.id_usuario);
            //  vParam.Add("@sError", null);
            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_Mantenedor_Combinacion_Producto_SKU]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }
        }
    }
}
