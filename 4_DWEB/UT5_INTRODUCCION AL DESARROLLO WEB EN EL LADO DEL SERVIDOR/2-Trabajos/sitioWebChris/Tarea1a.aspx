<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea1a.aspx.vb" Inherits="Tarea1a" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Ingrese primer valor:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <p>
            Ingrese segundo valor:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Sumar" />
        </p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
