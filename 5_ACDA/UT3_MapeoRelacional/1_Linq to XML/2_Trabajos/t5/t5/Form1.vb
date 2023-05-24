Imports System.IO
Public Class Form1
    Private Sub btnUbicacion_Click(sender As Object, e As EventArgs) Handles btnUbicacion.Click
        If FolderBrowserDialog1.ShowDialog = DialogResult.OK Then
            Try
                Dim ruta = FolderBrowserDialog1.SelectedPath
                txtRuta.Text = ruta

                Dim archivos() As String = Directory.GetFiles(ruta)

                Dim resultado

                Dim doc As XElement =
                    <Archivos directory=<%= ruta %>>

                    </Archivos>

                listArchivos.Items.Clear()


                'obtener detalles de cada archivo
                For Each a As String In archivos
                    Dim f As FileInfo = New FileInfo(a)


                    Dim soloLectura As String = f.IsReadOnly.ToString()
                    Dim nombre As String = f.Name
                    Dim extension As String = f.Extension
                    Dim nombreCompleto As String = f.FullName
                    Dim carpeta As String = f.DirectoryName
                    Dim tam As String = f.Length.ToString

                    listArchivos.Items.Add(nombre)

                    Dim res As XElement =
                        <Archivo isReadOnly=<%= soloLectura %>>
                            <Nombre><%= nombre %></Nombre>
                            <Extension><%= extension %></Extension>
                            <NombreCompleto><%= nombreCompleto %></NombreCompleto>
                            <Carpeta><%= carpeta %></Carpeta>
                            <Tamano><%= tam %></Tamano>
                        </Archivo>

                    doc.Add(res)

                Next
                txtContenido.Text = doc.ToString
                doc.Save(Path.GetFileName(ruta) + ".xml")
                MsgBox("Se ha guardado correctamente", MsgBoxStyle.Information)
            Catch ex As Exception
                MsgBox("El proceso fallo")
            End Try
        End If
    End Sub

    Private Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Me.Close()
    End Sub
End Class
