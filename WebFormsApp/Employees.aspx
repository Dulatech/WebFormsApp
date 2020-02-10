<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="WebFormsApp.Employees" %>

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
        <asp:TextBox ID="TextBox3" placeholder="Manger ID" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox4" placeholder="Job Title" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" placeholder="Certified For" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Start Date: "></asp:Label>
        <asp:TextBox ID="TextBox6" TextMode="Date" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox7" placeholder="Salary" runat="server" required="required"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox7" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
    </div>

    <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDataBound="OnRowDataBound" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
        <ItemTemplate>
            <div id="employee">
                <div id="basics">
                    <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                    <br>
                        <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                        <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>
                    <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName="Delete" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                </div>
                <div class="info" id="info" style="display: none;">
                    <br>
                    <asp:TextBox ID="EditName" runat="server" placeholder='<%# Eval("Name") %>'> </asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditAddress" runat="server" placeholder='<%# Eval("Address") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditManager" runat="server" placeholder='<%# Eval("ManagerID") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditTitle" runat="server" placeholder='<%# Eval("JobTitle") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditCrt" runat="server" placeholder='<%# Eval("CertifiedFor") %>'></asp:TextBox>
                    <br>

                    <asp:TextBox ID="EditStartDate" TextMode="Date" runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
                    <br>
                    <asp:TextBox ID="EditSalary" runat="server" placeholder='<%# Eval("Salary") %>'></asp:TextBox>
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