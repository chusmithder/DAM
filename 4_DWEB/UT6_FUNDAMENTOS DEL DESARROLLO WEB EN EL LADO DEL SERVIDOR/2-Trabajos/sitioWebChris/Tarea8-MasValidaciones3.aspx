<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea8-MasValidaciones3.aspx.vb" Inherits="Tarea8_MasValidaciones1" %>

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
            width: 304px;
        }
        .auto-style3 {
            width: 266px;
        }
        .auto-style4 {
            width: 304px;
            height: 69px;
        }
        .auto-style5 {
            width: 266px;
            height: 69px;
        }
        .auto-style6 {
            height: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">DNI:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="255px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debes introducir el dni" ValidationGroup="AllValidators">Se requiere DNI</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="El formato no es correcto" ValidationExpression="\d{8}[A-Z]" ValidationGroup="AllValidators" ForeColor="Red">Formato no valido</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Ciudad:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Width="246px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debes introducir eñ nombre de la ciudad" ValidationGroup="AllValidators">Se requiere dato ciudad</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                    </td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
