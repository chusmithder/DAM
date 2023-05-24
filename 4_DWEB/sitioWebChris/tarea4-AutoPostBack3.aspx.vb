
Partial Class tarea4_AutoPostBack1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ListBox2.Items.Add("UNO")
            ListBox2.Items.Add("DOS")
            ListBox2.Items.Add("TRES")
            ListBox2.Items.Add("CUATRO")
        End If
    End Sub

    Protected Sub ListBox2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListBox2.SelectedIndexChanged
        TextBox1.Text = ListBox2.SelectedValue
    End Sub
End Class
