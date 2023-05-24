
Partial Class Tarea12_Envío_entre_páginas_II
    Inherits System.Web.UI.Page

    'Estas propiedades encapsulan los controles    
    'para que puedan ser accedidos desde otras páginas.
    Public ReadOnly Property ListaPublica() As ListBox
        Get
            Return ListBox1
        End Get
    End Property
    Public ReadOnly Property TextoPublico() As TextBox
        Get
            Return Me.TextBox1
        End Get
    End Property


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            If Not ListBox1.SelectedItem Is Nothing And TextBox1.Text <> "" Then
                Label1.Visible = True
                Label1.Text = "Hola " & TextBox1.Text & " has pedido " & ListBox1.SelectedValue
            End If
        Catch ex As Exception
        End Try

    End Sub
End Class
