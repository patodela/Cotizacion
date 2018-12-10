using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoDA
{
    class ConexionSQL
    {

        public bool bError;
        public string sError;

        private string ConectionString;

        public ConexionSQL(string sServer, string sBase, string sUser, string sPass)
        {
            try
            {

                SqlConnectionStringBuilder sb = new SqlConnectionStringBuilder();
                sb["Data source"] = sServer;
                sb["Initial Catalog"] = sBase;
                sb["UID"] = sUser;
                sb["PWD"] = sPass;

                ConectionString = sb.ConnectionString;


                bError = false;

            }
            catch (SqlException eSql)
            {

                bError = true;
                sError = eSql.Message;

            }
            catch (Exception e)
            {
                bError = true;
                sError = e.Message;

            }
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
                plError.ParameterName = "@lError";
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
