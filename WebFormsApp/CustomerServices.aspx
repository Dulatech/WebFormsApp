<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerServices.aspx.cs" Inherits="WebFormsApp.CustomerServices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #info {
            display:none;
        }

        #custServ {
            border: solid 1pt black;
            width: 200px;
        }

            #custServ:hover {
                background-color: gainsboro;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Button ID="Button1" formnovalidate="formnovalidate" runat="server" Text="Home Page" OnClick="Home_Click" />
         <asp:Button ID="Button3" formnovalidate="formnovalidate" runat="server" Text="Customers" OnClick="Button1_Click" />
        <asp:Button ID="Button4" formnovalidate="formnovalidate" runat="server" Text="Employees" OnClick="Button2_Click" />
        <asp:Button ID="Button5" formnovalidate="formnovalidate" runat="server" Text="Services" OnClick="Button3_Click" />
        <asp:Button ID="Button6" formnovalidate="formnovalidate" runat="server" Text="CustomerServices" BackColor="#CCCCCC" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
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
        <br />
         <asp:Label ID="Label4" runat="server" Text="Customer: "></asp:Label>
        <asp:Label ID="Label2" runat="server" Text='Label'> </asp:Label>
        <br />
        <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1" OnItemDeleting="ListView1_ItemDeleting" >

            <ItemTemplate>


                <div id="custServ">
                    <div id="basics">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ServiceTypeID") %>'> </asp:Label>
                        <br>
                        <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                         <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>
                        <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName='<%#Eval("CustomerID") + "," +  Eval("ServiceTypeID") %>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                    </div>
                    <div class="info" id="info">
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
    </form>
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
</body>
</html>
