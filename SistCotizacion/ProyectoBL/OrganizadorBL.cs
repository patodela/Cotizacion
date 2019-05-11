using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProyectoDA;
using MSSQLSUL;
using System.Data;
using MSSQLSUL.Seguridad;


namespace ProyectoBL
{
    public class OrganizadorBL
    {


        private MSSQLSUL.Seguridad.Usuario DataUser { get; set; }
        private OrganizadorDA dAcces { get; set; }

        public OrganizadorBL(MSSQLSUL.Seguridad.Usuario strUsr)
        {
            this.DataUser = strUsr;
            dAcces = new OrganizadorDA(DataUser);
        }

        public DataTable GetDataOrganizador()
        {
            DataTable OrgaData = new DataTable();            
            OrgaData = dAcces.GetOrganizador();
            return OrgaData;
        }
        public DataTable GetDataSKU(nombreTabla _nameTabla)
        {
            DataTable OrgaData = new DataTable();
            OrgaData = dAcces.GetDescripcionSKU(_nameTabla);
            return OrgaData;
        }
        public DataTable GetGrupo()
        {
            DataTable OrgaData = new DataTable();          
            OrgaData = dAcces.GetGrupo();
            return OrgaData;
        }
        public void actualiza_organizador(nombreTabla _tipoTabla, int idOrganizacion, string descripcion, string codLetra = null)
        {
            try
            {
                dAcces.Upd_Organizador_Familia(_tipoTabla, idOrganizacion, descripcion, codLetra);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            
        }
        public void add_descripcion_SKU(nombreTabla _tipoTabla, string descripcion,string codLetra = null)
        {
            try
            {
                DataTable OrgaData = new DataTable();
                if (ValCantidadInsert(_tipoTabla,codLetra))
                {
                    dAcces.Inserta_Descripcion_SKU(_tipoTabla, descripcion,codLetra);
                }
                else
                    throw new Exception("No puede ingresar un nuevo codigo, el limite es :" + GetLimite(_tipoTabla).ToString());
              
                
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

        }

        public bool ValCantidadInsert(nombreTabla _nombreTabla,string codLetra = null)
        {
            bool resp = false;
            try
            {
                DataTable OrgaData = new DataTable();
                OrgaData = dAcces.CountRegistroTabla(_nombreTabla, codLetra);
                int cantRegistros = 0;
                if (OrgaData.Rows.Count > 0)
                {
                    cantRegistros = Convert.ToInt32(OrgaData.Rows[0][0].ToString());
                }
               
                int limiteRegistro = GetLimite(_nombreTabla);

                if (cantRegistros >= limiteRegistro)
                {
                    resp = false;
                }
                else
                {
                    resp = true;
                }
                

            }
            catch (Exception ex)
            {
                
                throw new Exception(ex.Message);
            }
            return resp;
        }


        public int GetLimite(nombreTabla _tabla)
        {
            int cant = int.MinValue;
            switch (_tabla.ToString())
            {
                case "VAR_PRINCIPAL_GRUPO":
                    cant = Convert.ToInt32(LimiteTabla.VAR_PRINCIPAL_GRUPO);
                    break;
                case "VAR_PRINCIPAL_ARTICULO":
                    cant = Convert.ToInt32(LimiteTabla.VAR_PRINCIPAL_ARTICULO);
                    break;
                case "VCP_CARACTERISTICA_1":
                    cant = Convert.ToInt32(LimiteTabla.VCP_CARACTERISTICA_1);
                    break;
                case "VCP_CARACTERISTICA_2":
                    cant = Convert.ToInt32(LimiteTabla.VCP_CARACTERISTICA_2);
                    break;
                case "VCP_CARACTERISTICA_3":
                    cant = Convert.ToInt32(LimiteTabla.VCP_CARACTERISTICA_3);
                    break;
                case "VAR_CUANTIFICACION_SECUNDARIA":
                    cant = Convert.ToInt32(LimiteTabla.VAR_CUANTIFICACION_SECUNDARIA);
                    break;
                case "VAR_CUANTI_COMBINACION_1":
                    cant = Convert.ToInt32(LimiteTabla.VAR_CUANTI_COMBINACION_1);
                    break;
                case "VAR_CUANTI_COMBINACION_2":
                    cant = Convert.ToInt32(LimiteTabla.VAR_CUANTI_COMBINACION_2);
                    break;
                case "VAR_IDENTI_COMBINACION_1":
                    cant = Convert.ToInt32(LimiteTabla.VAR_IDENTI_COMBINACION_1);
                    break;
                case "VAR_IDENTI_COMBINACION_2":
                    cant = Convert.ToInt32(LimiteTabla.VAR_IDENTI_COMBINACION_2);
                    break;
                case "VAR_IDENTI_CAR1":
                    cant = Convert.ToInt32(LimiteTabla.VAR_IDENTI_CAR1);
                    break;
                default:
                    break;
            }
            return cant;

        }
    }
}
