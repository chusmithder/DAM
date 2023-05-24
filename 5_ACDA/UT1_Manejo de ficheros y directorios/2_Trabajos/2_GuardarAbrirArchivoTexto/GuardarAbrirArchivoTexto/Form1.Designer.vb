<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class formulario
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.titulo = New System.Windows.Forms.Label()
        Me.texto = New System.Windows.Forms.TextBox()
        Me.botonguardar = New System.Windows.Forms.Button()
        Me.botonabrir = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'titulo
        '
        Me.titulo.AutoSize = True
        Me.titulo.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.titulo.Location = New System.Drawing.Point(72, 9)
        Me.titulo.Name = "titulo"
        Me.titulo.Size = New System.Drawing.Size(269, 17)
        Me.titulo.TabIndex = 0
        Me.titulo.Text = "Guardar y abrir un archivo de Texto"
        '
        'texto
        '
        Me.texto.Location = New System.Drawing.Point(12, 41)
        Me.texto.Multiline = True
        Me.texto.Name = "texto"
        Me.texto.Size = New System.Drawing.Size(377, 211)
        Me.texto.TabIndex = 1
        '
        'botonguardar
        '
        Me.botonguardar.Location = New System.Drawing.Point(21, 276)
        Me.botonguardar.Name = "botonguardar"
        Me.botonguardar.Size = New System.Drawing.Size(175, 23)
        Me.botonguardar.TabIndex = 2
        Me.botonguardar.Text = "Guardar archivo de texto"
        Me.botonguardar.UseVisualStyleBackColor = True
        '
        'botonabrir
        '
        Me.botonabrir.Location = New System.Drawing.Point(219, 276)
        Me.botonabrir.Name = "botonabrir"
        Me.botonabrir.Size = New System.Drawing.Size(170, 23)
        Me.botonabrir.TabIndex = 3
        Me.botonabrir.Text = "Abrir archivo de texto "
        Me.botonabrir.UseVisualStyleBackColor = True
        '
        'formulario
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(417, 315)
        Me.Controls.Add(Me.botonabrir)
        Me.Controls.Add(Me.botonguardar)
        Me.Controls.Add(Me.texto)
        Me.Controls.Add(Me.titulo)
        Me.Name = "formulario"
        Me.Text = "Guardar y abrir archivos de texto"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents titulo As Label
    Friend WithEvents texto As TextBox
    Friend WithEvents botonguardar As Button
    Friend WithEvents botonabrir As Button
End Class
