<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Detalles.aspx.vb" Inherits="Detalles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" Height="160px" Width="169px" />
            <br />
            <br />
            Precio:
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Height="79px" ReadOnly="True" Width="269px"></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>
