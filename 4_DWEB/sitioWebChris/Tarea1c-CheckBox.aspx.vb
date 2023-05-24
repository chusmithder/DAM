
Partial Class Tarea1b_RadioButton
    Inherits System.Web.UI.Page


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If CheckBox1.Checked Then
            Label2.Text = CInt(TextBox3.Text) + CInt(TextBox4.Text)
        End If
        If CheckBox2.Checked Then
            Label3.Text = CInt(TextBox3.Text) - CInt(TextBox4.Text)
        End If
    End Sub
End Class
