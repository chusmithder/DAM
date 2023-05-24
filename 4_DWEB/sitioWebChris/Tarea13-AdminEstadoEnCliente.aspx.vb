
Partial Class Tarea13_AdminEstadoEnCliente
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Tarea13-CadenaConsulta.aspx?Marca=" & ListBox1.SelectedValue & "&Precio=" & ListBox2.SelectedValue)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Cookies("marca").Value = ListBox1.SelectedValue.ToString
        Response.Cookies("precio").Value = ListBox2.SelectedValue.ToString
        Response.Redirect("Tarea13-Cookies(I).aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Cookies("info")("marca2") = ListBox1.SelectedValue.ToString()
        Response.Cookies("info")("precio2") = ListBox2.SelectedValue.ToString()
        Response.Redirect("Tarea13-Cookies(II).aspx")
    End Sub
End Class
