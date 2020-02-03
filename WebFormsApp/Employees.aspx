<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="WebFormsApp.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #info{
            display:none;
        }
         #employee{
            border: solid 1pt black;
            width: 200px;
        }
            #employee:hover {
                background-color: gainsboro;
            }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Home Page" OnClick="Home_Click"/>
            <br />
                <asp:TextBox ID="TextBox1" placeholder="Name" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox2" placeholder="Address" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox3" placeholder="Manger ID" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox4" placeholder="Job Title" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox5" placeholder="Certified For" runat="server"></asp:TextBox>
                <br />
               <asp:TextBox ID="TextBox6" TextMode="Date"  runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox7" placeholder="Salary" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
                <br />
                <br />
         </div>


        <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" > 
           
                <ItemTemplate>
                   
                   
                    <div id ="employee">
                         <div id ="basics">
                    
                     <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                        <br>
                         <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details"/>
                       
                         <asp:Button ID="ButtonDel" CommandName='<%#Eval("ID") + "," +  Eval("Address") + "," + Eval("ManagerID") + "," + Eval("JobTitle") + "," + Eval("CertifiedFor")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                      </div>
                        <div class="info" id ="info" >
                         <br> 
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Name") %>'> </asp:TextBox>
                    <br> 
                     <asp:TextBox runat="server" Text='<%# Eval("Address") %>'></asp:TextBox> 
                    <br>
                            <asp:TextBox runat="server" Text='<%# Eval("ManagerID") %>'></asp:TextBox> 
                    <br>
                             <asp:TextBox runat="server" Text='<%# Eval("JobTitle") %>'></asp:TextBox> 
                    <br>
                             <asp:TextBox runat="server" Text='<%# Eval("CertifiedFor") %>'></asp:TextBox> 
                    <br>
                    
                         <asp:TextBox TextMode="Date"  runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
                     <br>
                    <asp:TextBox runat="server" Text='<%# Eval("Salary") %>'></asp:TextBox>
                          <asp:Button ID="ButtonEdit" runat="server" Text="Edit"/>
                          <br>

                         
                          </div>
                     </div>
             <br>
            </ItemTemplate>
        </asp:ListView>

    </form>
</body>
</html>
