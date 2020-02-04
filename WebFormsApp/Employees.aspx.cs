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
    public partial class Employees : System.Web.UI.Page
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


        protected void Add_Customer(object sender, EventArgs e)
        {
            

            string name = TextBox1.Text;
            string address = TextBox2.Text;
            string managerID = TextBox3.Text;
            string job = TextBox4.Text;
            string cert = TextBox5.Text;
            DateTime date = DateTime.Parse(TextBox6.Text);
            string date_s = date.ToString("yyyy-MM-dd");
            string sal = TextBox7.Text;

            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                    OdbcConnection connection = new OdbcConnection(myConnection);
                    connection.Open();
                    OdbcCommand command = new OdbcCommand();
                    OdbcTransaction transaction = null;
                    transaction = connection.BeginTransaction();
                    command.Connection = connection;
                    command.Transaction = transaction;
                    
                    command.CommandText = "INSERT INTO Employee VALUES (SYS_GUID(), '" + name + "', '" + address + "', '" + managerID + "', '" + job + "', '" + cert + "',DATE'" + date_s + "','" + sal + "')";
                    
                    command.ExecuteNonQuery();
                    transaction.Commit();
                    command.Connection.Close();
                    connection.Close();
                    Load_List();
                
            

        }


        protected void Load_List()
        {
                string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                OdbcConnection myConn = new OdbcConnection(myConnection);
                myConn.Open();
                string mySelectQuery = "Select ID, Name, Address, ManagerID, JobTitle, CertifiedFor, StartDate, Salary from Employee ORDER BY Name";
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

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String str = (String)e.CommandName;

            string[] words = str.Split(',');
           
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "DELETE FROM Employee WHERE ID ='" + words[0] + "'";
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

        protected void OnRowDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
               
                DateTime bytes2 = (DateTime)(e.Item.DataItem as DataRowView)["StartDate"];
                (e.Item.FindControl("Date") as TextBox).Text = String.Format("{0:yyyy-MM-dd}", bytes2);

            }
        }

    }
}