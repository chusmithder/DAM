
Partial Class Tarea8_MasValidaciones5
    Inherits System.Web.UI.Page


    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If RadioButtonList1.SelectedItem.Text = "Otro" Then
            TextBox1.Enabled = True
            RequiredFieldValidator1.ValidationGroup = "allValidators"
        Else
            TextBox1.Enabled = False
            RequiredFieldValidator1.ValidationGroup = ""
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Page.Validate()
        If Page.IsValid Then
            Label1.Text = "Validacion completada"
        Else
            Label1.Text = "Fallo en validacion"
        End If
    End Sub
End Class
