using MSSQLSUL.Seguridad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA.Model;
using MSSQLSUL;
using ProyectoDA.Enum;


namespace ProyectoDA
{
    public class ClienteDA
    {

        private Usuario UsrConn { get; set; }
        public ClienteDA(Usuario _usrConn)
        {
            UsrConn = _usrConn;
        }

        public DataTable Direcion(Direccion _direccion,Accion _accion)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@pais", _direccion.pais);
                vParam.Add("@region", _direccion.region);
                vParam.Add("@ciudad", _direccion.ciudad);
                vParam.Add("@direccion", _direccion.direccion);
                vParam.Add("@zip", _direccion.zip);
                vParam.Add("@Tipo", (int)_accion); 
                vParam.Add("@id_dir", _direccion.id_direccion);
                if (_direccion.giro_actividad != null)
                {
                    vParam.Add("@giro_actividad", _direccion.giro_actividad);
                }            


               string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Mantenedor_direccion]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ingresar direccion .<br/>" + ex.Message, ex);
            }
        }

        public DataTable InformacionEmpresa(Informacion_Empresa _infoEmpresa, Accion _accion)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@ie_rut", _infoEmpresa.rut);
                vParam.Add("@ie_razon_social", _infoEmpresa.razon_social);
                vParam.Add("@ie_nombre_fantasia", _infoEmpresa.nombre_fantasia);
                vParam.Add("@ie_fecha_fundacion", _infoEmpresa.fecha_fundacion);
                vParam.Add("@ie_pagina_web", _infoEmpresa.pagina_web);
                vParam.Add("@ie_contacto_corp1", _infoEmpresa.contacto_corp1);
                vParam.Add("@ie_contacto_corp2", _infoEmpresa.contacto_corp2);
                vParam.Add("@ie_id", _infoEmpresa.id);
                vParam.Add("@Tipo", (int)_accion);


                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Mantenedor_Info_empresa]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ingresar Informacion Empresa .<br/>" + ex.Message, ex);
            }
        }

        public DataTable InformacionFacturacion(Informacion_Facturacion _infoFacturacion,Accion _accion)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();           
                vParam.Add("@if_nombre_cuenta", _infoFacturacion.nombre_cuenta);
                vParam.Add("@if_rut", _infoFacturacion.rut);
                vParam.Add("@if_banco", _infoFacturacion.banco);
                vParam.Add("@if_tipo_cuenta", _infoFacturacion.tipo_cuenta);
                vParam.Add("@if_numero_cuenta", _infoFacturacion.numero_cuenta);
                vParam.Add("@if_correo_confirmacion", _infoFacturacion.correo_confirmacion); 
                vParam.Add("@if_direccion", _infoFacturacion.id_direccion);
                vParam.Add("@if_id", _infoFacturacion.id);
                vParam.Add("@Tipo", (int)_accion);


                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Mantenedor_info_facturacion]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ingresar Informacion Facturacion .<br/>" + ex.Message, ex);
            }
        }

        public DataTable Cliente(Cliente _Cliente, Accion _accion)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@tipo_cliente", _Cliente.id_tipo_cliente);
                vParam.Add("@id_codigo_folio", _Cliente.id_codigo_folio);
                vParam.Add("@nombre", _Cliente.nombre);
                vParam.Add("@rut", _Cliente.rut);
                vParam.Add("@area_profesion", _Cliente.area_profesion);
                vParam.Add("@identidad", _Cliente.identidad);
                vParam.Add("@fecha_nacimiento", _Cliente.fecha_nacimiento);
                vParam.Add("@contacto1", _Cliente.contacto1);
                vParam.Add("@contacto2", _Cliente.contacto2);
                vParam.Add("@id_dir", _Cliente.id_direccion);
                vParam.Add("@id_usuario", UsrConn.id_usuario);
                vParam.Add("@estado", (int)Estados.Activo);
                vParam.Add("@Tipo", (int)_accion);
                vParam.Add("@NombreEntidad", _Cliente.NombreEntidad);
                vParam.Add("@id_cliente", _Cliente.id);
                vParam.Add("@id_info_factura", _Cliente.id_info_factura);
                vParam.Add("@id_info_empresa", _Cliente.id_info_empresa);
                
               


                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Mantenedor_cliente]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ingresar Informacion del Cliente .<br/>" + ex.Message, ex);
            }
        }

        public DataTable GetAllProveedor(string Entidad,int tipoCliente,string folio = null)
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

            try
            {
                string query = string.Empty;

                query = "select id_cliente,f.fd_folio,c.nombre,rut,fecha_emision,u.nombre as nombre_usuario, t.descripcion as tipo_cliente ,estado from cliente c "
                        + " join usuario u "
                        + " on u.id_usuario = c.id_usuario "
                        + " join Folio_documento f "
                        + " on f.fd_id = c.id_codigo_folio"
                        + " join tipo_cliente t "
                        + " on t.id_tipo_cliente = c.id_tipo_cliente "
                        + " where nombre_entidad = '" + Entidad + "' ";
                        
                if (!string.IsNullOrEmpty(folio))
                {
                    query += " and f.fd_folio = '" + folio.Trim() + "'";
                }
                else
                {
                    query += " and c.id_tipo_cliente = " + tipoCliente.ToString();
                }
                string vError = "";
                DataTable vResp = vCon.Ejecutar(query, ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al obtener registro proveedores .<br/>" + ex.Message, ex);
            }
        }


        public DataTable UpdEstado(int idCliente,string Entidad,Estados _estado)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@id_cliente", idCliente);
                vParam.Add("@estado", (int)_estado);
                vParam.Add("@nombreEntidad", Entidad);
                


                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Actulizacion_estado_Cliente]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al actualizar estado .<br/>" + ex.Message, ex);
            }
        }
        public DataTable UpdContadorActualizaciones(int idCliente)
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

            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@id_cliente", idCliente);
              
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Contador_update_Cliente]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al actualizar contador de actualizaciones .<br/>" + ex.Message, ex);
            }
        }
    }
}
