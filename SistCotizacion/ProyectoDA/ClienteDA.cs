using MSSQLSUL.Seguridad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA.Model;
using MSSQLSUL;

namespace ProyectoDA
{
    public class ClienteDA
    {

        private Usuario UsrConn { get; set; }
        public ClienteDA(Usuario _usrConn)
        {
            UsrConn = _usrConn;
        }

        public DataTable AddDirecion(Direccion _direccion)
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

        public DataTable AddInformacionEmpresa(Informacion_Empresa _infoEmpresa)
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
                vParam.Add("@ie_direccion", _infoEmpresa.id_direccion);  

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

        public DataTable AddInformacionFacturacion(Informacion_Facturacion _infoFacturacion)
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
                vParam.Add("@if_giro_actividad", _infoFacturacion.giro_actividad);
                vParam.Add("@if_nombre_cuenta", _infoFacturacion.nombre_cuenta);
                vParam.Add("@if_rut", _infoFacturacion.rut);
                vParam.Add("@if_banco", _infoFacturacion.banco);
                vParam.Add("@if_tipo_cuenta", _infoFacturacion.tipo_cuenta);
                vParam.Add("@if_numero_cuenta", _infoFacturacion.numero_cuenta);
                vParam.Add("@if_correo_confirmacion", _infoFacturacion.correo_confirmacion);           

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

        public DataTable AddCliente(Cliente _Cliente)
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
                vParam.Add("@tipo_cliente", _Cliente.tipo_cliente);
                vParam.Add("@id_codigo_folio", _Cliente.codigo_folio);
                vParam.Add("@nombre", _Cliente.nombre);
                vParam.Add("@rut", _Cliente.rut);
                vParam.Add("@area_profesion", _Cliente.area_profesion);
                vParam.Add("@identidad", _Cliente.identidad);
                vParam.Add("@fecha_nacimiento", _Cliente.fecha_nacimiento);
                vParam.Add("@contacto1", _Cliente.contacto1);
                vParam.Add("@contacto2", _Cliente.contacto2);
                vParam.Add("@id_dir", _Cliente.id_direcion);
                vParam.Add("@id_dir_empresa", _Cliente.id_dir_empresa);
                vParam.Add("@id_info_factura", _Cliente.id_info_factura);
                vParam.Add("@id_info_empresa", _Cliente.id_info_empresa);
 

                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_Mantenedor_cliente]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ingresar Informacion Facturacion .<br/>" + ex.Message, ex);
            }
        }


    }
}
