<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea18-AdminEstadoEnServidor(II).aspx.vb" Inherits="Tarea18_AdminEstadoEnServidor_II_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Total a facturar: " Visible="False"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                Elija un producto y pulse enviar:<br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="100">Placa</asp:ListItem>
                    <asp:ListItem Value="150">Monitor</asp:ListItem>
                    <asp:ListItem Value="200">Grafica</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Enviar" />
            </asp:Panel>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Desconectar" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Enabled="False" Text="Mas productos" />
        </div>
    </form>
</body>
</html>
