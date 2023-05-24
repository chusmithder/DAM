
Partial Class Tarea10_ObjetoRequest
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim bc As HttpBrowserCapabilities = Request.Browser

        Label1.Text = bc.Browser
        Label2.Text = bc.Cookies.ToString()
        Label3.Text = bc.Version

    End Sub
End Class
