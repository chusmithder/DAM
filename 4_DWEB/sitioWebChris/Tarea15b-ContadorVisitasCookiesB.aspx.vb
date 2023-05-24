
Partial Class Tarea15b_ContadorVisitasCookiesB
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Request.Cookies("sesiones2") Is Nothing Then
            Response.Cookies("sesiones2").Value = Request.Cookies("sesiones2").Value + 1
            'Response.Cookies("sesiones2").Expires = Now.AddYears(1)
            Label1.Text = "Has visitado la pagina " + Response.Cookies("sesiones2").Value + " veces"
        Else
            Response.Cookies("sesiones2").Value = 1
            Response.Cookies("sesiones2").Expires = Now.AddYears(1)
            Label1.Text = "Has visitado la pagina por primera vez"
        End If
    End Sub
End Class
