
Partial Class Tarea8_MasValidaciones1
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Page.Validate()
        If Page.IsValid Then
            Label1.Text = "Validacion superada"

        Else
            Label1.Text = "Pagina no valida"
        End If
    End Sub
End Class
