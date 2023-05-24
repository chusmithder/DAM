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
        Catch ex As Exception
            MsgBox("se detecta un error genérico " & ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
