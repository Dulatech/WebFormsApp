using System;
using System.Web.UI;
using System.Data.Odbc;

namespace WebFormsApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "SELECT * FROM Users";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
            OdbcDataReader reader = command.ExecuteReader();
            bool isValid = false;
            while (reader.Read())
            {
                string name = reader.GetString(1);
                string password = reader.GetString(2);
                if(name.Contains(TextBox1.Text) && password.Contains(TextBox2.Text))
                {
                    Session["UserID"] = name;
                    isValid = true;
                    break;
                }
            }
            command.Connection.Close();
            myConn.Close();
            if (isValid)
            {
                Response.Redirect("HomePage.aspx");
            } else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid username / password')", true);

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if ((TextBox1.Text.Length != 0) || (TextBox1.Text.Length != 0)) {

                string username = TextBox1.Text;
                string password = TextBox2.Text;
                string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                OdbcConnection myConn = new OdbcConnection(myConnection);
                myConn.Open();
                string mySelectQuery = "SELECT * FROM Users";
                OdbcCommand command2 = new OdbcCommand(mySelectQuery, myConn);
                OdbcDataReader reader = command2.ExecuteReader();
                bool isValid = true;
                while (reader.Read())
                {
                    string name = reader.GetString(1);
                    string pass = reader.GetString(2);
                    if (name.Contains(TextBox1.Text) && pass.Contains(TextBox2.Text))
                    {
                        isValid = false;
                        break;
                    }
                }
               
                if (isValid)
                {
                    Session["UserID"] = username;
                    string myInsertQuery = "INSERT INTO Users VALUES (SYS_GUID(), '" + username + "', '" + password + "')";
                    OdbcCommand command = new OdbcCommand(myInsertQuery, myConn);
                    command.ExecuteNonQuery();
                    command2.Connection.Close();
                    command.Connection.Close();
                    myConn.Close();
                    Response.Redirect("HomePage.aspx");
                }
            }
        }

    }
}