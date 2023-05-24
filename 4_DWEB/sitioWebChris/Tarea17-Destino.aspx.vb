
Partial Class Tarea17_Destino
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Label1.Text = "Has elegido la marca " + Session("marca").ToString() + " con precio " + Session("precio").ToString()
        Label1.Text = "marca elegida: " + Session("marca") + " con precio " + Session("precio")
    End Sub
End Class
