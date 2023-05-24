
Partial Class Tarea12DestinoMétodo2
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label1.Visible = True
        Label1.Text = " Hola " + PreviousPage.TextoPublico.Text + ", en la página origen has seleccionado: " + PreviousPage.ListaPublica.SelectedValue.ToString()
    End Sub
End Class
