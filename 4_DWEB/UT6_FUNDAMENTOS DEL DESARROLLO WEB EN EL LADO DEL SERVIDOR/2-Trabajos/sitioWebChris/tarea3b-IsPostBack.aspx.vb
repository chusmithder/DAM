
Partial Class tarea3a_IsPostBack
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ListBox1.Items.Add("Hola")
            ListBox1.Items.Add("Eres feo")
            ListBox1.Items.Add("Chau")
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub
End Class
