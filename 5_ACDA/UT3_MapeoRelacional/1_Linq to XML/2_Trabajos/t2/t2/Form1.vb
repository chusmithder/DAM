Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ''fuente de datos
        'Dim doc As XDocument = XDocument.Load("archivo.xml")
        ''crear consulta
        'Dim seleccion = From datos In doc...<datosPersona>
        '                Where datos.<nombre>.Value Like "??r*"
        '                Select datos.<nombre>.Value

        'Dim seleccion2 = From datos In doc...<nombre>
        '                 Where datos.Value Like "??r*"
        '                 Select datos.Value

        'Dim seleccion3 = From datos In doc.Root...<nombre>
        '                 Where datos.Value Like "??r*"
        '                 Select datos.Value
        'Dim seleccion4 = From datos In doc.Root...<datosPersona>.<nombre>
        '                 Where datos.Value Like "??r*"
        '                 Select datos.Value
        ''ejecutar consulta
        'For Each s In seleccion
        '    MsgBox(s)
        'Next
    End Sub

    Private Sub btnNombres_Click(sender As Object, e As EventArgs) Handles btnNombres.Click
        Try
            Dim doc As XDocument = XDocument.Load("contactos.xml")

            Dim seleccion = From contacto In doc.Descendants("Contacto")
                            Select contacto.Element("Nombre").Value

            listNombre.Items.Clear()
            For Each s In seleccion
                listNombre.Items.Add(s)
            Next
        Catch ex As Exception
            MsgBox("El preoceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnFiltro_Click(sender As Object, e As EventArgs) Handles btnFiltro.Click
        Try
            Dim doc As XDocument = XDocument.Load("contactos.xml")

            Dim seleccion = From contacto In doc...<Contacto>
                            Where contacto.<Nombre>.Value Like "L*"
                            Select contacto.<Nombre>.Value & ": " & contacto.Element("Telefono").Attribute("Móvil").Value

            listFiltro.Items.Clear()
            For Each s In seleccion
                listFiltro.Items.Add(s)
            Next
        Catch ex As Exception
            MsgBox("El preoceso falló", MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
