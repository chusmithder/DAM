<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tarea10-ObjetoRequest.aspx.vb" Inherits="Tarea10_ObjetoRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nombre del navergador ---&gt;<asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            Soporte de cookies ---&gt;<asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            Numero de version del navegdor ---&gt;<asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
