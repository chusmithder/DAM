
Partial Class Tarea1b_RadioButton
    Inherits System.Web.UI.Page


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'Label2.Text = CInt(TextBox3.Text) + CInt(TextBox4.Text)
        Select Case ListBox1.SelectedValue
            Case "sumar"
                Label2.Text = CInt(TextBox3.Text) + CInt(TextBox4.Text)
            Case "restar"
                Label2.Text = CInt(TextBox3.Text) - CInt(TextBox4.Text)
            Case "multiplicar"
                Label2.Text = CInt(TextBox3.Text) * CInt(TextBox4.Text)
            Case "dividir"
                Label2.Text = CInt(TextBox3.Text) / CInt(TextBox4.Text)
        End Select

    End Sub
End Class
