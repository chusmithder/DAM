
Partial Class Tarea14_CaducidadCookies
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Cookies("u").Value = TextBox1.Text
        Response.Cookies("c").Value = TextBox2.Text
        If CheckBox1.Checked = True Then
            Response.Cookies("u").Expires = Now.AddDays(1)
            Response.Cookies("c").Expires = Now.AddDays(1)
        End If
        Response.Redirect("Tarea14-Destino.aspx")
    End Sub
End Class
