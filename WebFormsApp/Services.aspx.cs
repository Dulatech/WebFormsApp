using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormsApp
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListView1.ItemCommand += new EventHandler<ListViewCommandEventArgs>(ListView1_ItemCommand);
            if (!Page.IsPostBack)
            {
                string userID = Session["UserID"].ToString();
                if (userID == null || userID == "")
                {
                    return;
                }
                else
                {
                    Label1.Text = userID;
                    Load_List();
                }
            }
        }

        protected void Load_List()
        {
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "Select ID, Name, CertificationRqts, Rate from ServiceType ORDER BY Name";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);


            using (OdbcDataAdapter sda = new OdbcDataAdapter(command))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            myConn.Close();
            //}
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Add_Customer(object sender, EventArgs e)
        {


            string name = TextBox1.Text;
            string cert = TextBox2.Text;
            string rate = TextBox3.Text;

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection connection = new OdbcConnection(myConnection);
            connection.Open();
            OdbcCommand command = new OdbcCommand();
            OdbcTransaction transaction = null;
            transaction = connection.BeginTransaction();
            command.Connection = connection;
            command.Transaction = transaction;

            command.CommandText = "INSERT INTO ServiceType VALUES (SYS_GUID(), '" + name + "', '" + cert + "', '" + rate  + "')";

            command.ExecuteNonQuery();
            transaction.Commit();
            command.Connection.Close();
            connection.Close();
            Load_List();



        }

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String str = (String)e.CommandName;

            string[] words = str.Split(',');

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "DELETE FROM ServiceType WHERE ID ='" + words[0] + "'";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
            command.ExecuteNonQuery();

            command.Connection.Close();
            myConn.Close();
            Load_List();

        }

    }
}