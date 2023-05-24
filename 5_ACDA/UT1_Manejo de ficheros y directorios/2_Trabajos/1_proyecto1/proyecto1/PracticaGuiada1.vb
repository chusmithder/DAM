Imports System.IO
Public Class formulario
    Private Sub botonguardar_Click(sender As Object, e As EventArgs) Handles botonguardar.Click
        Try
            Dim escribir As StreamWriter
            escribir = File.CreateText("datosentexto.txt")
            escribir.Write(Texto.Text)
            escribir.Close()
            Texto.Text = ""
            MsgBox("Texto Guardado", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Error al guardar el archivo", MsgBoxStyle.Critical)
        End Try

    End Sub

    Private Sub botonabrir_Click(sender As Object, e As EventArgs) Handles botonabrir.Click
        Try
            Dim leer As StreamReader
            leer = File.OpenText("datosentexto.txt")
            Texto.Text = leer.ReadToEnd
            leer.Close()
        Catch ex As Exception
            MsgBox("Error al leer el archivo", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub botonadicionar_Click(sender As Object, e As EventArgs) Handles botonadicionar.Click
        Try
            Texto.Text = " "
            Dim adicionartexto As StreamWriter
            adicionartexto = File.AppendText("datosentexto.txt")
            adicionartexto.WriteLine(textoadicional.Text)
            adicionartexto.Close()
            textoadicional.Text = ""
        Catch ex As Exception
            MsgBox("Error al adicionar inf. al archivo", MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
