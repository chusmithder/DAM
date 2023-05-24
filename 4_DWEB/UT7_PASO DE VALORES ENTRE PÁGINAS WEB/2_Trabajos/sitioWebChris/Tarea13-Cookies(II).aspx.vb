
Partial Class Tarea13_Cookies_I_
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Request.Cookies("info") Is Nothing Then
            Dim marca As String = Server.HtmlEncode(Request.Cookies("info")("marca2")).ToString()
            Dim precio As String = Server.HtmlEncode(Request.Cookies("info")("precio2")).ToString()
            Label1.Text = marca + " y " + precio
        End If
    End Sub
End Class
