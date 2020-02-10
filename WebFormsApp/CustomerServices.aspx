<%@ Page Title="Customer Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerServices.aspx.cs" Inherits="WebFormsApp.CustomerServices" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <div>
        <asp:TextBox ID="TextBox1" placeholder="Customer ID" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" placeholder="Service ID" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" placeholder="Expected Time (Minutes)" runat="server" required="required"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        <br />

        <br />
        <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
        <br />
    </div>
    <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDeleting="ListView1_ItemDeleting" >
        <ItemTemplate>
            <div id="custServ">
                <div id="basics">
                    <asp:Label ID="Lab" runat="server" Text='<%# Eval("CustomerID") %>'> </asp:Label>
                    <br>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ServiceTypeID") %>'> </asp:Label>
                    <br>
                    <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                    <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>
                    <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName='<%#Eval("CustomerID") + "," +  Eval("ServiceTypeID") %>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                </div>
                <div class="info" id="info">
                    <br>
                    <asp:TextBox ID="TextBox4" runat="server" placeholder='<%# Eval("CustomerID") %>'> </asp:TextBox>
                    <br>
                    <asp:TextBox runat="server" placeholder='<%# Eval("ServiceTypeID") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox runat="server" placeholder='<%# Eval("ExpectedDuration") + " Minutes" %>'></asp:TextBox>
                    <br>
                    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" />
                    <br>
                </div>
            </div>
            <br>
        </ItemTemplate>
    </asp:ListView>
    <script>
        function details(el) {
            var x = el.parentNode.nextElementSibling;
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>
</asp:Content>