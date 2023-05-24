Imports System.IO

Public Class Form1
    Dim carpeta As String = "ejemplo"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Directory.Exists(carpeta) Then
            MsgBox("La carpeta existe")
        Else
            MsgBox("La carpeta no existe")
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim dir As DirectoryInfo = New DirectoryInfo(carpeta)
        If dir.Exists Then
            MsgBox("La carpeta existe")
        Else
            MsgBox("La carpeta no existe")
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim subDir As String() = Directory.GetDirectories(carpeta)
        MsgBox("la carpeta contiene " & subDir.Length & " subdirectorios")
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim dir As New DirectoryInfo(carpeta)
        Dim numSub As Integer = dir.GetDirectories(carpeta).Length
        MsgBox("la carpeta contiene " & numSub & " subdirectorios")
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim numeroArchivos As Integer = Directory.GetFiles(carpeta, "*.txt", SearchOption.AllDirectories).Length
        MsgBox("Numero de archivos con extension .txt en la carpeta y sus hijas es : " & numeroArchivos)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim dir As New DirectoryInfo(carpeta)
        Dim num As Integer = dir.GetFiles("*.txt", SearchOption.AllDirectories).Length
        MsgBox("Numero de archivos con extension .txt en la carpeta y sus hijas es : " & num)
    End Sub
End Class
