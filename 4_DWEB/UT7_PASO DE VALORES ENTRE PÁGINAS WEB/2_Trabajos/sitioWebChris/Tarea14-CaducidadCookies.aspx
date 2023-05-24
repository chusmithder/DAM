<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea14-CaducidadCookies.aspx.vb" Inherits="Tarea14_CaducidadCookies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            usuario:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            contraseña:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Privado" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Enviar" />
        </div>
    </form>
</body>
</html>
