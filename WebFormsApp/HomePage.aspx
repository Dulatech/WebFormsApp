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
        <asp:Button ID="Button1" runat="server" Text="Customers" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Employees" OnClick="Button2_Click"/>
        <asp:Button ID="Button3" runat="server" Text="Services" OnClick="Button3_Click"/>
        <asp:Button ID="Button4" runat="server" Text="CustomerServices" OnClick="Button4_Click"/>
    </form>
</body>
</html>
