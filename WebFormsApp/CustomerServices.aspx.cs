using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.Odbc;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;

namespace WebFormsApp
{
    public partial class CustomerServices : System.Web.UI.Page
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
            }
                Load_List();
            }
        }

        protected void Load_List()
        {
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "Select CustomerID, ServiceTypeID, ExpectedDuration from CustomerService ORDER BY CustomerID";
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


        protected void Add_Customer(object sender, EventArgs e)
        {


            string custID = TextBox1.Text;
            string servID = TextBox2.Text;
            string dur = TextBox3.Text;

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection connection = new OdbcConnection(myConnection);
            connection.Open();
            OdbcCommand command = new OdbcCommand();
            OdbcTransaction transaction = null;
            transaction = connection.BeginTransaction();
            command.Connection = connection;
            command.Transaction = transaction;

            command.CommandText = "INSERT INTO CustomerService VALUES ('" + custID + "', '" + servID + "', '" + dur + "')";

            command.ExecuteNonQuery();
            transaction.Commit();
            command.Connection.Close();
            connection.Close();
            Load_List();



        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String str = (String)e.CommandName;

            string[] words = str.Split(',');

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "DELETE FROM CustomerService WHERE CustomerID ='" + words[0] + "'AND ServiceTypeID = '" + words[1] + "'";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
            command.ExecuteNonQuery();

            command.Connection.Close();
            myConn.Close();
            Load_List();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employees.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerServices.aspx");
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}