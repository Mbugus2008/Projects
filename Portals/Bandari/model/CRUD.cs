#region
using System;
using System.Data;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Net.Mail;
using System.IO;
using System.Text.RegularExpressions;
using Bandari_Sacco.controller;
using Bandari_Sacco;

#endregion
namespace Bandari_Sacco
{
    public class CRUD
    {
        #region Example on Code
        /* string table = "user_registration";
     * string[] Fields = { "id", "first_name", "last_name", "email", "username", "password_", "role" };
     * string[] Values = { "7", "Steve", "S", "m@gmail.com", "Steve", "Steve", "Admin1" };
     * CRUD crud = new CRUD();
     * crud.Insert("login", Fields, Values);
     * crud.Update(table, Fields, Values, "first_name", "Steve");
     * crud.Delete(table, Fields, Values, "first_name", "Steve");
     * 
     * ------------------- Fetch data --------------------------
     * 
     * SqlDataReader dataReader  = crud.extractData(conn, Fields, table, 0, "1"); // 0,1 ... => Fields positions
     * label1.Text = dataReader["first_name"].ToString();
     */
        #endregion
        #region Variables

        //public static SqlConnection connToNAV;
        //public static string CompanyName = ""; //Waumini Sacco Society Limited
        //public static string ListingPerPage = "200";

        public static SqlConnection connection;

        SqlConnection conn = CRUD.getconnToNAV();
        SqlDataReader dataReader;

        string CompanyName;

        string redirectPage;

        #endregion

        //public CRUD() { }

        //public CRUD(string CompanyName) { }

       
        #region getconn To NAV

        public static SqlConnection getconnToNAV()
        {
            try
            {
                if (connection == null || connection.State == ConnectionState.Closed)

                    connection = new SqlConnection(@"Data Source=" + Config.source + ";Initial Catalog=" + Config.dbName + ";MultipleActiveResultSets=true;User ID=" + Config.user + ";Password=" + Config.password + "");

                connection.Open();

            }
            catch (Exception e)
            {
                e.Data.Clear();
            }

            return connection;
        }
        #endregion

        #region

        #endregion

        #region Insert
        public void Insert(String table, String[] Fields, String[] Values)
        {
            String bac = "]" + "," + "[";
            String fields = implodeArrayBackTicked(Fields, bac);
            String values = implodeArray(Values, "\',\'");

            String query = "INSERT INTO " + putBrackets(table) + " ( " + fields + " )\n VALUES ( " + values + " )";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

        }

        #endregion

        #region Update
        public void Update(String table, String[] Fields, String[] Values, String f, String v)
        {
            String delimeter = ",";
            String query = "UPDATE " + putBrackets(table) + " SET " + implodeBackTickedUpdateArray(delimeter, Fields, Values) + " WHERE " + putBrackets(f) + " ='" + v + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

        }

        #endregion

        #region Delete
        public void Delete(String table, String[] Fields, String[] Values, String f, String v)
        {

            try
            {
                String query = "DELETE FROM " + putBrackets(table) + " WHERE " + putBrackets(f) + " = '" + v + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
        }

        #endregion

        #region extractData
        public SqlDataReader extractData(SqlConnection conn, String[] Fields, String table, String f, String v)
        {
            SqlDataReader DataReader = null;
            String bac = "]" + "," + "[";
            String fields = implodeArrayBackTicked(Fields, bac);
            String query = "SELECT " + fields + " FROM " + putBrackets(table) + " WHERE " + putBrackets(f) + "LIKE '%" + v + "%'";

            try
            {
                SqlCommand command = new SqlCommand(query, conn);
                DataReader = command.ExecuteReader();




            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }

            return DataReader;

        }

        #endregion

        #region extractAllData
        public SqlDataReader extractAllData(SqlConnection conn, String[] Fields, String table)
        {
            SqlDataReader DataReader = null;
            String bac = "]" + "," + "[";
            String fields = implodeArrayBackTicked(Fields, bac);
            String query = "SELECT " + fields + " FROM " + putBrackets(table) + "";

            try
            {
                SqlCommand command = new SqlCommand(query, conn);
                DataReader = command.ExecuteReader();




            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }

            return DataReader;

        }

        #endregion

        #region extractData
        public SqlDataReader extractData(SqlConnection conn, String query)
        {
            SqlDataReader DataReader = null;


            try
            {
                SqlCommand command = new SqlCommand(query, conn);
                DataReader = command.ExecuteReader();




            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }

            return DataReader;

        }

        #endregion

        #region authenticate
        public string[] authenticate(SqlConnection conn, string[] Fields, string table, string f, string v)
        {
            string[] output = new string[2];
                ;
            SqlDataReader DataReader = null;
            String bac = "]" + "," + "[";
            String fields = implodeArrayBackTicked(Fields, bac);//WHERE [User Name] = @UserName AND [Password]=@Password
            //string s = String.Format("SELECT [User Name],[User Type] FROM [{0}$Online Users] WHERE [User Name] = @UserName AND [Password]=@Password ;", MyClass.CompanyName);
            string query = String.Format("SELECT " + fields + " FROM " + putBrackets(table) + "WHERE [User Name] = @UserName AND [Password]=@Password ;",Controller.CompanyName);

            try
            {
                //SqlCommand command = new SqlCommand(query, conn);
                //DataReader = command.ExecuteReader();

                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@UserName", f);
                command.Parameters.AddWithValue("@Password", Controller.GetMd5Hash(v));

                using (SqlDataReader dr = command.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        dr.Read();
                        output[0] = dr["User Name"].ToString();
                        output[1] = dr["User Type"].ToString();
                        
                    }
                    else
                    {

                        string Msg = "Either Waumini Sacco does not recognize the member number," +
                    " or you have not supplied your ID number to the Sacco." +
                    " Contact the Sacco for more assistance.";

                        //lblError.Text = Msg;
                        //Message(Msg);
                        output[3] = Msg;
                    }
                }

                conn.Close();




            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }

            return output;

        }

        #endregion
        /*
         *
         * ---------------------------------------------------------- Query Builders ----------------------------------------------------------
         */
        #region Query Builders
        public static String implodeArray(String[] inputArray, String glueString)
        {
            //Input Variable
            String input = "";
            if (inputArray.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("\'");
                sb.Append(inputArray[0]);
                for (int i = 1; i < inputArray.Length; i++)
                {
                    sb.Append(glueString);
                    sb.Append(inputArray[i]);
                }
                sb.Append("\'");
                input = sb.ToString();
            }
            return input;
        }

        public static String implodeArrayString(String delimeter, String[] Fields, String[] Values)
        {
            //Input Variable
            String output = "";
            if (Fields.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                for (int counter = 0; counter < Values.Length; counter++)
                {
                    String temp = "`" + Fields[counter] + "`" + " = \'" + Values[counter] + "\'";
                    sb.Append(temp);
                    sb.Append(delimeter);

                }

                output = sb.ToString();
            }

            output = output.Substring(0, output.Length - 4) + ' ';
            return output;
        }

        public static String implodeArrayBackTicked(String[] inputArray, String glueString)
        {
            //Input Variable
            String input = "";
            if (inputArray.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("[");
                sb.Append(inputArray[0]);
                for (int i = 1; i < inputArray.Length; i++)
                {
                    sb.Append(glueString);
                    sb.Append(inputArray[i]);
                }
                sb.Append("]");
                input = sb.ToString();
            }
            return input;
        }

        public static String implodeArrayBackTickedQuery(String[] inputArray, String glueString)
        {
            //Input Variable
            String input = "";
            if (inputArray.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("`");
                sb.Append(inputArray[0]);
                for (int i = 1; i < inputArray.Length; i++)
                {
                    sb.Append("`");
                    sb.Append(glueString);
                    sb.Append("`");
                    sb.Append(inputArray[i]);

                }
                sb.Append("`");
                input = sb.ToString();
            }
            return input;
        }

        public static String getBackTickedFieldAt(int position, String[] inputArray, String glueString)
        {
            //Input Variable
            String input = "";
            if (inputArray.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("`");
                sb.Append(inputArray[0]);
                for (int i = 1; i < position; i++)
                {
                    sb.Append(glueString);
                    sb.Append(inputArray[i]);
                }
                sb.Append("`");
                input = sb.ToString();
            }
            return input;

        }

        public static String implodeArrayUnquoted(String[] inputArray, String glueString)
        {
            //Output Variable
            String output = "";
            if (inputArray.Length > 0)
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(inputArray[0]);
                for (int i = 1; i < inputArray.Length; i++)
                {
                    sb.Append(glueString);
                    sb.Append(inputArray[i]);
                }

                output = sb.ToString();
            }
            return output;
        }

        static String implode(String delimeter, String[] Values)
        {
            String update = "";
            if (Values.Length > 0)
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(Values[0]);
                for (int i = 1; i < Values.Length; i++)
                {
                    sb.Append(delimeter);
                    sb.Append(Values[i]);
                }

                update = sb.ToString();
            }
            return update;
        }

        public static String implodeUpdateArray(String delimeter, String[] Fields, String[] Values)
        {
            //Input Variable
            String output = "";
            if (Fields.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                for (int counter = 0; counter < Values.Length; counter++)
                {
                    String temp = Fields[counter] + " = \'" + Values[counter] + "\'";
                    sb.Append(temp);
                    sb.Append(delimeter);

                }

                output = sb.ToString();
            }

            output = output.Substring(0, output.Length - 1) + ' ';
            return output;
        }

        public static String implodeBackTickedUpdateArray(String delimeter, String[] Fields, String[] Values)
        {
            //Input Variable
            String output = "";
            if (Fields.Length > 0)
            {
                StringBuilder sb = new StringBuilder();
                for (int counter = 0; counter < Values.Length; counter++)
                {
                    String temp = "[" + Fields[counter] + "]" + " = \'" + Values[counter] + "\'";
                    sb.Append(temp);
                    sb.Append(delimeter);

                }

                output = sb.ToString();
            }

            output = output.Substring(0, output.Length - 1) + ' ';
            return output;
        }

        public static String putBrackets(string s)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            sb.Append(s);
            sb.Append("]");
            return sb.ToString();
        }
        #endregion



    }
}