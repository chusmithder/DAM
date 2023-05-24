<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea8-MasValidaciones2.aspx.vb" Inherits="Tarea8_MasValidaciones1" %>

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
                    <td class="auto-style2">Fecha de entrada (aaaa-mm-dd)</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="255px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debes introducir una fecha" ForeColor="Red" ValidationGroup="AllValidators">campo requerido</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="El formato no es correcto" ValidationExpression="[0-9]{4}-[0-9]{2}-[0-9]{2}" ValidationGroup="AllValidators">Formato no valido</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Fecha de salida (aaaa-mm-dd)</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Width="246px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debes introducir una fecha" ForeColor="Red" ValidationGroup="AllValidators">campo requerido</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="El formato no es correcto" ValidationExpression="[0-9]{4}-[0-9]{2}-[0-9]{2}" ValidationGroup="AllValidators">Formato no valido</asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Fecha no valida" Operator="GreaterThanEqual" ValidationGroup="AllValidators">Dame otra fecha</asp:CompareValidator>
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
