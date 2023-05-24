Public Class formulario
    Private Sub botonguardar_Click(sender As Object, e As EventArgs) Handles botonguardar.Click
        guardararchivo.Filter = "Archivos de texto (*.txt)| *.txt"
        guardararchivo.ShowDialog()
        If guardararchivo.FileName <> "" Then
            Try
                Dim guardar As IO.StreamWriter
                guardar = New IO.StreamWriter(guardararchivo.FileName)
                guardar.Write(texto.Text)
                guardar.Close()
                texto.Text = ""
            Catch ex As Exception
                MsgBox("No se pudo guardar el archivo")
            End Try
        Else
            MsgBox("Archivo no contiene información")
        End If
    End Sub

    Private Sub botonabrir_Click(sender As Object, e As EventArgs) Handles botonabrir.Click
        guardararchivo.Filter = "Archivos de texto (*.txt)| *.txt"
        guardararchivo.ShowDialog()
        If guardararchivo.FileName <> "" Then
            Try
                Dim guardar As IO.StreamWriter
                guardar = New IO.StreamWriter(guardararchivo.FileName)
                guardar.Write(texto.Text)
                guardar.Close()
                texto.Text = ""
            Catch ex As Exception
                MsgBox("No se pudo guardar el archivo")
            End Try
        Else
            MsgBox("Archivo no contiene información")
        End If
    End Sub
End Class
