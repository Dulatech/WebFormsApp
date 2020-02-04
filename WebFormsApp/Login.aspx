<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFormsApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox ID="TextBox1" placeholder="Username"   required="required" runat="server" Width="200px"></asp:TextBox>
        <p>
        <asp:TextBox ID="TextBox2" placeholder="Password"  required="required" TextMode="Password" runat="server" Width="200px" ></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Height="26px" Width="69px" />
         <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Register" Height="26px" Width="69px" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
