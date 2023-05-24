Public Class Form1
    Private Sub btneliminar_Click(sender As Object, e As EventArgs) Handles btneliminar.Click
        Dim archivo As XDocument = XDocument.Load("Archivos.xml")
        For Each ele In From element In archivo.<Archivos>.<Archivo>.<Nombre>
            ele.Remove()
        Next
        texto.Text = archivo.ToString()
    End Sub

    Private Sub btneliminar2_Click(sender As Object, e As EventArgs) Handles btneliminar2.Click
        Dim archivo As XDocument = XDocument.Load("Archivos.xml")
        For Each ele In From element In archivo.<Archivos>.<Archivo>
            ele.Attributes("soloLectura").Remove()
        Next
        texto.Text = archivo.ToString()
    End Sub



    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim archivo As XDocument =
            <?xml version="1.0" encoding="utf-8"?>
            <Archivos directory="C:\AlumMA">
                <Archivo soloLectura="false">
                    <Nombre>JS-Tarea-6.1.html</Nombre>
                    <Extensión>.html</Extensión>
                    <NombreCompleto>C:\AlumMA\JS-Tarea-6.1.html</NombreCompleto>
                    <Carpeta>C:\AlumMA</Carpeta>
                    <Tamano>110</Tamano>
                </Archivo>
                <Archivo soloLectura="false">
                    <Nombre>JS-Tarea-6.2.html</Nombre>
                    <Extensión>.html</Extensión>
                    <NombreCompleto>C:\AlumMA\JS-Tarea-6.2.html</NombreCompleto>
                    <Carpeta>C:\AlumMA</Carpeta>
                    <Tamano>325</Tamano>
                </Archivo>
                <Archivo soloLectura="false">
                    <Nombre>JS-Tarea-6.3.html</Nombre>
                    <Extensión>.html</Extensión>
                    <NombreCompleto>C:\AlumMA\JS-Tarea-6.3.html</NombreCompleto>
                    <Carpeta>C:\AlumMA</Carpeta>
                    <Tamano>78</Tamano>
                </Archivo>
                <Archivo soloLectura="false">
                    <Nombre>JS-Tarea-7.html</Nombre>
                    <Extensión>.html</Extensión>
                    <NombreCompleto>C:\AlumMA\JS-Tarea-7.html</NombreCompleto>
                    <Carpeta>C:\AlumMA</Carpeta>
                    <Tamano>550</Tamano>
                </Archivo>
            </Archivos>
        archivo.Save("Archivos.xml")
        texto.Text = archivo.ToString()
    End Sub

End Class
