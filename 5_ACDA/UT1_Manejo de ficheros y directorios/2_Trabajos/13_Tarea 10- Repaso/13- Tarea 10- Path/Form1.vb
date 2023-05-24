Imports System.IO
Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            '1- mostrar directorio actual de trabajo
            Dim dirActual As String = Directory.GetCurrentDirectory()
            MsgBox("Directorio actual: " & dirActual) 'carpeta debug

            '2-Establecer temporalmente c:/temp como directorio actual. Si no existe, crearlo
            If Not Directory.Exists("C:\temp") Then
                Directory.CreateDirectory("C:\temp")
            End If
            Directory.SetCurrentDirectory("C:\temp")

            Dim temporal As String = Directory.GetCurrentDirectory()
            MsgBox("Nuevo directorio actual: " & temporal)

            '3- Establece el directorio actual con el valor original
            Directory.SetCurrentDirectory(dirActual)
            dirActual = Directory.GetCurrentDirectory()
            MsgBox("Directorio actual: " & dirActual)

        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            'Mostrar todas las unidades logicas del sistema
            Dim str As String = "UNIDADES LOGICAS" & vbCrLf
            Dim unidades() As String = Directory.GetLogicalDrives()
            For Each u As String In unidades
                str = str & u & vbCrLf
            Next
            MsgBox(str, MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Try
            'Mostrar archivos de solo lectura con extension .docx
            Dim ruta As String = InputBox("Introduce ruta de carpeta", "RUTA", "ejemplo")
            'Dim ext As String = InputBox("Introduce ruta de filtro para buscar", "EXTENSION", "txt")
            Dim files As String()
            files = Directory.GetFiles(ruta, "*.docx")
            For Each f As String In files
                If GetAttr(f) And vbReadOnly Then
                    MsgBox(f)
                End If
            Next
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        'mostrar archivos de una ruta proporcionada
        Dim ruta As String = InputBox("Introduce ruta de carpeta", "RUTA", "ejemplo")

    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Try
            Dim ruta As String = InputBox("Introduce nombre de carpeta a crear", "CREAR DIRECTORIO")
            If Directory.Exists(ruta) Then
                MsgBox("El directorio ya existe", MsgBoxStyle.Critical)
            Else
                MsgBox("Creado el directorio: " & Path.GetDirectoryName(ruta), MsgBoxStyle.Information)
            End If
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim ruta As String = InputBox("Introduce nombre del directorio", "MOSTRAR ARCHIVOS .txt", "ejemplo")
        Try
            'mostrar archivos .txt del directorio especificado

            Dim fic() As String = Directory.GetFiles(ruta, "*.txt")
            Dim resul As String = "Ficheros txt de la carpeta " & Path.GetFileName(ruta) & vbCrLf
            For Each f As String In fic
                resul = resul + Path.GetFileName(f) & vbCrLf
            Next
            MsgBox(resul, MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click

    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        'listar directorios contenidos en la ruta especificada
        Dim ruta As String = InputBox("Introduce nombre del directorio", "MOSTRAR SUBDIRECTORIOS", "ejemplo")
        Try
            Dim dirs() As String = Directory.GetDirectories(ruta, "*")
            Dim str As String = "SUBDIRECTORIOS DE " & Path.GetFileName(ruta) + ":" + vbCrLf
            For Each dir As String In dirs
                str = str + Path.GetFileName(dir) + vbCrLf
            Next
            MsgBox(str, MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        'mostrar archivos .txt del directorio especificado
        Dim ruta As String = InputBox("Introduce nombre del directorio", "MOSTRAR ARCHIVOS .txt", "ejemplo")
        Try

            Dim fic() As String = Directory.GetFiles(ruta, "*.txt", SearchOption.AllDirectories)
            Dim resul As String = "Ficheros txt de la carpeta " & Path.GetFileName(ruta) & vbCrLf
            For Each f As String In fic
                resul = resul + Path.GetFileName(f) & vbCrLf
            Next
            MsgBox(resul, MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        'mostrar archivos y directorios de la ruta especificada
        Dim ruta As String = InputBox("Introduce nombre del directorio", "MOSTRAR ARCHIVOS Y DIRECTORIOS", "ejemplo")
        Try

            Dim resul As String = "FICHEROS Y DIRECTORIOS DE " & Path.GetFileName(ruta) & vbCrLf & vbCrLf
            resul = resul & "FICHEROS ---------- " & vbCrLf
            Dim carpeta As New DirectoryInfo(ruta)
            Dim files() As FileInfo = carpeta.GetFiles("*", SearchOption.AllDirectories)
            Dim n As Integer = 1
            For Each f As FileInfo In files
                resul = resul + n.ToString() + "- " + f.Name + " /// " + f.CreationTime.ToString() + vbCrLf
                n = n + 1
            Next
            resul = resul & vbCrLf & "CARPETAS ----------------" & vbCrLf
            Dim dirs() As DirectoryInfo = carpeta.GetDirectories("*", SearchOption.AllDirectories)
            n = 1
            For Each d As DirectoryInfo In dirs
                resul = resul + n.ToString() + "- " + d.Name + " /// " + d.CreationTime.ToString() + vbCrLf
                n = n + 1
            Next

            MsgBox(resul, MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("El proceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        'cambiar extension de archivo con path
        Dim ruta As String = InputBox("Introduce nombre del archivo", "CAMBIAR EXTENSION", "ejemplo\m.docx")
        Dim extension As String = InputBox("introduce nueva extension")
        Try
            If File.Exists(ruta) Then
                Dim nueva As String = Path.ChangeExtension(ruta, extension)
                MsgBox("Archivo modificado: " & nueva)
                'otro metodo que si la modifique
            Else
                MsgBox("No existe el fichero", MsgBoxStyle.Critical)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
        Me.Close()
    End Sub
End Class
