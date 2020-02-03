<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebFormsApp.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #info{
            /*display:none;*/
        }
         #service{
            border: solid 1pt black;
            width: 200px;
        }
            #service:hover {
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
                <asp:TextBox ID="TextBox2" placeholder="Certification" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBox3" placeholder="Rate" runat="server"></asp:TextBox>
                
                <br />
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
            </div>

         <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" > 
           
                <ItemTemplate>
                   
                   
                    <div id ="service">
                         <div id ="basics">
                    
                     <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                        <br>
                         <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details"/>
                       
                         <asp:Button ID="ButtonDel" CommandName='<%#Eval("ID") + "," +  Eval("Name")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                      </div>
                        <div class="info" id ="info" >
                         <br> 
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Name") %>'> </asp:TextBox>
                    <br> 
                     <asp:TextBox runat="server" Text='<%# Eval("CertificationRqts") %>'></asp:TextBox> 
                    <br>
                            <asp:TextBox runat="server" Text='<%# Eval("Rate") %>'></asp:TextBox> 
                    <br>
                    
                    
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
