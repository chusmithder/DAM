Public Class formulario
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub texto_TextChanged(sender As Object, e As EventArgs) Handles texto.TextChanged

    End Sub

    Private Sub botonguardar_Click(sender As Object, e As EventArgs) Handles botonguardar.Click
        Try
            Dim archivo As New System.IO.StreamWriter("./archivotexto.txt")
            archivo.Write(texto.Text)
            archivo.Close()
            texto.Text = ""
        Catch ex As Exception
            MsgBox("No se pudo guardar la informacion", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub botonabrir_Click(sender As Object, e As EventArgs) Handles botonabrir.Click
        Try
            Dim miruta As String = ("./archivotexto.txt")
            Dim archivo As New System.IO.StreamReader(miruta)
            texto.Text = archivo.ReadToEnd
            archivo.Close()
        Catch ex As Exception
            MsgBox("No se pudo guardar la informacion", MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
