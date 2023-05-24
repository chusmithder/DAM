<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea11-Envío-entre-paginas.aspx.vb" Inherits="tarea5" %>

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
            width: 212px;
        }
        .auto-style3 {
            width: 227px;
        }
        .auto-style4 {
            width: 234px;
        }
        .auto-style5 {
            width: 212px;
            height: 26px;
        }
        .auto-style6 {
            width: 227px;
            height: 26px;
        }
        .auto-style7 {
            width: 234px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
            <asp:Image ID="Image1" runat="server" Height="151px" Width="183px" ImageUrl="~/images/hucha.jpg" />
                    </td>
                    <td class="auto-style3">
            <asp:Image ID="Image2" runat="server" Height="155px" ImageUrl="~/images/macetas.jpg" style="margin-top: 5px" Width="184px" />
                    </td>
                    <td class="auto-style4">
            <asp:Image ID="Image3" runat="server" Height="155px" ImageUrl="~/images/destornilladores.png" style="margin-top: 5px" Width="184px" />
                    </td>
                    <td>
            <asp:Image ID="Image4" runat="server" Height="155px" ImageUrl="~/images/pato.jpeg" style="margin-top: 5px" Width="184px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:CheckBox ID="cbxHucha" runat="server" Text="Hucha" AutoPostBack="True" />
                    </td>
                    <td class="auto-style6">
            <asp:CheckBox ID="cbxMaceta" runat="server" Text="Maceta" AutoPostBack="True" />
                    </td>
                    <td class="auto-style7">
            <asp:CheckBox ID="cbxDestornilladores" runat="server" Text="Destornillador" AutoPostBack="True" />
                    </td>
                    <td class="auto-style8">
            <asp:CheckBox ID="cbxPato" runat="server" Text="Pato" AutoPostBack="True" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Detalles.aspx?Producto=Hucha">Mas Detalles</asp:HyperLink>
                    </td>
                    <td class="auto-style6">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Detalles.aspx?Producto=Maceta">Mas Detalles</asp:HyperLink>
                    </td>
                    <td class="auto-style7">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Detalles.aspx?Producto=Destornillador">Mas Detalles</asp:HyperLink>
                    </td>
                    <td class="auto-style8">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="Detalles.aspx?Producto=Pato">Mas Detalles</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CARRITO DE COMPRA<br />
                        <br />
            <asp:ListBox ID="listCarrito" runat="server" AutoPostBack="True" Height="130px" Width="212px" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                    <td class="auto-style3">
            <asp:Button ID="btnEliminarSelecc" runat="server" Text="Eliminar seleccionados" />
                        <br />
                        <br />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
