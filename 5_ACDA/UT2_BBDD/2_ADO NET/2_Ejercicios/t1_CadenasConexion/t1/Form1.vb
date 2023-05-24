Imports System.Data.OleDb
Imports System.Data.Odbc
Public Class Form1
    'Código para establecer conexión con musica.accdb a través del proveedor más adecuado.
    Private Sub btnConectar_Click(sender As Object, e As EventArgs) Handles btnConectar.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source= |DataDirectory|\MUSICA.accdb"

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

    'Código Visual Basic.Net que establezca una conexión con la base de datos Datos.mdb mediante un dsn de usuario de nombre “ParaDatosUsuario”.
    Private Sub btnE2_Click(sender As Object, e As EventArgs) Handles btnE2.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaDatosUsuario"
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

    'Código para establecer conexión con musica.accdb a través de un DSN DE ARCHIVO de nombre “ParaMusicaArchivo.dsn”. "Filedsn=|DataDirectory|ParaMusicaArchivo.dsn"
    Private Sub btnE3_Click(sender As Object, e As EventArgs) Handles btnE3.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "Filedsn=|DataDirectory|ParaMusicaArchivo.dsn"
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


    'Código que establezca conexión con musica.accdb mediante ODBC pero sin dsn explícito como tal (la información
    'que en la prueba anterior va almacenada en el archivo dsn, debes incluirla en la propiedad connectionstring 
    'como una expresión de cadena formada por pares de nombres de argumentos y sus correspondientes valores, separados 
    'por un punto y coma. Algo así como: “nombreArgumento = valor; nombreArgumento = valor; nombreArgumento = valor;...”
    Private Sub btnE4_Click(sender As Object, e As EventArgs) Handles btnE4.Click
        'DRIVER = Microsoft Access Driver (*.mdb, *.accdb)
        'DefaultDir = C : \Users\alumMA\Desktop\0- Trabajos\2-ACDA\ut2 - bd\resources
        'DBQ = C :  \Users\alumMA\Desktop\0- Trabajos\2-ACDA\ut2 - bd\resources\MUSICA.accdb
        Dim cn As New OdbcConnection
        cn.ConnectionString = "DRIVER=Microsoft Access Driver (*.mdb, *.accdb);DBQ=C:\Users\alumMA\Desktop\0- Trabajos\2-ACDA\ut2 - bd\resources\MUSICA.accdb"
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


    'Conexión a Illinois.dbf con DSN de archivo de nombre “ParaIllinois.dsn”.
    Private Sub btnE5_Click(sender As Object, e As EventArgs) Handles btnE5.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "Filedsn=|DataDirectory|ParaIllinois.dsn"
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

    'Conexión a Northwind de tu servidr mediante OLEDB. Autenticación
    'de SQL Server con el id de inicio de sesión alumnoserver y contraseña “alumnoserver”.
    Private Sub btnE6_Click(sender As Object, e As EventArgs) Handles btnE6.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=MSOLEDBSQL.1;Data Source=(localdb)\MSSQLLocalDB;Integrated Security=SSPI; Database=Northwind" '''''''
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

    'Conexión a Northwind de A06SERVIDOR1\SQLEXPRESS pero ahora has de usar para la conexión 
    'el archivo NorthWindServidor1.dsn ubicado en un tercer equipo, en concreto en el equipo
    '3MASanzA06, en una carpeta de nombre Compartida (\\3masanz-A06-00\Compartida)
    Private Sub btnE7_Click(sender As Object, e As EventArgs) Handles btnE7.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "Filedsn=\\3masanz-A06-00\Compartida\NorthWindServidor1.dsn"
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
