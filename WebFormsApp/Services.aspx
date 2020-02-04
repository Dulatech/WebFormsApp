<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebFormsApp.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #info {
            display:none;
        }

        #service {
            border: solid 1pt black;
            width: 200px;
        }

            #service:hover {
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
        <asp:Button ID="Button5" formnovalidate="formnovalidate" runat="server" Text="Services" OnClick="Button3_Click" BackColor="#CCCCCC" />
        <asp:Button ID="Button6" formnovalidate="formnovalidate" runat="server" Text="CustomerServices" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="User:"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
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

        <asp:ListView ItemPlaceholderID="Test" runat="server" ID="ListView1">

            <ItemTemplate>


                <div id="service">
                    <div id="basics">

                        <asp:Label ID="Lab" runat="server" Text='<%# Eval("Name") %>'> </asp:Label>
                        <br>
                        <%-- <asp:Button class="butt" ID="ButtonDet" runat="server" Text="Details" />--%>
                         <button  type="button" id="ButtonDet" onclick="details(this)">Details</button>

                        <asp:Button ID="ButtonDel" formnovalidate="formnovalidate" CommandName='<%#Eval("ID") + "," +  Eval("Name")%>' runat="server" Text="Delete" BackColor="Red" ForeColor="Black" />
                    </div>
                    <div class="info" id="info">
                        <br>
                        <asp:TextBox ID="TextBox4" runat="server" placeholder='<%# Eval("Name") %>'> </asp:TextBox>
                        <br>
                        <asp:TextBox runat="server" placeholder='<%# Eval("CertificationRqts") %>'></asp:TextBox>
                        <br>
                        <asp:TextBox runat="server" placeholder='<%# Eval("Rate") %>'></asp:TextBox>
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
