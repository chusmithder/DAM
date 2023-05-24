
Partial Class Tarea12DestinoMétodo2
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cpTextBox1 As TextBox
        Dim cpListBox1 As ListBox

        cpTextBox1 = PreviousPage.FindControl("TextBox1")
        cpListBox1 = PreviousPage.FindControl("ListBox1")

        If Not cpListBox1.SelectedItem Is Nothing And cpTextBox1.Text <> "" Then
            Label1.Text = "Hola " & cpTextBox1.Text & " en la pagina de origen has seleccionado " & cpListBox1.SelectedItem.ToString()
        End If
    End Sub
End Class
