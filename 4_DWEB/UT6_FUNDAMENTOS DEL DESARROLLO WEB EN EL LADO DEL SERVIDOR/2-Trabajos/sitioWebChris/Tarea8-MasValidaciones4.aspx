<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea8-MasValidaciones4.aspx.vb" Inherits="Tarea8_MasValidaciones1" %>

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

    <script type="text/javascript" language="javascript"> 
        function validatePar(oSrc, args) {
            if (parseInt(args.Value) % 2 != 0) {
                alert("Numero no par");
                args.IsValid = false;
                return false;
            }
            return true;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Introduce un numero</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="255px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Debes introducir un numero" ForeColor="Red" ValidationGroup="AllValidators">campo requerido</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePar" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Valor debe ser par" ForeColor="Red" ValidationGroup="AllValidators">No es par</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
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
