using MSSQLSUL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    public class OrganizadorDA
    {

     
        public int id_org { get; set; }
        public String cod_org { get; set; }
        public String descripcion { get; set; }


        public OrganizadorDA(int IdOrg,string CodOrg,string Descripcion) {

            id_org = IdOrg;
            cod_org = CodOrg;
            descripcion = Descripcion;

        }
        public OrganizadorDA() { }

       public DataTable GetOrganizador(MSSQLSUL.Seguridad.Usuario userConnection)
        {
      

            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(userConnection);
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
                string vError = "";
                DataTable vResp = vCon.Ejecutar("Select * from dbo.organizador", ref vError, vParaMetros: null,vTimeoutConexion: 90,vEsProcedimiento:false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al consultar tabla Organizador.<br/>" + ex.Message, ex);
            }
        }


        public DataTable GetFamilia(MSSQLSUL.Seguridad.Usuario userConnection)
        {


            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(userConnection);
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
                string vError = "";
                DataTable vResp = vCon.Ejecutar("Select * from dbo.familia", ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al consultar tabla Familia.<br/>" + ex.Message, ex);
            }
        }

        public void Upd_Organizador_Familia(MSSQLSUL.Seguridad.Usuario userConnection,int organizadorTipo,int idOrganizacion,string descripcion)
        {
            // Ahora veremos si podemos ingresar.
            Conexion vCon = new Conexion(userConnection);
            try
            {

                vCon.IniciarTransaccion();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo conectar a la base de datos.<br/>" + ex.Message);

            }            
            Dictionary<string, object> vParam = new Dictionary<string, object>();
            vParam.Add("@sUsuario", userConnection.id_usuario);
            vParam.Add("@organizador", organizadorTipo);
            vParam.Add("@id_org", idOrganizacion);
            vParam.Add("@descripcion", descripcion);
            vParam.Add("@sError", null);

            try
            {
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[sp_UPD_Organizador_Familia]", ref vError, vParaMetros: vParam);


                vCon.Confirmar();
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al ejecutar un procedimiento almacenado.<br/>" + ex.Message, ex);
            }

        }
    }
}
