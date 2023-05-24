
Partial Class tarea6_ValidationExample
    Inherits System.Web.UI.Page


    Protected Sub buttonSubmit_Click(sender As Object, e As EventArgs) Handles buttonSubmit.Click
        Page.Validate()
        If Page.IsValid Then
            labelMessage.Text = "Tu reserva ha sido procesada…"
        Else
            labelMessage.Text = "Página no válida"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        labelMessage.Text = ""
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        Try
            DateTime.ParseExact(args.Value, "m/d/yyyy",
         System.Globalization.DateTimeFormatInfo.InvariantInfo)
            args.IsValid = True
        Catch
            args.IsValid = False
        End Try
    End Sub

    Protected Sub checkPhoneConfirmation_CheckedChanged(sender As Object, e As EventArgs) Handles checkPhoneConfirmation.CheckedChanged
        If checkPhoneConfirmation.Checked = True Then
            textPhoneNumber.Enabled = True
            validatorRequiredPhoneNumber.ValidationGroup = "AllValidators"
            validatorRegExPhoneNumber.ValidationGroup = "AllValidators"
        Else
            validatorRequiredPhoneNumber.ValidationGroup = ""
            validatorRegExPhoneNumber.ValidationGroup = ""
        End If

    End Sub
End Class
