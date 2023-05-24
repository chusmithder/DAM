<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea1c-CheckBox.aspx.vb" Inherits="Tarea1b_RadioButton" %>

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
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Sumar" />
            <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="Restar" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Button" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
