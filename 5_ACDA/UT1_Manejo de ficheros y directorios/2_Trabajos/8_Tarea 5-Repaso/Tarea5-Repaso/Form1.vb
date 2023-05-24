Imports System.IO
Public Class Form1
    Private Sub btnAnadir_Click(sender As Object, e As EventArgs) Handles btnAnadir.Click
        Dim fichero As StreamWriter
        Try
            fichero = New StreamWriter("Socios.txt", True) 'para poder añadir contenido
            If txbNombre.Text <> "" And txbDNI.Text <> "" Then
                fichero.WriteLine("Nombre: " & txbNombre.Text & " - DNI: " & txbDNI.Text)
                MsgBox("Añadido socio con DNI " & txbDNI.Text, MsgBoxStyle.Information)
            Else
                MsgBox("Debe completar los campos", MsgBoxStyle.Critical)
            End If
            txbDNI.Text = ""
            txbNombre.Text = ""
        Catch ex As Exception
            MsgBox("Error en el proceso", MsgBoxStyle.Critical)
        Finally
            If Not (fichero Is Nothing) Then
                fichero.Close()
            End If
        End Try
    End Sub

    Private Sub btnMostrar_Click(sender As Object, e As EventArgs) Handles btnMostrar.Click
        Dim lector As StreamReader
        Try
            If File.Exists("Socios.txt") Then
                lector = New StreamReader("Socios.txt")
                Dim texto As String = "----------SOCIOS----------" & vbCrLf
                Dim num As Integer = 0
                Dim linea As String = lector.ReadLine()
                While Not linea Is Nothing
                    num = num + 1
                    texto = texto & num & ": " & linea & vbCrLf
                    linea = lector.ReadLine()
                End While
                MsgBox(texto, MsgBoxStyle.Information)
            Else
                MsgBox("No hay socios en el fichero", MsgBoxStyle.Critical)
            End If
        Catch ex As Exception
            MsgBox("Error al realizar el proceso", MsgBoxStyle.Critical)
        Finally
            If Not (lector Is Nothing) Then
                lector.Close()
            End If
        End Try
    End Sub
End Class
