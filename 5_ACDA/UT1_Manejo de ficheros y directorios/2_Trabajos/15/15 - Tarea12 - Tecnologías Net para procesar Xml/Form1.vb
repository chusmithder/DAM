Imports System.IO
Imports System.Xml
Imports System.Xml.XPath
Imports System.Xml.Xsl

Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim lector As StreamReader
        Try
            lector = New StreamReader("Libros.xml")
            txtContenido.Text = lector.ReadToEnd
            lector.Close()
        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        Finally
            If Not lector Is Nothing Then
                lector.Close()
            End If
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim lector As XmlTextReader
        Dim text As String = ""
        Try
            lector = New XmlTextReader("Libros.xml")
            'mientras haya info a tratar

            While lector.Read() 'devuelve true si aun hay lineas por leer
                'dependiende del tipo del nodo, lo procesamos de una forma u otra
                Select Case lector.NodeType 'obtiene el tipo del nodo actual
                    Case XmlNodeType.Element 'si es una etiqueta (elemento)
                        ' solo coge los de apertura, no los de cierre
                        text = New String(" ", lector.Depth * 3) + "<" + lector.Name + ">" + vbCrLf
                        listContenido.Items.Add(text)

                            'depth nos da la profundidad (0 - +)
                    Case XmlNodeType.Text 'si es un texto entre etiquetas
                        text = New String(" ", 9) + lector.Value + vbCrLf
                        listContenido.Items.Add(text)
                    Case XmlNodeType.EndElement 'si es etiqueta de cierre
                        text = New String(" ", lector.Depth * 3) + "</" + lector.Name + ">" + vbCrLf
                        listContenido.Items.Add(text)
                End Select
            End While

        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        Finally
            If Not lector Is Nothing Then
                lector.Close()
            End If
        End Try
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Try
            listContenido.Items.Clear()
            'documento xml
            Dim documento As XmlDocument = New XmlDocument()
            'Dim nodo As XmlNode

            '2 de los datos de un nodo
            Dim titulo As String
            Dim precio As Decimal

            'Recuperamos el documento
            documento.Load("Libros.xml")

            'recogemos todos los nodos hijos en el nodo principal
            For Each nodo As XmlNode In documento.DocumentElement.ChildNodes
                'si el nodo es un libro
                If nodo.Name = "Libros" Then
                    'extraemos titulo y precio
                    titulo = nodo.ChildNodes(2).InnerText
                    precio = nodo.ChildNodes(5).InnerText
                    'añadimos al list
                    Dim str = New String(String.Format("{0, -50} {1,5} -> {2,5}", titulo, precio, precio * 1.1))
                    listContenido.Items.Add(str)
                    'subimos el precio un 10%
                    precio = precio * 1.1
                    'lo asignamos al nodo
                    nodo.ChildNodes(5).InnerText = precio
                End If
            Next
            'guardarlo en el documento
            documento.Save("Libros.xml")

        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Try
            listContenido.Items.Clear()
            'creamos documento
            Dim documento As New XmlDocument()
            'cargamos documento
            documento.Load("Libros2.xml")
            'creamos navegador xpath
            Dim navegador As XPathNavigator = documento.CreateNavigator()

            'seleccionamos los datos obtenidos en un iterador
            Dim resultado As XPathNodeIterator
            resultado = navegador.Select("/Libros/Libro[Editorial=1]/TItulo")

            While resultado.MoveNext
                listContenido.Items.Add(resultado.Current.Value)
            End While

        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Try
            'creamos el XslTransform
            Dim transformador = New XslTransform()

            'recuperamos plantilla xslt
            transformador.Load("TablaHTML.xslt")

            'aplicamos transformacion
            transformador.Transform("Libros2.xml", "resultado.html")

            Process.Start("resultado.html")
        Catch ex As Exception
            MsgBox("No se pudo completar proceso", MsgBoxStyle.Critical)
        End Try
    End Sub
End Class
