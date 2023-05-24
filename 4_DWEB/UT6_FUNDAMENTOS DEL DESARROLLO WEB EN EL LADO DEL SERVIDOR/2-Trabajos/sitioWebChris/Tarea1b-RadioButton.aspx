<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea1b-RadioButton.aspx.vb" Inherits="Tarea1b_RadioButton" %>

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
            <br />
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="s" Text="Sumar" />
            <br />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="s" Text="Restar" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Button" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
