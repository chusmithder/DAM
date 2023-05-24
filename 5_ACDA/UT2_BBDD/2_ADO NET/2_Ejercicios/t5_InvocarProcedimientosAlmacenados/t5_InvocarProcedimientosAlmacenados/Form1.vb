Imports System.Data.SqlClient
Public Class Form1
    'Código para conectar con la base de datos Northwind de tu servidor local SQL
    'Server y obtener mediante la ejecución de un procedimiento almacenado la lista
    'de los identificadores y nombres de todas las categorías registradas en la base de datos.
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'Dim cn As New SqlConnection
        'Dim da As New SqlDataAdapter
        'Dim ds As New DataSet

        'cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Northwind;Integrated Security=True"
        'Try
        '    da.SelectCommand = New SqlCommand()
        '    da.SelectCommand.Connection = cn
        '    da.SelectCommand.CommandText = "ListaCategorias"
        '    da.SelectCommand.CommandType = CommandType.StoredProcedure

        '    da.Fill(ds, "Categorias")
        '    DataGridView1.DataSource = ds
        '    DataGridView1.DataMember = "Categorias"
        'Catch ex As Exception

        'End Try
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Northwind;Integrated Security=True"

        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter("ListaCategorias", cn)
            da.SelectCommand.CommandType = CommandType.StoredProcedure

            Dim ds As New DataSet
            da.Fill(ds, "MisCategorias")

            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "MisCategorias"
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
