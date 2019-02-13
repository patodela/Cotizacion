using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    public class ConexionSQL
    {

        public bool bError;
        public string sError;

        private string ConectionString;
       

        private SqlConnection Conexion = new SqlConnection("server=204.93.168.25;user id=impexcom_sistema;database=impexcom_cotizacion;password=Abc123456");
        public SqlConnection AbrirConexion()
        {
            try
            {
                if (Conexion.State == System.Data.ConnectionState.Closed)
                {
                    Conexion.Open();
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return Conexion;
        }
        public SqlConnection CerrarConexion()
        {
            try
            {
                if (Conexion.State == System.Data.ConnectionState.Open)
                {
                    Conexion.Close();
                }

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            return Conexion;
        }

        public DataSet Seleccionar(SqlCommand Cmd)
        {
            bError = false;
            sError = string.Empty;

            SqlConnection Cn = new SqlConnection();
            SqlDataAdapter Sa = new SqlDataAdapter(Cmd);

            try
            {

                Cn.ConnectionString = ConectionString;
                Cn.Open();

                Cmd.Connection = Cn;
                Cmd.CommandTimeout = 0;

                DataSet Ds = new DataSet();

                Sa.Fill(Ds);

                Sa.Dispose();
                Cn.Close();

                bError = false;

                return Ds;


            }
            catch (SqlException eSql)
            {
                if (Cn.State != ConnectionState.Closed)
                    Cn.Close();

                Sa = null;

                bError = true;
                sError = eSql.Message;

                return null;

            }
            catch (Exception e)
            {

                if (Cn.State != ConnectionState.Closed)
                    Cn.Close();

                Sa = null;

                bError = true;
                sError = e.Message;

                return null;
            }

        }

        public List<SqlParameter> EjecutarSp(string Sp, List<SqlParameter> lSqlParam)
        {
            bError = false;
            sError = string.Empty;

            SqlConnection Cn = new SqlConnection();
            SqlCommand sc = new SqlCommand();

            try
            {

                SqlParameter plError = new SqlParameter();
                plError.ParameterName = "@bError";
                plError.Direction = ParameterDirection.Output;
                plError.SqlDbType = SqlDbType.Int;

                lSqlParam.Add(plError);
                plError = null;

                SqlParameter psError = new SqlParameter();
                psError.ParameterName = "@sError";
                psError.Direction = ParameterDirection.Output;
                psError.SqlDbType = SqlDbType.NVarChar;
                psError.Size = 4000;

                lSqlParam.Add(psError);
                psError = null;

                Cn.ConnectionString = ConectionString;
                Cn.Open();



                sc.Connection = Cn;
                sc.CommandType = CommandType.StoredProcedure;
                sc.CommandText = Sp;
                sc.CommandTimeout = 0;



                foreach (SqlParameter param in lSqlParam)
                {
                    sc.Parameters.Add(param);
                }

                sc.ExecuteNonQuery();
                sc.Parameters.Clear();

                sc.Dispose();
                Cn.Close();



                if (!string.IsNullOrEmpty(lSqlParam[lSqlParam.Count() - 2].Value.ToString()))
                {
                    int lErr = Convert.ToInt32(lSqlParam[lSqlParam.Count() - 2].Value);

                    if (lErr > 0)
                    {
                        bError = true;
                        sError = lSqlParam[lSqlParam.Count() - 1].Value.ToString();
                    }

                }

                return lSqlParam;
            }
            catch (SqlException eSql)
            {
                if (Cn.State != ConnectionState.Closed)
                    Cn.Close();

                sc.Dispose();

                bError = true;
                sError = eSql.Message;

                return null;
            }
            catch (Exception e)
            {
                if (Cn.State != ConnectionState.Closed)
                    Cn.Close();

                sc.Dispose();

                bError = true;
                sError = e.Message;

                return null;
            }

        }


    }
}
