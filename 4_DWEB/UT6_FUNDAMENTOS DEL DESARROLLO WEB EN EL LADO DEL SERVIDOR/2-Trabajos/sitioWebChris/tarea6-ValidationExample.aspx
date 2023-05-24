<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tarea6-ValidationExample.aspx.vb" Inherits="tarea6_ValidationExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script language="javascript">
        function validateDate(oSrc, args)
        {
          var iDay, iMonth, iYear;
          var arrValues;
          arrValues = args.Value.split("/");
          iMonth = arrValues[0];
          iDay = arrValues[1];
          iYear = arrValues[2];

          var testDate = new Date(iYear, iMonth - 1, iDay);
          if ((testDate.getDate() != iDay) ||
              (testDate.getMonth() != iMonth - 1) ||
              (testDate.getFullYear() != iYear))
          {
             args.IsValid = false;
             return;
          }
      
          return true;
}</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Submit a reservation<br />
            <br />
            Emal:
            <asp:TextBox ID="textEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textEmail" Display="Dynamic" ErrorMessage="Se requiere la dirección de correo electrónico." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" Display="Dynamic" ErrorMessage="Las direcciones de correo electrónico deben estar en el formato nombre@dominio.xyz." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidators">Formato no válido</asp:RegularExpressionValidator>
            <br />
            <br />
            Number in Party:
            <asp:TextBox ID="textNumberInParty" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textNumberInParty" Display="Dynamic" ErrorMessage="Indique cuántas personas habrá en la fiesta." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="textNumberInParty" Display="Dynamic" ErrorMessage="Escriba un número entre 1 y 20" MaximumValue="20" MinimumValue="1" Type="Integer" ValidationGroup="AllValidators">“Escriba un número entre 1 y 20.”</asp:RangeValidator>
            <br />
            <br />
            Preferred date:
            <asp:TextBox ID="textPreferredDate" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="textPreferredDate" Display="Dynamic" ErrorMessage="Escriba una fecha en el formato m/d/aaaa." ValidationGroup="AllValidators" ClientValidationFunction="validateDate">Formato de fecha no válido (se requiere m/d/aaaa).</asp:CustomValidator>
            <br />
            <br />
            <asp:CheckBox ID="checkPhoneConfirmation" runat="server" AutoPostBack="True" Text="Confirme la reserva por teléfono" />
            <br />
            Número de teléfono:&nbsp;
            <asp:TextBox ID="textPhoneNumber" runat="server" Enabled="False"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validatorRequiredPhoneNumber" runat="server" ControlToValidate="textPhoneNumber" Display="Dynamic" ErrorMessage="Debe proporcionar un número de teléfono">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validatorRegExPhoneNumber" runat="server" ControlToValidate="textPhoneNumber" Display="Dynamic" ErrorMessage="El formato del número de teléfono no es válido" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Formato no válido</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="buttonSubmit" runat="server" Text="Enviar solicitud" ValidationGroup="AllValidators" />
            <br />
            <br />
            <asp:Label ID="labelMessage" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="AllValidators" />
    </form>
</body>
</html>
