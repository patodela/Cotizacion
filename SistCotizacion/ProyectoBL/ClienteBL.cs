using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using System.Data;
using ProyectoDA.Model;
using ProyectoBL.Enum;


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
                DireccionData = dAcces.AddDirecion(_dir);
                _dir.id_direccion = Convert.ToInt32(DireccionData.Rows[0][0]);
                return _dir;
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
                DireccionData = dAcces.AddInformacionEmpresa(_infoEmpresa);
                _infoEmpresa.id = Convert.ToInt32(DireccionData.Rows[0][0]);
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
                DireccionData = dAcces.AddInformacionFacturacion(_infoFacturacion);
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
                DireccionData = dAcces.AddCliente(_Cliente);
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
