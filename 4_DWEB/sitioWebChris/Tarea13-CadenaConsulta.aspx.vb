
Partial Class Tarea13_CadenaConsulta
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label1.Text = Request.QueryString("Marca") + " y " + Request.QueryString("Precio")
    End Sub
End Class
