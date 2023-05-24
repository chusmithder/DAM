Imports System.Data.Odbc
Imports System.Data.OleDb
Imports System.Data.SqlClient
'cn.ConnectionString = "filedsn=|DataDirectory|\dsnPubs.dsn"
'cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=pubs;Integrated Security=True"
'cn.ConnectionString = "Provider=SQLNCLI11;Data Source=(LocalDB)\MSSQLLocalDB;Integrated Security=SSPI;Initial Catalog=pubs"
Public Class Form1

    'Conectado ODBC
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "filedsn=|DataDirectory|\dsnPubs.dsn"
        Try
            cn.Open()
            Dim cmd As OdbcCommand = New OdbcCommand("p1#EmpleadosPorCargo", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim dr As OdbcDataReader = cmd.ExecuteReader()
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

    'Desconectado SQL
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=pubs;Integrated Security=True"
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter("p1#EmpleadosPorCargo", cn)
            da.SelectCommand.CommandType = CommandType.StoredProcedure

            Dim ds As New DataSet
            da.Fill(ds, "EmpleadosCargo")

            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "EmpleadosCargo"
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Desconectado SQL
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=pubs;Integrated Security=True"
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter("p2#EmpleadoCargo", cn)
            da.SelectCommand.CommandType = CommandType.StoredProcedure

            Dim param As SqlParameter = New SqlParameter("@idEmpleado", SqlDbType.Char, 9)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox1.Text
            da.SelectCommand.Parameters.Add(param)

            Dim ds As New DataSet
            da.Fill(ds, "EmpleadoCargo")

            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "EmpleadoCargo"
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Conectado oledb
    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=SQLNCLI11;Data Source=(LocalDB)\MSSQLLocalDB;Integrated Security=SSPI;Initial Catalog=pubs"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("p2#EmpleadoCargo", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim param As OleDbParameter = New OleDbParameter("@idEmpleado", OleDbType.Char, 9)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox1.Text
            cmd.Parameters.Add(param)

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

    'conectado oledb
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim cn As New OleDbConnection
        cn.ConnectionString = "Provider=SQLNCLI11;Data Source=(LocalDB)\MSSQLLocalDB;Integrated Security=SSPI;Initial Catalog=pubs"
        Try
            cn.Open()
            Dim cmd As OleDbCommand = New OleDbCommand("p3#EmpleadosEditorial", cn)
            cmd.CommandType = CommandType.StoredProcedure

            Dim param As OleDbParameter = New OleDbParameter("@nombrePub", OleDbType.VarChar, 40)
            param.Direction = ParameterDirection.Input
            param.Value = TextBox2.Text
            cmd.Parameters.Add(param)

            Dim param2 As OleDbParameter = New OleDbParameter("@numEmpleados", OleDbType.Integer)
            param2.Direction = ParameterDirection.Output
            cmd.Parameters.Add(param2)

            cmd.ExecuteScalar()
            cn.Close()

            Dim num As Integer = cmd.Parameters("@numEmpleados").Value
            MsgBox("La editorial " + TextBox2.Text + " tiene " + num.ToString() + " empleados")
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub

    'Desconectado SQL
    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=pubs;Integrated Security=True"
        Try
            Dim da As SqlDataAdapter = New SqlDataAdapter("p3#EmpleadosEditorial", cn)
            da.SelectCommand.CommandType = CommandType.StoredProcedure

            Dim p1 As SqlParameter = New SqlParameter("@nombrePub", SqlDbType.VarChar, 40)
            p1.Direction = ParameterDirection.Input
            p1.Value = TextBox2.Text
            da.SelectCommand.Parameters.Add(p1)

            Dim p2 As SqlParameter = New SqlParameter("@numEmpleados", SqlDbType.Int)
            p2.Direction = ParameterDirection.Output
            da.SelectCommand.Parameters.Add(p2)

            cn.Open()
            da.SelectCommand.ExecuteScalar()
            cn.Close()

            Dim num As Integer = da.SelectCommand.Parameters("@numEmpleados").Value
            MsgBox("La editorial " + TextBox2.Text + " tiene " + num.ToString() + " empleados")
        Catch ex As Exception
            MsgBox(ex.Message)
            cn.Close()
        End Try
    End Sub
End Class
