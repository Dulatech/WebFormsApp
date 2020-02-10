<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebFormsApp.Customers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <div id="former">
        <asp:TextBox ID="TextBox1" placeholder="Name" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" placeholder="Address" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Date of Birth: "></asp:Label>
        <asp:TextBox ID="TextBox3" TextMode="Date" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" required="required" />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
    </div>
    <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDataBound="OnRowDataBound" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
        <ItemTemplate>
            <div id="customer">
                <div id="basics">
                    <asp:Image ID="pictureControlID" runat="server" Width="80" Height="80"/>
                    <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                    <br>
                    <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                    <button type="button" id="ButtonDet" onclick="details(this)">Details</button>
                    <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName="Delete" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                </div>
                <div class="info" id="info" style="display: none;">
                    <br>
                    <asp:TextBox ID="EditName" runat="server" placeholder='<%# Eval("Name") %>'> </asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditAddress" runat="server" placeholder='<%# Eval("Address") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditDate" TextMode="Date" runat="server" Text='<%# Eval("Birthdate") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditGender" runat="server" placeholder='<%# "Gender: "+ Eval("Gender") %> '></asp:TextBox>
                    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" formnovalidate="formnovalidate" CommandName="Edit" CommandArgument='<%#Eval("ID")%>'/>
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

