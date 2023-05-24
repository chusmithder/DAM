
Partial Class tarea5
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            cbxHucha.Checked = False
            cbxMaceta.Checked = False
            cbxDestornilladores.Checked = False
            cbxPato.Checked = False
            listCarrito.Items.Clear()
        End If
    End Sub

    Protected Sub cbx_change(sender As Object, e As EventArgs) Handles cbxHucha.CheckedChanged, cbxMaceta.CheckedChanged, cbxDestornilladores.CheckedChanged, cbxPato.CheckedChanged
        Dim cbx As CheckBox = sender
        If cbx.Checked Then
            listCarrito.Items.Add(cbx.Text)
        Else
            listCarrito.Items.Remove(cbx.Text)
        End If
    End Sub

    Protected Sub btnEliminarSelecc_Click(sender As Object, e As EventArgs) Handles btnEliminarSelecc.Click
        Dim objetos(3) As CheckBox
        objetos(0) = cbxHucha
        objetos(1) = cbxMaceta
        objetos(2) = cbxDestornilladores
        objetos(3) = cbxPato

        For i = listCarrito.Items.Count - 1 To 0 Step -1
            If listCarrito.Items(i).Selected Then
                For z = objetos.Length - 1 To 0 Step -1
                    If listCarrito.Items(i).Text = objetos(z).Text Then
                        objetos(z).Checked = False
                    End If
                Next
                listCarrito.Items.RemoveAt(i)
            End If
        Next
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs) Handles btnLimpiar.Click
        cbxHucha.Checked = False
        cbxMaceta.Checked = False
        cbxDestornilladores.Checked = False
        cbxPato.Checked = False
        listCarrito.Items.Clear()

    End Sub

End Class
