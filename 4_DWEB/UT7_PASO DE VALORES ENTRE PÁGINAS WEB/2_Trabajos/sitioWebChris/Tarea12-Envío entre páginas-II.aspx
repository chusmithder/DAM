<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea12-Envío entre páginas-II.aspx.vb" Inherits="Tarea12_Envío_entre_páginas_II" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Dim etu nombre:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Selecciona un libro:<br />
            <asp:ListBox ID="ListBox1" runat="server" Width="120px">
                <asp:ListItem>Libro1</asp:ListItem>
                <asp:ListItem>Libro2</asp:ListItem>
                <asp:ListItem>Libro3</asp:ListItem>
                <asp:ListItem>Libro4</asp:ListItem>
                <asp:ListItem>Libro5</asp:ListItem>
            </asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Enviar y mostrar en esta pagina" Width="332px" />
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Tarea12DestinoMétodo2.aspx" Text="Mostrar en destino (metodo 2)" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Mostrar en destino (metodo 3)" PostBackUrl="~/Tarea12DestinoMétodo3.aspx" />
        </div>
    </form>
</body>
</html>
