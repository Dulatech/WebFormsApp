<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebFormsApp.HomePage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button7" formnovalidate="formnovalidate" runat="server" Text="Logout" OnClick="Logout" />
    <br />
    <br />
    <h1>Welcome To The Home Page!</h1>
</asp:Content>
