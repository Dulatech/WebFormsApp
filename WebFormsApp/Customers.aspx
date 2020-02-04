<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebFormsApp.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #customer {
            border: solid 1pt black;
            width: 200px;
        }

        #customer:hover {
            background-color: gainsboro;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">


        <asp:Button ID="Button1" formnovalidate="formnovalidate" runat="server" Text="Home Page" OnClick="Home_Click" />
        <asp:Button ID="Button3" formnovalidate="formnovalidate" runat="server" Text="Customers" OnClick="Button1_Click" BackColor="#CCCCCC" />
        <asp:Button ID="Button4" formnovalidate="formnovalidate" runat="server" Text="Employees" OnClick="Button2_Click" />
        <asp:Button ID="Button5" formnovalidate="formnovalidate" runat="server" Text="Services" OnClick="Button3_Click" />
        <asp:Button ID="Button6" formnovalidate="formnovalidate" runat="server" Text="CustomerServices" OnClick="Button4_Click" />
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
                        <asp:Image ID="pictureControlID" runat="server" Width="80" Height="80" AlternateText='<% #Eval("Name") %>' />
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


