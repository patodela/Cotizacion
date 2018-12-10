using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ProyectoDA
{
    public class UsuarioDA
    {


        public bool bError { get; set; }
        public string sError { get; set; }

        public DataSet dsUsuario { get; set; }



        public UsuarioDA()
        {

        }


        /// <summary>
        /// Verifica si existe el usuario y si esta activo 
        /// </summary>
        /// <returns>true si existe, false si no existe o esta inactivo, var sError indica motivo </returns>
        public bool existeUsuario(string usuario,string pass)
        {

            bError = false;
            sError = string.Empty;

            bool existe = false;
            try
            {

                string[] Cn = Properties.Settings.Default.sConexion.Split(';');
                string Pass = Properties.Settings.Default.sPassConexion;
                ConexionSQL oSql = new ConexionSQL(Cn[0], Cn[1], Cn[2], Pass);

                List<SqlParameter> lp = new List<SqlParameter>();
                SqlParameter p = new SqlParameter("@sUsuario", SqlDbType.VarChar,10);
                p.Value = usuario;
                lp.Add(p);
                p = new SqlParameter("@sPasswd", SqlDbType.VarChar, 15);
                p.Value = pass;                
                lp.Add(p);

                lp = oSql.EjecutarSp("sp_busca_usuario", lp);

                if (oSql.bError) //usuario no existe
                {
                    bError = true;
                    existe = false;
                    sError = oSql.sError;
                }
                else // existe
                { 
                    existe = true;
                    sError = oSql.sError;

                }        
                               

            }
            catch (Exception ex)
            {
                bError = true;
                sError = ex.Message;
                existe = false;
            }

            return existe;
        }

        
        

        
        
    }
}
