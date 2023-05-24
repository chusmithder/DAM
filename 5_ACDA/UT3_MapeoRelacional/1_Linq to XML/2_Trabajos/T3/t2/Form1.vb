Public Class Form1

    Private Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Dim doc As XDocument = XDocument.Load("Bailes.xml")

        Dim seleccion = From baile In doc...<baile>
                        Where Integer.Parse(baile.Element("plazas").Value) > 15
                        Select baile


        'Dim resultadoConsulta As XDocument
        listContenido.Items.Clear()

        For Each s In seleccion
            listContenido.Items.Add(s)
            'resultadoConsulta.Root.Add(s)
        Next


        Dim docDestino As XDocument =
            <?xml version="1.0" encoding="UTF-8"?>
            <Bailes>
                <%= resultadoConsulta %>
            </Bailes>

        docDestino.Save("bailes2.xml")




    End Sub

    Private Sub btnCrear_ClientSizeChanged(sender As Object, e As EventArgs) Handles btnCrear.ClientSizeChanged

    End Sub
End Class
