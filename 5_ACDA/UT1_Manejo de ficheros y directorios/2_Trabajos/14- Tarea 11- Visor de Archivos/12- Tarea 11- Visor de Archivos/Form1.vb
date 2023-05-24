Imports System.IO
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'al iniciar ejecucion almacenar unidades
        Dim unidades() As String = Directory.GetLogicalDrives()
        'comboUnidades.Items.AddRange(unidades)
        For Each u As String In unidades
            comboUnidades.Items.Add(u)
        Next
    End Sub

    Private Sub comboUnidades_SelectedIndexChanged(sender As Object, e As EventArgs) Handles comboUnidades.SelectedIndexChanged
        'al seleccionar unidad, cargan los directorios de esa carpeta
        Dim unidadSeleccionada As String = comboUnidades.SelectedItem.ToString()
        Try
            If Not unidadSeleccionada Is Nothing Then
                listaCarpetas.Items.Clear()
                Dim carpetas() As String = Directory.GetDirectories(unidadSeleccionada)
                'listaCarpetas.Items.AddRange(carpetas)
                For Each c As String In carpetas
                    listaCarpetas.Items.Add(Path.GetFileName(c))
                Next
            End If
        Catch ex As Exception
            MsgBox("Error en el proceso", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub listaCarpetas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles listaCarpetas.SelectedIndexChanged
        'al seleccionar carpeta, despliega lista de archivos txt
        Dim carpetaSeleccionada As String = comboUnidades.SelectedItem.ToString() & listaCarpetas.SelectedItem.ToString()
        'mostrar archivos
        Try
            If Not carpetaSeleccionada Is Nothing Then
                listaArchivos.Items.Clear()
                Dim archivos() As String = Directory.GetFiles(carpetaSeleccionada, "*.txt")
                'listaArchivos.Items.AddRange(archivos)
                For Each a As String In archivos
                    listaArchivos.Items.Add(Path.GetFileName(a))
                Next
            End If
        Catch ex As Exception
            MsgBox("Error en el proceso")
        End Try
    End Sub

    Private Sub listaArchivos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles listaArchivos.SelectedIndexChanged
        'al seleccionar un archivo, mostrar su contenido en el textBox
        Dim archivoSeleccionado As String = comboUnidades.SelectedItem.ToString() & listaCarpetas.SelectedItem.ToString() & "\" & listaArchivos.SelectedItem.ToString()
        Dim lector As StreamReader
        Try
            If Not archivoSeleccionado Is Nothing Then
                lector = New StreamReader(archivoSeleccionado)
                Dim contenido As String = lector.ReadToEnd()
                txtContenido.Text = contenido
            End If
        Catch ex As Exception
            MsgBox("Error en el proceso", MsgBoxStyle.Critical)
        Finally
            If Not lector Is Nothing Then
                lector.Close()
            End If
        End Try




    End Sub

    Private Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        'al seleccionar guardar, se guardara el texto en el archivo de la carpeta
        Dim ruta As String = comboUnidades.SelectedItem.ToString() & listaCarpetas.SelectedItem.ToString() & "\" & listaArchivos.SelectedItem.ToString()
        Dim archivo As StreamWriter
        Try
            archivo = New StreamWriter(ruta, False) 'se sobreescribira
            archivo.Write(txtContenido.Text)
            MsgBox("Modificado el archivo con éxito", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Error en el proceso", MsgBoxStyle.Critical)
        Finally
            If Not archivo Is Nothing Then
                archivo.Close()
            End If
        End Try
    End Sub

End Class
