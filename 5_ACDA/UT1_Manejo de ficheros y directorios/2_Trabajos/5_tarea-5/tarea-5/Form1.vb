Imports System.IO
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim mensaje = "Introduce nombre de archivo en extension"
        Dim titulo = "ARCHIVO"

        ' Display message, title, and default value.
        Dim ruta As String
        ruta = InputBox(mensaje, titulo)

        If File.Exists(ruta) Then
            Dim lector As StreamReader = New StreamReader(ruta)
            Dim texto = lector.ReadToEnd()
            MessageBox.Show(texto)
            lector.Close()
            mensaje.Clone()
            Me.Close()
        Else
            MessageBox.Show("El fichero introducido no existe")
            ruta = InputBox(mensaje, titulo)
        End If
    End Sub
End Class
