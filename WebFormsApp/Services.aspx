<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebFormsApp.Services" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <div>
        <asp:TextBox ID="TextBox1" placeholder="Service Type" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" placeholder="Certification" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" placeholder="Rate" runat="server" required="required"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>

        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
    </div>

    <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDeleting="ListView1_ItemDeleting" OnItemEditing="ListView1_ItemEditing">
        <ItemTemplate>
            <div id="service">
                <div id="basics">
                    <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                    <br>
                    <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>
                    <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName="Delete" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                </div>
                <div class="info" id="info" style="display: none;">
                    <br>
                    <asp:TextBox ID="EditName" runat="server" placeholder='<%# Eval("Name") %>'> </asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditCrt" runat="server" placeholder='<%# Eval("CertificationRqts") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox  ID="EditRate" runat="server" placeholder='<%# Eval("Rate") %>'></asp:TextBox>
                    <br>
                    <asp:Button ID="ButtonEdit" formnovalidate="formnovalidate" CommandName="Edit" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Edit" />
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
