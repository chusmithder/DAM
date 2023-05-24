
Partial Class Tarea1a
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Label1.Text = CInt(TextBox1.Text) + CInt(TextBox2.Text)
    End Sub
End Class
