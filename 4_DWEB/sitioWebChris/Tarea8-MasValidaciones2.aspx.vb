
Partial Class Tarea8_MasValidaciones1
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Page.Validate()
        If Page.IsValid Then
            Label1.Text = "Su informacion se procesara"
            TextBox1.BackColor = Drawing.Color.Green
            TextBox2.BackColor = Drawing.Color.Green
            Button1.BackColor = Drawing.Color.Green
        Else
            Label1.Text = "Pagina no válida"
        End If
    End Sub
End Class
