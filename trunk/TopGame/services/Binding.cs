using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TopGame.Services
{
    public class Binding
    {
        SqlConnection connection;

        public SqlConnection Connection
        {
            get { return connection; }
            set { connection = value; }
        }
        SqlCommand command;
        SqlDataAdapter adapter;
        DataSet dataSet;

        public DataTable getData(String qry)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            connection.Open();
            command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = qry;
            adapter = new SqlDataAdapter(command);
            dataSet = new DataSet();
            adapter.Fill(dataSet);
            DataTable dTable = new DataTable();
            dTable = dataSet.Tables[0];
            return dTable;
        }

        public SqlDataReader getDataReader(String qry)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            connection.Open();
            command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = qry;
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        public void executeQry(String qry)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            connection.Open();
            command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = qry;
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}