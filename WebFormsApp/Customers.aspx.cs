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
    public partial class Customers : System.Web.UI.Page
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

            }
        }

        void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String str = (String)e.CommandName;

            string[] words = str.Split(',');
            
            string myConnection = "dsn=mySqlServer;uid=system;pwd=oracle1";
            OdbcConnection myConn = new OdbcConnection(myConnection);
            myConn.Open();
            string mySelectQuery = "DELETE FROM Customer WHERE ID ='" + words[0] + "'";
            OdbcCommand command = new OdbcCommand(mySelectQuery, myConn);
            command.ExecuteNonQuery();
            
            command.Connection.Close();
            myConn.Close();
            Load_List();

        }



    }
}