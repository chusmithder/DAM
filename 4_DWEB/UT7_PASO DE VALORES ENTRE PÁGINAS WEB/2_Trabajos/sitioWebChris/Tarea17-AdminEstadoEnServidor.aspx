<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea17-AdminEstadoEnServidor.aspx.vb" Inherits="Tarea17_AdminEstadoEnServidor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                        <asp:ListBox ID="ListBox1" runat="server" Height="90px" Width="164px">
                            <asp:ListItem>Todas las marcas</asp:ListItem>
                            <asp:ListItem>Huawei</asp:ListItem>
                            <asp:ListItem>Apple</asp:ListItem>
                            <asp:ListItem>LG</asp:ListItem>
                        </asp:ListBox>
                        <br />
            <br />
                        <asp:ListBox ID="ListBox2" runat="server">
                            <asp:ListItem>60</asp:ListItem>
                            <asp:ListItem>80</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                        </asp:ListBox>
                        <br />
            <br />
                        <asp:Button ID="Button1" runat="server" Text="Ver" />
        </div>
    </form>
</body>
</html>
