<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea1d-ListBox.aspx.vb" Inherits="Tarea1b_RadioButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Valor 1:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Valor 2:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:ListBox ID="ListBox1" runat="server">
                <asp:ListItem>sumar</asp:ListItem>
                <asp:ListItem>restar</asp:ListItem>
                <asp:ListItem>multiplicar</asp:ListItem>
                <asp:ListItem>dividir</asp:ListItem>
            </asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Calcular" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
