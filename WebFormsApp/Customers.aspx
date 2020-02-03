<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebFormsApp.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #info{
            /*display:none;*/
        }
         #customer{
            border: solid 1pt black;
            width: 200px;
        }
            #customer:hover {
                background-color: gainsboro;
            }

    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Home Page" OnClick="Home_Click"/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" placeholder="Name" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" placeholder="Address" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox3" TextMode="Date"  runat="server"></asp:TextBox>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
            <br />
            <br />
        </div>
        <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDataBound="OnRowDataBound" > 
           
                <ItemTemplate>
                   
                   
                    <div id ="customer">
                         <div id ="basics">
                    <asp:Image ID="pictureControlID" runat="server" width="80" height="80" AlternateText='<% #Eval("Name") %>'  />
                     <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                        <br>
                         <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details"/>
                       
                         <asp:Button ID="ButtonDel" CommandName='<%#Eval("ID") + "," +  Eval("Address") + "," + Eval("Birthdate") + "," + Eval("Gender")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                      </div>
                        <div class="info" id ="info" >
                         <br> 
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Name") %>'> </asp:TextBox>
                    <br> 
                     <asp:TextBox runat="server" Text='<%# Eval("Address") %>'></asp:TextBox> 
                    <br>
                    
                         <asp:TextBox TextMode="Date"  runat="server" Text='<%# Eval("Birthdate") %>'></asp:TextBox>
                     <br>
                    <asp:TextBox runat="server" Text='<%# Eval("Gender") %>'></asp:TextBox>
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


