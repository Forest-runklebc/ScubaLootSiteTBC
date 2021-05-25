<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication5.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Scuba Cops loot and roster management login</h1>
        </div>
        <asp:Label ID="labelLogin" runat="server" Text="Please Login:"></asp:Label><br />
        <asp:Label ID="labelUsername" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox><br />
        <asp:Label ID="labelPassword" runat="server">Password&nbsp;</asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="labelError" runat="server" Text="Failed to login try again" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
    </form>
</body>
</html>
