<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Código que se ejecuta al iniciarse la aplicación
        'Inicializar contadores
        Application("AplicacionesActivas") = 0
        Application("SesionesActivas") = 0

        'Incrementar contador de evento
        Application("AplicacionesActivas") = CInt(Application("AplicacionesActivas")) + 1
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Código que se ejecuta al cerrarse la aplicación
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Código que se ejecuta al producirse un error no controlado
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Código que se ejecuta cuando se inicia una nueva sesión

        'Incrementamos contador de evento
        Application("SesionesActivas") = CInt(Application("SesionesActivas")) + 1

        'Una vez en una sesión, enviamos mensaje de texto al navegador:
        Response.Write("<p>Eventos de la aplicación: " + Application("AplicacionesActivas").ToString + "<br/>Sesiones activas: " + Application("SesionesActivas").ToString + "</p>")

        'Session("total") = 0
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Código que se ejecuta cuando finaliza una sesión. 
        ' Nota: el evento Session_End se desencadena sólo cuando el modo sessionstate
        ' se establece como InProc en el archivo Web.config. Si el modo de sesión se establece como StateServer 
        ' o SQLServer, el evento no se genera.

        'la sesión ha expirado
        Application("SesionesActivas") = CInt(Application("SesionesActivas")) - 1
    End Sub

</script>