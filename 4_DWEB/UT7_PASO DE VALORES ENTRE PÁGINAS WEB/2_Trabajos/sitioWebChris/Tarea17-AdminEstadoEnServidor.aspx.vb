
Partial Class Tarea17_AdminEstadoEnServidor
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'Session("marca") = ListBox1.SelectedValue.ToString()
        'Session("precio") = ListBox2.SelectedValue.ToString()
        'Response.Redirect("Tarea17-Destino.aspx")

        Session("marca") = ListBox1.SelectedValue.ToString()
        Session("precio") = ListBox2.SelectedValue.ToString()

        Response.Redirect("Tarea17-Destino.aspx")
    End Sub
End Class
