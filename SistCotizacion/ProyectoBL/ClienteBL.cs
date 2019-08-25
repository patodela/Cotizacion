using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;
using ProyectoDA.Model;
using ProyectoBL.Enum;
using ProyectoDA.Enum;


namespace ProyectoBL
{
    public class ClienteBL
    {
        private MSSQLSUL.Seguridad.Usuario DataUser { get; set; }
        private  ClienteDA dAcces { get; set; }

        public ClienteBL(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            this.DataUser = strUsr;
            dAcces = new ClienteDA(DataUser);
        }

        public Direccion AddDireccion(Direccion _dir) {
            
            try
            {
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.Direcion(_dir,Accion.Insertar);
                _dir.id_direccion = Convert.ToInt32(DireccionData.Rows[0][0]);
                return _dir;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }            
        }

        public Direccion GetDireccionById(int IdDireccion)
        {

            try
            {
                Direccion _dir = new Direccion
                {
                    id_direccion = IdDireccion
                };
                if (IdDireccion == 0)
                {
                    return new Direccion();
                }
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.Direcion(_dir, Accion.SelectById);
                if (DireccionData.Rows.Count > 0)
                {
                    _dir = new Direccion
                    {
                        id_direccion = Convert.ToInt32(DireccionData.Rows[0]["id_direccion"]),
                        pais = DireccionData.Rows[0]["pais"].ToString(),
                        region = DireccionData.Rows[0]["region"].ToString(),
                        ciudad = DireccionData.Rows[0]["ciudad"].ToString(),
                        direccion = DireccionData.Rows[0]["direccion"].ToString(),
                        zip = DireccionData.Rows[0]["zip"].ToString(),
                        giro_actividad = (DireccionData.Rows[0]["giro_actividad"].ToString())
                    };

                }
                else
                {
                    _dir = new Direccion();
                }
                return _dir;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public bool UpdateDireccion(Direccion _dir)
        {
            
            try
            {
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.Direcion(_dir, Accion.Actualizar);
                if (DireccionData.Rows.Count > 0 && !string.IsNullOrEmpty(DireccionData.Rows[0][0].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            
        }

        public Informacion_Empresa AddInfoEmpresa(Informacion_Empresa _infoEmpresa)
        {

            try
            {
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.InformacionEmpresa(_infoEmpresa,Accion.Insertar);
                _infoEmpresa.id = Convert.ToInt32(DireccionData.Rows[0][0]);
                return _infoEmpresa;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public Informacion_Empresa GetInfoEmpresaById(int idInfoEmpresa)
        {

            try
            {
                Informacion_Empresa _infoEmpresa = new Informacion_Empresa
                {
                    id = idInfoEmpresa
                };
                if (idInfoEmpresa == 0)
                {
                    return new Informacion_Empresa();
                }
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.InformacionEmpresa(_infoEmpresa, Accion.SelectById);
                if (DireccionData.Rows.Count > 0)
                {
                    _infoEmpresa = new Informacion_Empresa
                    {
                        id = Convert.ToInt32(DireccionData.Rows[0]["ie_id"]),
                        rut = DireccionData.Rows[0]["ie_rut"].ToString(),
                        razon_social = DireccionData.Rows[0]["ie_razon_social"].ToString(),
                        nombre_fantasia = DireccionData.Rows[0]["ie_nombre_fantasia"].ToString(),
                        fecha_fundacion = Convert.ToDateTime(DireccionData.Rows[0]["ie_fecha_fundacion"]),
                        pagina_web = DireccionData.Rows[0]["ie_pagina_web"].ToString(),
                        contacto_corp1 = (DireccionData.Rows[0]["ie_contacto_corp1"].ToString()),
                        contacto_corp2 = (DireccionData.Rows[0]["ie_contacto_corp2"].ToString())
                    };

                }
                else
                {
                    _infoEmpresa = new Informacion_Empresa();
                }
                return _infoEmpresa;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public bool UpdateInfoEmpresa(Informacion_Empresa _infoEmpresa)
        {
            try
            {
                DataTable InfoEmpresaData = new DataTable();
                InfoEmpresaData = dAcces.InformacionEmpresa(_infoEmpresa, Accion.Actualizar);
                if (InfoEmpresaData.Rows.Count > 0 && !string.IsNullOrEmpty(InfoEmpresaData.Rows[0][0].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public Informacion_Facturacion AddInfoFacturacion(Informacion_Facturacion _infoFacturacion)
        {

            try
            {
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.InformacionFacturacion(_infoFacturacion,Accion.Insertar);
                _infoFacturacion.id = Convert.ToInt32(DireccionData.Rows[0][0]);
                return _infoFacturacion;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public Informacion_Facturacion GetInfoFacturacionById(int idInfoFacturacion)
        {

            try
            {
                Informacion_Facturacion _infoFacturacion = new Informacion_Facturacion
                {
                    id = idInfoFacturacion
                };
                DataTable infoFacturaData = new DataTable();
                infoFacturaData = dAcces.InformacionFacturacion(_infoFacturacion, Accion.SelectById);
                if (infoFacturaData.Rows.Count > 0)
                {
                    _infoFacturacion = new Informacion_Facturacion
                    {
                        id = Convert.ToInt32(infoFacturaData.Rows[0]["if_id"]),
                        rut = infoFacturaData.Rows[0]["if_rut"].ToString(),
                        nombre_cuenta = infoFacturaData.Rows[0]["if_nombre_cuenta"].ToString(),
                        banco = infoFacturaData.Rows[0]["if_banco"].ToString(),
                        tipo_cuenta = infoFacturaData.Rows[0]["if_tipo_cuenta"].ToString(),
                        numero_cuenta = infoFacturaData.Rows[0]["if_numero_cuenta"].ToString(),
                        correo_confirmacion = infoFacturaData.Rows[0]["if_correo_confirmacion"].ToString(),
                        id_direccion = !string.IsNullOrEmpty(infoFacturaData.Rows[0]["if_direccion"].ToString()) ? Convert.ToInt32(infoFacturaData.Rows[0]["if_direccion"]) : 0 
                    };

                }
                else
                {
                    _infoFacturacion = new Informacion_Facturacion();
                }
                return _infoFacturacion;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public bool UpdateInfoFacturacion(Informacion_Facturacion _infoFacturacion)
        {
            try
            {
                DataTable InfoFacturaData = new DataTable();
                InfoFacturaData = dAcces.InformacionFacturacion(_infoFacturacion, Accion.Actualizar);
                if (InfoFacturaData.Rows.Count > 0 && !string.IsNullOrEmpty(InfoFacturaData.Rows[0][0].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public Cliente AddCliente(Cliente _Cliente)
        {

            try
            {
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.Cliente(_Cliente,Accion.Insertar);
                _Cliente.id = Convert.ToInt32(DireccionData.Rows[0][0]);
                return _Cliente;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public Cliente GetClienteById(int idCliente)
        {

            try
            {
                Cliente _infoCliente = new Cliente
                {
                    id = idCliente
                };
                DataTable infoClienteData = new DataTable();
                infoClienteData = dAcces.Cliente(_infoCliente, Accion.SelectById);
                if (infoClienteData.Rows.Count > 0)
                {
                    _infoCliente = new Cliente
                    {
                        id = Convert.ToInt32(infoClienteData.Rows[0]["id_cliente"]),
                        id_tipo_cliente = Convert.ToInt32(infoClienteData.Rows[0]["id_tipo_cliente"]),
                        id_codigo_folio = Convert.ToInt32(infoClienteData.Rows[0]["id_codigo_folio"]),
                        fecha_emision = Convert.ToDateTime(infoClienteData.Rows[0]["fecha_emision"]),
                        actualizaciones = Convert.ToInt32(infoClienteData.Rows[0]["actualizaciones"]),
                        fecha_actualizacion = Convert.ToDateTime(infoClienteData.Rows[0]["fecha_actualizacion"]),
                        nombre = infoClienteData.Rows[0]["nombre"].ToString(),
                        rut = infoClienteData.Rows[0]["rut"].ToString(),
                        area_profesion = infoClienteData.Rows[0]["area_profesion"].ToString(),
                        identidad = infoClienteData.Rows[0]["identidad"].ToString(),
                        fecha_nacimiento = Convert.ToDateTime(infoClienteData.Rows[0]["fecha_nacimiento"]),
                        contacto1 = infoClienteData.Rows[0]["contacto1"].ToString(),
                        contacto2 = infoClienteData.Rows[0]["contacto2"].ToString(),
                        id_direccion = !string.IsNullOrEmpty(infoClienteData.Rows[0]["id_direccion"].ToString()) ? Convert.ToInt32(infoClienteData.Rows[0]["id_direccion"]) : 0,
                        logo_empresa = infoClienteData.Rows[0]["logo_empresa"].ToString(),
                        estado = Convert.ToInt32(infoClienteData.Rows[0]["estado"].ToString()),
                        id_info_empresa = !string.IsNullOrEmpty(infoClienteData.Rows[0]["id_info_empresa"].ToString()) ? Convert.ToInt32(infoClienteData.Rows[0]["id_info_empresa"]) : 0,
                        id_info_factura = !string.IsNullOrEmpty(infoClienteData.Rows[0]["id_info_factura"].ToString()) ? Convert.ToInt32(infoClienteData.Rows[0]["id_info_factura"]) : 0,
                        id_usuario = Convert.ToInt32(infoClienteData.Rows[0]["id_usuario"]),
                        NombreEntidad = infoClienteData.Rows[0]["id_usuario"].ToString()


                    };
                 
                }
                else
                {
                    _infoCliente = new Cliente();
                }
                return _infoCliente;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public bool UpdateCliente(Cliente _Cliente)
        {
            try
            {
                DataTable ClienteData = new DataTable();
                ClienteData = dAcces.Cliente(_Cliente, Accion.Actualizar);
                if (ClienteData.Rows.Count > 0 && !string.IsNullOrEmpty(ClienteData.Rows[0][0].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public DataTable GetAllProveedor(NombreEntidad nombreEntidad,TipoCliente tipoCliente,string folio = null)
        {
            try
            {
                DataTable dtProveedor = new DataTable();
                dtProveedor = dAcces.GetAllProveedor(nombreEntidad.ToString(), (int)tipoCliente,folio);
                return dtProveedor;

            }
            catch (Exception ex) {

                throw new Exception(ex.Message, ex);
            }
        }

        public DataTable UpdateEstado(NombreEntidad nombreEntidad, int _idCliente,ProyectoDA.Enum.Estados _estado)
        {
            try
            {
                DataTable dtProveedor = new DataTable();
                dtProveedor = dAcces.UpdEstado(_idCliente, nombreEntidad.ToString(), _estado);
                return dtProveedor;

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message, ex);
            }
        }
        public DataTable UpdateContadorActualizacion(int _idCliente)
        {
            try
            {
                DataTable dtProveedor = new DataTable();
                dtProveedor = dAcces.UpdContadorActualizaciones(_idCliente);
                return dtProveedor;

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message, ex);
            }
        }

    }
}
