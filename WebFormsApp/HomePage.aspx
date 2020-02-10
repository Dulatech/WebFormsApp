<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebFormsApp.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
         <asp:Button ID="Button5" runat="server" Text="Home Page" OnClick="Home_Click" BackColor="#CCCCCC" />
        <asp:Button ID="Button1" runat="server" Text="Customers" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Employees" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Services" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button7" formnovalidate="formnovalidate" runat="server" Text="Logout" OnClick="Logout" />
        <br />
        <br />
        <h1>Welcome To The Home Page!</h1>
    </form>
</body>
</html>
