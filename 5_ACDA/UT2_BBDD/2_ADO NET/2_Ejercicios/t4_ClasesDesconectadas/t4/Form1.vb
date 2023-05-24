Imports System.Data.Odbc
Imports System.Data.OleDb
Imports System.Data.Sql
Public Class Form1

    'Código .NET (Visual Basic o C#) que cargue el contenido de la tabla autores
    'de musica.accdb en un dataset. Realizar la conexión con un dsn de sistema.
    'Mostrar las filas en DataGridView
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaMusica"
        Try
            Dim da As OdbcDataAdapter = New OdbcDataAdapter("select * from Autores", cn)
            Dim ds As New DataSet
            da.Fill(ds, "MisAutores")

            DataGridView1.DataSource = ds.Tables("MisAutores")
            'DataGridView1.DataSource = ds
            'DataGridView1.DataMember = "MisAutores"
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Idem pero una vez cargada la tabla en el dataset recorrer el contenido de la
    'tabla en él cargada para mostrar el código y nombre del autor en un ListBox
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'Dim cn As New OdbcConnection
        'Dim daAutores As OdbcDataAdapter
        'Dim ds As New DataSet

        'cn.ConnectionString = "dsn=ParaMusica"
        'Try
        '    daAutores = New OdbcDataAdapter("select * from Autores", cn)
        '    daAutores.Fill(ds, "misAutores")

        '    For Each row In ds.Tables(0).Rows
        '        ListBox1.Items.Add(row(0) + " - " + row(1))
        '    Next

        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try
        Dim cn As New OdbcConnection
        cn.ConnectionString = "dsn=ParaMusica"
        Try
            Dim da As OdbcDataAdapter = New OdbcDataAdapter("select * from Autores", cn)
            Dim ds As New DataSet
            da.Fill(ds, "MisAutores")

            For Each row In ds.Tables("MisAutores").Rows
                ListBox1.Items.Add(row("CodAutor") + " - " + row("Autor"))
            Next
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Carga en un mismo DataSet (codifica un único procedimiento de evento) las siguientes tablas:
    'La tabla Grabaciones de Musica.accdb. Conexión con dsn de archivo
    'La tabla art.dbf de Dbase. Conexión como tú quieras...
    'La tabla países.db de Paradox; Conexión como quieras...
    'La tabla Categories de Northwind de SQL Server (servidor local; autenticación de windows). La
    'conexión con DSN de sistema.
    'Muestra cada tabla en un DatagridView, y debajo de cada uno de ellos muestra la cadena de conexión
    'utilizada.
    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        'Dim cn = New OdbcConnection()
        'cn.ConnectionString = "DSN=ParaMusica"
        'Dim da = New OdbcDataAdapter("Select * from Grabaciones", cn)
        'Dim ds = New DataSet()
        'da.Fill(ds, "MisGrabaciones")
        'DataGridView5.DataSource = ds
        'DataGridView5.DataMember = "MisGrabaciones"

        'cn.ConnectionString = "Dsn=ParaArticulos"
        'Dim daA = New OdbcDataAdapter("SELECT * FROM art", cn)
        'daA.Fill(ds, "MisArticulos")
        'DataGridView3.DataSource = ds
        'DataGridView3.DataMember = "MisArticulos"


        'cn.ConnectionString = "Dsn=PaisesDeParadox"
        'Dim daP = New OdbcDataAdapter("SELECT * FROM Países", cn)
        'daP.Fill(ds, "MisPaíses")
        'DataGridView4.DataSource = ds
        'DataGridView4.DataMember = "MisPaíses"


        'cn.ConnectionString = "Dsn=Northwind-local"
        'Dim daN = New OdbcDataAdapter("SELECT * FROM Categories", cn)
        'daN.Fill(ds, "MisCategories")
        'DataGridView2.DataSource = ds
        'DataGridView2.DataMember = ("MisCategories")

    End Sub
End Class
