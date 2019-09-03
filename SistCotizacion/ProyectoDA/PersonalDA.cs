using MSSQLSUL;
using MSSQLSUL.Seguridad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    public class PersonalDA
    {
        private Usuario UsrConn { get; set; }
        public PersonalDA(Usuario _usrConn)
        {
            UsrConn = _usrConn;
        }

        public DataTable GetAllPersonal(string folio = null)
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

                query = "select p.id_personal,p.codigo_folio,p.nombre,p.rut,p.fecha_emision,u.nombre,p.estado "
                        + " from personal p "
                        + " join identificacion_laboral l "
                        + " on l.id_personal = p.id_personal "
                        + " join usuario u "
                        + " on u.id_usuario = l.id_usuario ";
                     
                if (!string.IsNullOrEmpty(folio))
                {
                    query += " where p.codigo_folio = '" + folio.Trim() + "'";
                }
               
                string vError = "";
                DataTable vResp = vCon.Ejecutar(query, ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al obtener registro personal .<br/>" + ex.Message, ex);
            }
        }
    }
}
