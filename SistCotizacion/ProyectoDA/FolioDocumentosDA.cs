using MSSQLSUL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MSSQLSUL.Seguridad;
namespace ProyectoDA
{
    public class FolioDocumentosDA
    {
        private Usuario UsrConn { get; set; }
        private Conexion vCon;
        public FolioDocumentosDA(Usuario _usrConn) {
            UsrConn = _usrConn;
            vCon = new Conexion(_usrConn);
        }

        public DataTable GetFolio(int TipoDoc,int Idioma,bool Temporal = false,int var1 = 0,int var2 = 0, int var3 = 0)
        {
            try
            {
                Dictionary<string, object> vParam = new Dictionary<string, object>();
                vParam.Add("@tipoDoc", TipoDoc);
                vParam.Add("@varidioma", Idioma);
                vParam.Add("@usuario", UsrConn.id_usuario);
                vParam.Add("@temporal", Temporal);
                vParam.Add("@var1", var1);
                vParam.Add("@var2", var1);
                vParam.Add("@var3", var1);

                vCon.IniciarTransaccion();
                string vError = "";
                DataTable vResp = vCon.Ejecutar("[impexcom_sistema].[sp_genera_folio]", ref vError, vParaMetros: vParam);
                vCon.Confirmar();                
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al obtener folio .<br/>" + ex.Message, ex);
            }
        }

        public DataTable GetFolioById(int IdFolio)
        {
            try
            {
                string query = string.Empty;

                query = " SELECT * FROM Folio_Documento WHERE fd_id = " + IdFolio.ToString();
                
                vCon.IniciarTransaccion();
                string vError = "";
                DataTable vResp = vCon.Ejecutar(query, ref vError, vParaMetros: null, vTimeoutConexion: 90, vEsProcedimiento: false);
                vCon.Confirmar();
                return vResp;
            }
            catch (Exception ex)
            {

                throw new Exception("Ocurrio un error al obtener datos del folio .<br/>" + ex.Message, ex);
            }
        }


    }
}
