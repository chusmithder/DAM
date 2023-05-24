Imports System.IO
Public Class formulario
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load


    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'Try
        'Dim lector As StreamReader = New StreamReader(texto.Text)
        ' Dim linea As String = lector.ReadLine()
        '  Dim str As String = ""
        '   Dim numLinea As Integer = 1
        '    While Not linea Is Nothing
        '         str = str & "Linea " & numLinea & ": " & linea & vbCrLf
        '          linea = lector.ReadLine()
        '           numLinea = numLinea + 1
        '        End While
        '         MessageBox.Show(str)
        '          lector.Close()
        '       Catch ex As Exception
        '            MsgBox("Error al leer el archivo", MsgBoxStyle.Critical)
        '        End Try

        Try
            Dim lector As StreamReader = New StreamReader(texto.Text)
            Dim str As String = ""
            Dim numLinea As Integer = 1
            Dim linea = lector.ReadLine()
            While lector.Peek() > -1
                str = str & "Linea " & numLinea & ": " & linea & vbCrLf
                linea = lector.ReadLine()
                numLinea = numLinea + 1
            End While
            MessageBox.Show(str)
            lector.Close()
        Catch ex As Exception
            MsgBox("Error al leer el archivo", MsgBoxStyle.Critical)
        End Try



    End Sub

    Private Sub texto_TextChanged(sender As Object, e As EventArgs) Handles texto.TextChanged

    End Sub
End Class
