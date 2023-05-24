
Partial Class Tarea14_Destino
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label1.Text = Request.Cookies("u").Value + " - " + Request.Cookies("c").Value
    End Sub
End Class
