<%@ Page Title="Customer Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerServices.aspx.cs" Inherits="WebFormsApp.CustomerServices" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button7" formnovalidate="formnovalidate" runat="server" Text="Logout" OnClick="Logout" />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="127px">
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="TextBox3" placeholder="Expected Time (Minutes)" runat="server" required="required"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Add_Customer" />
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Customer: "></asp:Label>
    <asp:Label ID="Label2" runat="server" Text='Label'> </asp:Label>
    <br />
    <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDataBound="OnRowDataBound" OnItemDeleting="ListView1_ItemDeleting" >
        <ItemTemplate>
            <div id="custServ">
                <div id="basics">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ServiceTypeID") %>'> </asp:Label>
                    <br>
                    <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                        <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>
                    <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName='<%#Eval("CustomerID") + "," +  Eval("ServiceTypeID") %>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                    </div>
                    <div class="info" id="info" style="display: none;">

                    <br>

                    <asp:Label runat="server" Text='<%# Eval("ExpectedDuration") + " Minutes" %>'></asp:Label>


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