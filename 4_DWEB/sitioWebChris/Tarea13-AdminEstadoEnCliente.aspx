<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea13-AdminEstadoEnCliente.aspx.vb" Inherits="Tarea13_AdminEstadoEnCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 199px;
        }
        .auto-style3 {
            width: 154px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:ListBox ID="ListBox1" runat="server" Height="90px" Width="164px">
                            <asp:ListItem>Todas las marcas</asp:ListItem>
                            <asp:ListItem>Huawei</asp:ListItem>
                            <asp:ListItem>Apple</asp:ListItem>
                            <asp:ListItem>LG</asp:ListItem>
                        </asp:ListBox>
                        <br />
                    </td>
                    <td class="auto-style3">
                        <br />
                        Presupuesto:<br />
                        <asp:ListBox ID="ListBox2" runat="server">
                            <asp:ListItem>60</asp:ListItem>
                            <asp:ListItem>80</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                        </asp:ListBox>
                        <br />
                        <br />
                        <br />
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Cadena de consulta" />
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Cookies version 1" />
                        <br />
                        <asp:Button ID="Button3" runat="server" Text="Cookies version 2" />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
