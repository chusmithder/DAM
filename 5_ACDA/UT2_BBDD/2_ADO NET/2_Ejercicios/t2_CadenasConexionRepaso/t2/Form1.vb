Imports System.Data.Odbc
Imports System.Data.OleDb
Public Class Form1
    'Código para establecer conexión con datos.mdb a través del proveedor más adecuado.
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\alumMA\Desktop\0- Trabajos\2-ACDA\ut2 - bd\res\Access\DATOS.MDB"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Código para establecer conexión con musica.accdb a través de un dsn de sistema
    'de nombre “ParaMusica”
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaMusica"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexiones a DBase y Paradox///////////////////////////////////////

    'Conexión a Articulos.dbf con DSN de usuario de nombre “ParaArticulos”.
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaArticulos"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexión a Illinois.dbf con el valor de los parámetros de la cadena de conexión
    'explícitamente indicados en la propiedad de connectionstring del objeto connection.
    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "DRIVER=Microsoft dBase Driver (*.dbf);DBQ=C:\Users\alumMA\Desktop\0- Trabajos\2-ACDA\ut2 - bd\res\DBase5\Illinois"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexión a la base de datos NY de Paradox con DSN de sistema de nombre “ParaNY”.
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaNY"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexión a la base de datos Países de Paradox con DSN de sistema de nombre “ParaPaíses”.
    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaPaises"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'SQL REMOTO A06SERVIDOR1\SQLEXPRESS /////////////////////////////////////////////////////////////////////

    'Conexión a Pubs, con autenticación de SQL Server a través del Proveedor OLEDB
    '(id de inicio de sesión alumnoServer y contraseña “alumnoserver”)
    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=SQLNCLI11;Data Source=A06SERVIDOR1\SQLEXPRESS;Persist Security Info=True;User ID=alumnoServer;Password=alumnoserver;Initial Catalog=pubs" '''''''
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexión abierta")
            cn.Close()
            MessageBox.Show("Conexión cerrada", "Conexión cerrada")
        Catch oledbex As OleDbException
            MessageBox.Show(oledbex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexión a Northwind, a través del proveedor más adecuado. Autenticación de SQL
    'Server con el id de inicio de sesión alumnoServer y contraseña “alumnoserver”.
    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=SQLNCLI11;Data Source=A06SERVIDOR1\SQLEXPRESS;Persist Security Info=True;User ID=alumnoServer;Password=alumnoserver;Initial Catalog=Northwind" '''''''
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexión abierta")
            cn.Close()
            MessageBox.Show("Conexión cerrada", "Conexión cerrada")
        Catch oledbex As OleDbException
            MessageBox.Show(oledbex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'Conexión a Northwind mediante ODBC pero sin dsn, de tal modo que la información
    'para la conexión vaya explícita a modo de “argumento=valor” en la propiedad
    'connectionstring del objeto connection. Emplea autenticación de SQL Server con
    'el id de inicio de sesión alumnoServer y contraseña “alumnoserver”.
    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "DRIVER=SQL Server;UID=alumnoServer;PWD=alumnoserver;DATABASE=Northwind;SERVER=A06SERVIDOR1\SQLEXPRESS"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexión abierta")
            cn.Close()
            MessageBox.Show("Conexión cerrada", "Conexión cerrada")
        Catch oledbex As OleDbException
            MessageBox.Show(oledbex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub

    'SQL LOCAL/////////////////////////////////////////////////////////////////////

    'Conexión a Pubs, con autenticación implícita de Windows, y haciendo uso de un dsn
    'de archivo de nombre “ParaPubs2.dsn” que guardarás en tu carpeta local Source 
    '(localdb)\MSSQLLocalDB
    Private Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "Filedsn=|DataDirectory|ParaPubs2.dsn"
        Try
            cn.Open()
            MessageBox.Show(cn.ConnectionString, "Conexion abierta")
            cn.Close()
            MessageBox.Show("Cerrada con exito", "Conexion cerrada")
        Catch ex As NotSupportedException
            MessageBox.Show(ex.ToString(), "Error")
        Catch ex As Exception
            MessageBox.Show(ex.ToString(), "Error")
        End Try
    End Sub
End Class
