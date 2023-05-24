
Partial Class Tarea9_ObjetoResponse
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Button1.Text = "OK"
            ListBox1.Items.Add("https://www.youtube.com/watch?v=E4OEaWSE9r4")
            ListBox1.Items.Add("https://www.youtube.com/watch?v=XY7iAQV4m24")
            ListBox1.Items.Add("https://www.youtube.com/watch?v=-t-w68ChLL8")
            ListBox1.Items.Add("https://www.youtube.com/watch?v=be6sRMtWAqU")

            ListBox1.Items.Add("Tarea5.aspx")
            ListBox1.Items.Add("tarea6-ValidationExample.aspx")
            ListBox1.Items.Add("Tarea8-MasValidaciones1.aspx")
            ListBox1.Items.Add("Tarea8-MasValidaciones2.aspx")
        End If
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Response.Redirect(ListBox1.SelectedValue)
        Catch ex As Exception

        End Try

    End Sub
End Class
