Imports System.IO
Public Class Form1
    Private Sub Texto_TextChanged(sender As Object, e As EventArgs) Handles Texto.TextChanged

    End Sub

    Private Sub btnLeer_Click(sender As Object, e As EventArgs) Handles btnLeer.Click
        Try
            Dim leer As StreamReader
            leer = File.OpenText(Texto.Text)
            Dim str As String = leer.ReadToEnd()
            MessageBox.Show(str)
            Texto.Text = ""
            leer.Close()
        Catch ex As FileNotFoundException
            MsgBox("No se encuentra el archivo de la ruta ", MsgBoxStyle.Critical)
        Catch ex As DirectoryNotFoundException
            MsgBox("No se encuentra parte del archivo ", MsgBoxStyle.Critical)
        Catch ex As ArgumentException
            MsgBox("Argumento invalido", MsgBoxStyle.Critical)
        End Try

    End Sub
End Class
