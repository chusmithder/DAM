Imports System.IO
Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim resul As String = ""

        'ruta completa
        'extension del archivo
        'ultima fecha
        Dim fecha As String = File.GetLastAccessTime(texto.Text).ToString
        resul = resul & "Fecha de ultima modificacion: " & fecha & vbCrLf

        'longitud en bytes



        MsgBox(resul)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim resul As String = ""
        Try
            Dim archivo As FileInfo = New FileInfo(texto.Text)

            'ruta completa
            Dim ruta As String = archivo.FullName
            resul = resul & "Ruta completa: " & ruta & vbCrLf
            'extension del archivo
            Dim ext As String = archivo.Extension
            resul = resul & "Extension del archivo: " & ext & vbCrLf
            'ultima fecha
            Dim fecha As String = archivo.LastWriteTime.ToString
            resul = resul & "Fecha ultima modificacion: " & fecha & vbCrLf
            'longitud en bytes
            Dim size As Long = archivo.Length
            resul = resul & "Tamaño: " & size & "bytes" & vbCrLf

            MsgBox(resul)
        Catch ex As Exception
            MsgBox("Proceso falló")
        End Try

    End Sub
End Class
