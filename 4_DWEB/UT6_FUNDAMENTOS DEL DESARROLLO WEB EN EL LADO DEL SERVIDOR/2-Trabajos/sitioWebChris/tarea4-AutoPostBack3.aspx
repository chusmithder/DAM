<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tarea4-AutoPostBack3.aspx.vb" Inherits="tarea4_AutoPostBack1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True"></asp:ListBox>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
