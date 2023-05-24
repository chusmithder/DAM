
Partial Class Detalles
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim prod As String = Request.QueryString("Producto").ToLower()

            'Image1.ImageUrl = "~/images/" + prod + ".jpg"
            Select Case prod
                Case "hucha"
                    Label1.Text = "12€"
                    TextBox1.Text = "Para ahorrar"
                    Image1.ImageUrl = "~/images/hucha.jpg"
                Case "maceta"
                    Label1.Text = "10€"
                    TextBox1.Text = "Para plantar"
                    Image1.ImageUrl = "~/images/macetas.jpg"
                Case "destornillador"
                    Label1.Text = "5€"
                    TextBox1.Text = "Para destornillar"
                    Image1.ImageUrl = "~/images/destornilladores.png"
                Case "pato"
                    Label1.Text = "80€"
                    TextBox1.Text = "Para cuidar"
                    Image1.ImageUrl = "~/images/pato.jpeg"
            End Select
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub
End Class
