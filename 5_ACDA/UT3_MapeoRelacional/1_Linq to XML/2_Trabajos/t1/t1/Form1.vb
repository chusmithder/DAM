'Imports <xmlns:ns="http://someNamespace">
Public Class Form1
    Private Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Dim doc As XDocument =
            <?xml version="1.0" encoding="utf-8"?>
            <Contactos>
                <Contacto>
                    <Nombre>Juan</Nombre>
                    <EMail>juan@gmail.com</EMail>
                    <Telefono Móvil="666666666" Trabajo="911111111"/>
                </Contacto>
                <Contacto>
                    <Nombre>Luis</Nombre>
                    <EMail>luis@gmail.com</EMail>
                    <Telefono Móvil="666777777"/>
                </Contacto>
                <Contacto>
                    <Nombre>María</Nombre>
                    <EMail>maria@gmail.com</EMail>
                    <Telefono Móvil="666888888" Personal="91222222"/>
                </Contacto>
                <Contacto>
                    <Nombre>Lola</Nombre>
                    <EMail>lola@gmail.com</EMail>
                    <Telefono Móvil="666888888" Personal="91222222"/>
                </Contacto>
            </Contactos>
        doc.Save("contactos.xml")
        MsgBox("Documento xml creado", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCargar_Click(sender As Object, e As EventArgs) Handles btnCargar.Click
        Try
            Dim xmlCargado = XDocument.Load("contactos.xml")
            txtContenido.Text = xmlCargado.ToString
        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
