
Partial Class Tarea18_AdminEstadoEnServidor_II_
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("total") += CInt(DropDownList1.SelectedItem.Value)

        Label1.Visible = True
        Label1.Text = Session("total")

        Panel1.Visible = False
        Button3.Enabled = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session.Abandon()
        Panel1.Visible = False
        Button2.Enabled = False
        Button3.Enabled = False
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Panel1.Visible = True
        Button3.Enabled = False
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
