
Partial Class Tarea2_ControlImage
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim url As String = Image1.ImageUrl
        If url = "~/images/kick.jpg" Then
            Image1.ImageUrl = "~/images/regular.jpeg"
            Image1.BorderColor = Drawing.Color.BlueViolet
            Image1.BorderWidth = 40
        Else
            Image1.ImageUrl = "~/images/kick.jpg"
            Image1.BorderColor = Drawing.Color.Red
            Image1.BorderWidth = 20
        End If
    End Sub
End Class
