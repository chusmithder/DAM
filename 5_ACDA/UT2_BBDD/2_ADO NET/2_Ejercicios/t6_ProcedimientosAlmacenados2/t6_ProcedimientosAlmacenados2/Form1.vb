Imports System.Data.Odbc
Imports System.Data.SqlClient
Imports System.Data.OleDb
Public Class Form1
    'Código para conectar con la base de datos Northwind de tu servidor local SQL Server
    'e invocar el procedimiento almacenado Ten Most Expensive Products. El procedimiento
    'es uno de los que viene de ejemplo ya creados en la Base de Datos (consulta en tu
    'servidor el código del procedimiento). La conexión has de hacerla con un DSN de archivo
    'y autenticación implícita. Si el ejercicio de la Tarea anterior lo has hecho con un objeto
    'DataReader, haz este con un DataSet y viceversa.

    'ojo!: la inclusión de los caracteres "[" y "]" para indicar el nombre del procedimiento
    'es precisa por la combinación de espacios y el uso de las clases ODBC; si usáramos las
    'clases de sqlClient no hubiéramos precisado encerrar el nombre del procedimiento entre
    'corchetes;
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "filedsn=|DataDirectory|\NorthWind.dsn"
        Try
            cn.Open()
            Dim cmd As OdbcCommand = New OdbcCommand("[Ten Most Expensive Products]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim dr As OdbcDataReader
            dr = cmd.ExecuteReader()

            Dim dt As New DataTable
            dt.Load(dr)
            DataGridView1.DataSource = dt

            dr.Close()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Invocar al procedimiento almacenado SalesByCategory de Northwind en tu servidor local.
    'Utiliza un DataReader y muestra el resultado de la consulta en un DataGridView. 
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Northwind;Integrated Security=True"
        Try
            cn.Open()
            Dim cmd As SqlCommand = New SqlCommand("SalesByCategory", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim param As SqlParameter = New SqlParameter("@CategoryName", SqlDbType.NVarChar, 15)
            param.Direction = ParameterDirection.Input
            param.Value = "Beverages"
            cmd.Parameters.Add(param)

            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            Dim dt As New DataTable
            dt.Load(dr)
            DataGridView1.DataSource = dt

            dr.Close()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Invocar desde tu aplicación al procedimiento almacenado de Northwind ContarPedidos
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Northwind;Integrated Security=True"
        Try
            cn.Open()
            Dim cmd As SqlCommand = New SqlCommand("ContarPedidos", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim param As SqlParameter = New SqlParameter("@CustomerID", SqlDbType.NChar, 5)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox1.Text
            cmd.Parameters.Add(param)

            param = New SqlParameter("@ItemCount", SqlDbType.Int)
            param.Direction = ParameterDirection.Output
            cmd.Parameters.Add(param)

            cmd.ExecuteScalar()

            cn.Close()

            Dim n As Integer = cmd.Parameters("@ItemCount").Value
            MsgBox("Numero devuelto: " + n.ToString())
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Invocar desde tu aplicación Net el procedimiento almacenado Sales By Year.
    'Es uno de los procedimientos almacenados que vienen predefinidos en la base
    'de datos Northwind. Hacerlo con DataReader. Puedes hacer pruebas con cualquier
    'intervalo de fechas entre el “01/01/1996” y “31/12/1997”
    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Northwind;Integrated Security=True"
        Try
            cn.Open()
            Dim cmd As SqlCommand = New SqlCommand("Sales by Year", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim param As SqlParameter = New SqlParameter("@Beginning_Date", SqlDbType.DateTime)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox2.Text
            cmd.Parameters.Add(param)

            param = New SqlParameter("@Ending_Date", SqlDbType.DateTime)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox3.Text
            cmd.Parameters.Add(param)


            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            Dim dt As New DataTable
            dt.Load(dr)
            DataGridView1.DataSource = dt

            dr.Close()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Ejecutar desde tu aplicación la consulta “Ten Most Expensive Products” de Nwind.mdb
    '(ojo!! es la misma BD pero en versión Access; disponible en moodle) Hacerlo con DataReader
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\Nwind.mdb"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("[Ten Most Expensive Products]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            Dim dt As New DataTable
            dt.Load(dr)
            DataGridView1.DataSource = dt

            dr.Close()
            cn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try

    End Sub
End Class
