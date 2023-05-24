
Partial Class tarea4_AutoPostBack1
    Inherits System.Web.UI.Page


    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        TextBox1.Text = DropDownList1.SelectedValue
    End Sub
End Class
