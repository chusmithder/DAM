
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

    'Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
    '    TextBox1.Text = DropDownList1.SelectedValue
    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If ListBox2.SelectedIndex > -1 Then
            TextBox1.Text = ListBox2.SelectedValue
        Else
            TextBox1.Text = "No has seleccionado nada"
        End If

    End Sub
End Class
