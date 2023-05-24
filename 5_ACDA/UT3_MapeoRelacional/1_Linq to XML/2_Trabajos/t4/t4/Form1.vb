Public Class Form1


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim doc As XDocument = XDocument.Load("Bailes.xml")

        Dim resultadoConsulta = From baile In doc...<baile>
                                Select <actividad><%= baile.<nombre> %><%= baile.<precio> %><%= baile.<profesor> %></actividad>



        Dim docDestino As XDocument =
            <?xml version="1.0" encoding="UTF-8"?>
            <Actividades>
                <%= resultadoConsulta %>
            </Actividades>

        docDestino.Save("Actividades1.xml")
        txtContenido.Text = docDestino.ToString()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim doc As XDocument = XDocument.Load("Bailes.xml")

        Dim resultadoConsulta = From baile In doc...<baile>
                                Select <actividad id=<%= baile.@id %>><%= baile.<nombre> %>
                                           <%= baile.<precio> %>
                                           <%= baile.<profesor> %>
                                       </actividad>



        Dim docDestino As XDocument =
            <?xml version="1.0" encoding="UTF-8"?>
            <Actividades>
                <%= resultadoConsulta %>
            </Actividades>

        docDestino.Save("Actividades2.xml")
        txtContenido.Text = docDestino.ToString()
    End Sub
End Class
