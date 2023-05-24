<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class formulario
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
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
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.titulo1 = New System.Windows.Forms.Label()
        Me.titulo2 = New System.Windows.Forms.Label()
        Me.texto = New System.Windows.Forms.TextBox()
        Me.botonguardar = New System.Windows.Forms.Button()
        Me.botonabrir = New System.Windows.Forms.Button()
        Me.abrirarchivo = New System.Windows.Forms.OpenFileDialog()
        Me.guardararchivo = New System.Windows.Forms.SaveFileDialog()
        Me.SuspendLayout()
        '
        'titulo1
        '
        Me.titulo1.AutoSize = True
        Me.titulo1.Cursor = System.Windows.Forms.Cursors.IBeam
        Me.titulo1.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.titulo1.Location = New System.Drawing.Point(29, 9)
        Me.titulo1.Name = "titulo1"
        Me.titulo1.Size = New System.Drawing.Size(370, 17)
        Me.titulo1.TabIndex = 0
        Me.titulo1.Text = "Guardar y abrir archivo de texto con los controles"
        '
        'titulo2
        '
        Me.titulo2.AutoSize = True
        Me.titulo2.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.titulo2.Location = New System.Drawing.Point(78, 41)
        Me.titulo2.Name = "titulo2"
        Me.titulo2.Size = New System.Drawing.Size(245, 17)
        Me.titulo2.TabIndex = 1
        Me.titulo2.Text = "SaveFileDialog y OpenFileDialog"
        '
        'texto
        '
        Me.texto.Location = New System.Drawing.Point(11, 82)
        Me.texto.Multiline = True
        Me.texto.Name = "texto"
        Me.texto.Size = New System.Drawing.Size(396, 183)
        Me.texto.TabIndex = 2
        '
        'botonguardar
        '
        Me.botonguardar.Location = New System.Drawing.Point(32, 284)
        Me.botonguardar.Name = "botonguardar"
        Me.botonguardar.Size = New System.Drawing.Size(184, 23)
        Me.botonguardar.TabIndex = 3
        Me.botonguardar.Text = "Guardar archivo de texto"
        Me.botonguardar.UseVisualStyleBackColor = True
        '
        'botonabrir
        '
        Me.botonabrir.Location = New System.Drawing.Point(222, 284)
        Me.botonabrir.Name = "botonabrir"
        Me.botonabrir.Size = New System.Drawing.Size(165, 23)
        Me.botonabrir.TabIndex = 4
        Me.botonabrir.Text = "Abrir archivo de texto"
        Me.botonabrir.UseVisualStyleBackColor = True
        '
        'abrirarchivo
        '
        Me.abrirarchivo.FileName = "OpenFileDialog1"
        '
        'formulario
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(424, 322)
        Me.Controls.Add(Me.botonabrir)
        Me.Controls.Add(Me.botonguardar)
        Me.Controls.Add(Me.texto)
        Me.Controls.Add(Me.titulo2)
        Me.Controls.Add(Me.titulo1)
        Me.Name = "formulario"
        Me.Text = "Controles SaveFileDialog y OpenFileDialog"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents titulo1 As Label
    Friend WithEvents titulo2 As Label
    Friend WithEvents texto As TextBox
    Friend WithEvents botonguardar As Button
    Friend WithEvents botonabrir As Button
    Friend WithEvents abrirarchivo As OpenFileDialog
    Friend WithEvents guardararchivo As SaveFileDialog
End Class
