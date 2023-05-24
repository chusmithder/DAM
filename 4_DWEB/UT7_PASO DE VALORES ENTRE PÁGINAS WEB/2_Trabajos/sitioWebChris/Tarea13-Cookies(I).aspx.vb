
Partial Class Tarea13_Cookies_I_
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Request.Cookies("marca") Is Nothing And Not Request.Cookies("precio") Is Nothing Then
            Dim marca As String = Request.Cookies("marca").Value
            Dim precio As String = Request.Cookies("precio").Value
            Label1.Text = marca + " y " + precio
        End If

    End Sub
End Class
