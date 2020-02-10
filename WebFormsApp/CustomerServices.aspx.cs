using System;
using System.Web.UI;
using System.Data;
using System.Data.Odbc;
using System.Web.UI.WebControls;

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
                string name = Session["CustName"].ToString();
                if (userID == null || userID == "")
                {
                    return;
                }
                else
                {
                    Label1.Text = userID;
                    Label2.Text = name;
                }
                Load_List();
                Load_Drop();
            }
        }

        protected void Load_List()
        {
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "Select CustomerID, ServiceTypeID, ExpectedDuration from CustomerService WHERE CustomerID ='" + Session["CustID"].ToString() + "'";
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

        protected void OnRowDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                string bytes2 = (string)(e.Item.DataItem as DataRowView)["ServiceTypeID"];
                string name = "";
                string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                OdbcConnection myConn = new OdbcConnection(myConnection);
                myConn.Open();
                string mySelectQuery = "Select Name from ServiceType WHERE ID='" + bytes2 + "'";
                OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
                OdbcDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    name = reader.GetString(0);


                }
                (e.Item.FindControl("Label2") as Label).Text = name;


            }
        }

        protected void Load_Drop()
        {
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "Select Name from ServiceType";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);


            using (OdbcDataAdapter sda = new OdbcDataAdapter(command))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataBind();
            }
            myConn.Close();
            //}
        }


        protected void Add_Customer(object sender, EventArgs e)
        {



            string servID = find_id(DropDownList1.Text);
            string dur = TextBox3.Text;

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection connection = new OdbcConnection(myConnection);
            connection.Open();
            OdbcCommand command = new OdbcCommand();
            OdbcTransaction transaction = null;
            transaction = connection.BeginTransaction();
            command.Connection = connection;
            command.Transaction = transaction;

            command.CommandText = "INSERT INTO CustomerService VALUES ('" + Session["CustID"].ToString() + "', '" + servID + "', '" + dur + "')";

            command.ExecuteNonQuery();
            transaction.Commit();
            command.Connection.Close();
            connection.Close();
            Load_List();



        }

        protected string find_id(string s)
        {
            string id = "";
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "Select ID from ServiceType WHERE Name='" + s + "'";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
            OdbcDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                id = reader.GetString(0);

            }
            return id;
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String str = (String)e.CommandName;

            string[] words = str.Split(',');

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "DELETE FROM CustomerService WHERE CustomerID ='" + Session["CustID"].ToString() + "'AND ServiceTypeID = '" + words[1] + "'";
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



        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}