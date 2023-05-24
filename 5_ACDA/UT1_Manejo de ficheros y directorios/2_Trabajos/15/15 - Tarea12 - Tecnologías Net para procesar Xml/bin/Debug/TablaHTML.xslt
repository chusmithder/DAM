<?xml version='1.0' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>
        <table>
          <xsl:for-each select="Libros/Libro">
            <tr>
              <td>
                <xsl:value-of select="TItulo" />
              </td>
              <td>
                <xsl:value-of select="Precio" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
