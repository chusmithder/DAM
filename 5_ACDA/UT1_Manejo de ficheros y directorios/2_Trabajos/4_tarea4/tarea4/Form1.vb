Imports System.IO
Public Class Form1
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles btnagregar.Click
        Dim fichero As StreamWriter
        fichero = New StreamWriter("NOTAS.txt", True)

        fichero.WriteLine("6- nueva linea 1")
        fichero.WriteLine("7- nueva linea 2")

        fichero.Close()
        MessageBox.Show("Añadidas dos lineas nuevas al fichero")
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btncrear.Click
        Dim fichero As StreamWriter
        fichero = New StreamWriter("NOTAS.txt", False)

        fichero.WriteLine("------Los derechos del gato------")
        fichero.WriteLine("1- jugar")
        fichero.WriteLine("2- estudiar")
        fichero.WriteLine("3- pedir ayuda")
        fichero.WriteLine("4- comer")
        fichero.WriteLine("5- salud")

        fichero.Close()
        MessageBox.Show("FIchero creado")
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles btnleer.Click
        Dim lector As StreamReader = New StreamReader("NOTAS.txt")

        'leer primera linea
        Dim linea As String = lector.ReadLine()
        MessageBox.Show("Primera linea: " & linea)

        'leer segunda linea
        linea = lector.ReadLine()
        MessageBox.Show("Segunda linea: " & linea)

        'Resto del fichero
        Dim resto = lector.ReadToEnd()
        MessageBox.Show("Resto del fichero: " & resto)

        lector.Close()
    End Sub
End Class
