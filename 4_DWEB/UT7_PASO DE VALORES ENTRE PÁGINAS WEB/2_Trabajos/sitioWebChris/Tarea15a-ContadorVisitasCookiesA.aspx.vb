
Partial Class Tarea15a_ContadorVisitasCookiesA
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Not Page.IsPostBack Then
        '    Response.Cookies("sesiones").Value = "1"
        '    Label1.Text = "Has visitado la pagina por primera vez"
        'Else
        '    Dim s As Integer = CInt(Request.Cookies("sesiones").Value)
        '    Response.Cookies("sesiones").Value = (s + 1).ToString()

        '    Dim x As String = Request.Cookies("sesiones").Value

        '    Label1.Text = "Has visitado esta pagina " + x + " veces"
        'End If
        If Not Request.Cookies("sesiones") Is Nothing Then
            Response.Cookies("sesiones").Value = Request.Cookies("sesiones").Value + 1
            Label1.Text = "Has visitado la pagina " + Response.Cookies("sesiones").Value + " veces"
        Else
            Response.Cookies("sesiones").Value = 1
            Label1.Text = "Has visitado la pagina por primera vez"
        End If
    End Sub
End Class
