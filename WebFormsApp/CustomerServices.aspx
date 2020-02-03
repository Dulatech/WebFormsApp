<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerServices.aspx.cs" Inherits="WebFormsApp.CustomerServices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <asp:Label ID="Label2" runat="server" Text="CustomerService"></asp:Label>
    </form>
</body>
</html>
