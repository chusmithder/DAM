Imports System.IO
Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ruta As String = InputBox("Introduzca la ruta")
        Dim resul As String = ""
        Try
            'ruta completa sin ultimo
            Dim r As String = Path.GetDirectoryName(ruta)
            resul = resul & "Ruta sin el: " & r & vbCrLf
            'el nombre completo del fichero incluyendo su extensión
            Dim nombre As String = Path.GetFileName(ruta)
            resul = resul & "Nombre con extension: " & nombre & vbCrLf
            'extension
            Dim ext As String = Path.GetExtension(ruta)
            resul = resul & "Extension: " & ext & vbCrLf
            'únicamente el nombre del archivo sin la extensión del mismo
            Dim nombreConExt As String = Path.GetFileNameWithoutExtension(ruta)
            resul = resul & "Nombre del archivo sin extension:  " & nombreConExt & vbCrLf
            'unidad
            Dim unidad As String = Path.GetPathRoot(ruta)
            resul = resul & "Unidad: " & unidad & vbCrLf

            MsgBox(resul)
        Catch ex As Exception
            MsgBox("Error en el proceso")
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()
    End Sub
End Class
