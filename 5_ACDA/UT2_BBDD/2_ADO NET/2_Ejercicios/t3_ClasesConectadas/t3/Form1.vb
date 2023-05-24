Imports System.Data.OleDb
Imports System.Data.Odbc
Public Class Form1

    'Código .NET que muestre en un listBox todos los registros (campos codigo de autor y autor)
    'de la tabla Autores de la base de datos musica.accdb de access
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'ListBox1.Items.Clear()

        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand
        'Dim dr As OleDbDataReader
        'Dim campo1 As String
        'Dim campo2 As String

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "select * from Autores"
        '    'Dim cmd2 As OleDbCommand = New OleDbCommand("select * from Autores", cn)
        '    dr = cmd.ExecuteReader()
        '    While dr.Read()
        '        campo1 = dr("Codautor")
        '        campo2 = dr("autor")
        '        ListBox1.Items.Add(campo1 & vbTab & campo2)
        '    End While
        '    dr.Close()
        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try

        'connection
        'command
        'datareader
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"

        Try
            cn.Open()
            'cmd.Connection = cn
            'cmd.CommandText = "SELECT * FROM Autores"
            Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM Autores", cn)

            Dim dr As OleDbDataReader
            dr = cmd.ExecuteReader()

            While dr.Read()
                Dim c1 As String = dr("CodAutor").ToString()
                Dim c2 As String = dr("autor").ToString()
                ListBox1.Items.Add(c1 & vbTab & c2)
            End While

            dr.Close()
            cn.Close()
        Catch ex As Exception
            cn.Close
        End Try
    End Sub

    'Mostrar en un GridView sin recorrer el DataReader, los datos de la tabla Grabaciones de
    'musica.accdb cuyos valores de código de grabación esté comprendido entre 010 y 020 ambos incluidos
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand
        'Dim dr As OleDbDataReader

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "SELECT * FROM Grabaciones WHERE CodGrabacion >= '050' AND CodGrabacion <= '092' ORDER BY Titulo"

        '    dr = cmd.ExecuteReader()

        '    Dim dt As New DataTable
        '    dt.Load(dr)
        '    DataGridView1.DataSource = dt

        '    dr.Close()
        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"

        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM Grabaciones WHERE CodGrabacion >= '050' AND CodGrabacion <= '092' ORDER BY Titulo", cn)

            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            Dim dt As New DataTable
            dt.Load(dr)
            DataGridView1.DataSource = dt

            dr.Close()
            cn.Close()
        Catch ex As Exception
            cn.Close()
        End Try
    End Sub

    'Programa VB.NET que permita insertar registros en la tabla Autores de Musica.accdb
    'ssql = "INSERT INTO Autores (CodAutor, Autor) vALUES ('" + TextBox1.Text + "', '" + TextBox2.Text + "')"
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "INSERT INTO Autores (CodAutor, Autor) vALUES ('" + TextBox1.Text + "', '" + TextBox2.Text + "')"
        '    MessageBox.Show("Autor insertado")
        '    cmd.ExecuteNonQuery()
        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("INSERT INTO Autores (CodAutor, Autor) vALUES ('" + TextBox1.Text + "', '" + TextBox2.Text + "')", cn)
            cmd.ExecuteNonQuery()
            MessageBox.Show("Autor insertado")
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Borrar de la tabla Grabaciones los registros con códigos comprendidos entre 054 y 056 ambos incluidos.
    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "DELETE FROM Grabaciones WHERE CodGrabacion >= '054' AND CodGrabacion > '056'"

        '    MessageBox.Show("Eliminados correctamente")
        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("DELETE FROM Grabaciones WHERE CodGrabacion >= '054' AND CodGrabacion > '056'", cn)
            cmd.ExecuteNonQuery()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Mostrar en un MsgBox los campos “CodGrabacion” y “Titulo” de los registros con Título de la letra U en
    'adelante. Ordenar el resultado por Título. La conexión ha de realizarse a través de un dsn “paramusica”
    'que ya tendrás creado de ejercicios anteriores.
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        'Dim cn As New OdbcConnection
        'Dim cmd As New OdbcCommand
        'Dim dr As OdbcDataReader
        'Dim campo1 As String
        'Dim campo2 As String

        'cn.ConnectionString = "dsn=ParaMusica"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "SELECT * FROM Grabaciones WHERE Titulo >= 'E' ORDER BY Titulo"

        '    dr = cmd.ExecuteReader
        '    Dim resul As String = ""
        '    While dr.Read()
        '        campo1 = dr("CodGrabacion")
        '        campo2 = dr("Titulo")
        '        resul += "Codgrabacion: " & campo1 & vbTab & "Titulo: " & campo2 & vbCrLf
        '    End While

        '    MsgBox(resul)
        '    dr.Close()
        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try

        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaMusica"
        Try
            cn.Open()
            Dim cmd As OdbcCommand = New OdbcCommand("SELECT * FROM Grabaciones WHERE Titulo >= 'U' ORDER BY Titulo", cn)
            Dim dr As OdbcDataReader = cmd.ExecuteReader()

            Dim resul As String = ""
            While dr.Read()
                resul = resul + dr("CodGrabacion").ToString() + vbTab + dr("Titulo").ToString() + vbCrLf
            End While
            MsgBox(resul)

            dr.Close()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try

    End Sub

    'Programa VB que lleve a cabo una consulta de acción (la que tu quieras, siempre y cuando no sea ninguna
    'de las ya realizadas en los ejercicios anteriores), sobre una base de datos de Access (eligela tú), y
    'que muestre en un cuadro de mensaje el número de registros afectados (consultar formatos de
    'ExecuteNonquery). Muestra en una label del formulario la consulta de acción que realiza la aplicación.
    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand
        'Dim stringCommand As String

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    stringCommand = "UPDATE Grabaciones SET Titulo = 'XXXXXXXX' WHERE CodGrabacion = '001'"
        '    cmd.CommandText = stringCommand

        '    Dim num As Integer = cmd.ExecuteNonQuery()
        '    MessageBox.Show("Registros afectados: " & num)
        '    Label1.Text = stringCommand

        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try

    End Sub

    'Programa que sobre la base de datos Musica.accdb obtenga el total de registros de la tabla Grabaciones
    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        'Dim cn As New OleDbConnection
        'Dim cmd As New OleDbCommand

        'cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        'Try
        '    cn.Open()
        '    cmd.Connection = cn
        '    cmd.CommandText = "select count(*) from Grabaciones"
        '    Dim num As Integer = cmd.ExecuteScalar()
        '    MsgBox("Total de registros: " & num)

        '    cn.Close()
        'Catch ex As Exception
        '    MessageBox.Show(ex.Message)
        'End Try
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\MUSICA.accdb"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("SELECT COUNT(*) FROM Grabaciones", cn)
            Dim num As Integer = cmd.ExecuteScalar()
            MsgBox("Numero de registros: " & num.ToString())
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try

    End Sub
End Class
