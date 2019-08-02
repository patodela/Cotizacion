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
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.Direcion(_dir, Accion.Seleccionar);
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
                        giro_actividad = (DireccionData.Rows[0]["zip"].ToString())
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
                if (DireccionData.Rows.Count > 0)
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
                DataTable DireccionData = new DataTable();
                DireccionData = dAcces.InformacionEmpresa(_infoEmpresa, Accion.Seleccionar);
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

    }
}
