using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.IO;

namespace WebFormsApp
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListView1.ItemCommand += new EventHandler<ListViewCommandEventArgs>(ListView1_ItemCommand);
            if (!Page.IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                else
                {
                    Label1.Text = Session["UserID"].ToString();
                }

                Load_List();
                RadioButtonList1.SelectedIndex = 0;
            }

        }

        protected void Add_Customer(object sender, EventArgs e)
        {
            string gender = RadioButtonList1.SelectedItem.Value.ToString();

            string name = TextBox1.Text;
            string address = TextBox2.Text;
            DateTime date = DateTime.Parse(TextBox3.Text);
            string date_s = date.ToString("yyyy-MM-dd");
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                    OdbcConnection connection = new OdbcConnection(myConnection);
                    connection.Open();
                    OdbcCommand command = new OdbcCommand();
                    OdbcTransaction transaction = null;
                    transaction = connection.BeginTransaction();
                    command.Connection = connection;
                    command.Transaction = transaction;
                    if (gender.Contains("Male"))
                    {
                        command.CommandText = "INSERT INTO Customer VALUES (SYS_GUID(), '" + name + "', '" + address + "',DATE'" + date_s + "', ?,'M')";
                    }
                    else
                    {
                        command.CommandText = "INSERT INTO Customer VALUES (SYS_GUID(), '" + name + "', '" + address + "', DATE'" + date_s + "', ?,'F')";
                    }

                    OdbcParameter imageParam = new OdbcParameter();
                    imageParam.DbType = DbType.Binary;
                    imageParam.Value = bytes;
                    command.Parameters.Add(imageParam);

                    command.ExecuteNonQuery();
                    transaction.Commit();
                    command.Connection.Close();
                    connection.Close();
                    Load_List();
                }
            }
           
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Load_List()
        {
                string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
                OdbcConnection myConn = new OdbcConnection(myConnection);
                myConn.Open();
                string mySelectQuery = "Select ID, Name, Address, Birthdate, Picture, Gender from Customer ORDER BY Name";
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
                byte[] bytes = (byte[])(e.Item.DataItem as DataRowView)["Picture"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                (e.Item.FindControl("pictureControlID") as Image).ImageUrl = "data:image/png;base64," + base64String;
                DateTime bytes2 = (DateTime)(e.Item.DataItem as DataRowView)["Birthdate"];
                (e.Item.FindControl("EditDate") as TextBox).Text = String.Format("{0:yyyy-MM-dd}", bytes2);

            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string id = (string)e.CommandArgument;
            string stmtString = "";
            string stmtString2 = "";
            switch (e.CommandName)
            {
                case "Delete":
                    stmtString = "DELETE FROM Customer WHERE ID ='" + id + "'";
                    stmtString2 = "DELETE FROM CustomerService WHERE CustomerID ='" + id + "'";
                    string myConnection2 = "dsn=mySqlServer;uid=system;pwd=oracle1";
                    OdbcConnection myConn2 = new OdbcConnection(myConnection2);
                    myConn2.Open();
                    OdbcCommand command2 = new OdbcCommand(stmtString2, myConn2);
                    command2.ExecuteNonQuery();
                    command2.Connection.Close();
                    myConn2.Close();
                    break;

                case "Edit":
                    ListViewItem item = e.Item as ListViewItem;
                    string newName = ((TextBox)item.FindControl("EditName")).Text;
                    string newAddress = ((TextBox)item.FindControl("EditAddress")).Text;
                    DateTime newDate = DateTime.Parse(((TextBox)item.FindControl("EditDate")).Text);
                    string newDateS = newDate.ToString("yyyy-MM-dd");
                    string newGender = ((TextBox)item.FindControl("EditGender")).Text;
                    stmtString = "UPDATE Customer SET Name='" + newName + "'" +
                        ", Address='" + newAddress + "'" +
                        ", Birthdate=DATE'" + newDateS + "'" +
                        ", Gender='" + newGender + "'" +
                        " WHERE ID='" + id + "'";
                    break;
                case "Transport":
                    String str = id;

                    string[] words = str.Split(',');
                    Session["CustID"] = words[0];
                    Session["CustName"] = words[1];
                    Response.Redirect("CustomerServices.aspx");
                    break;
            }
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            OdbcCommand command = new OdbcCommand(stmtString, myConn);
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

        protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Item Editing");
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}