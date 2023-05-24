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
        Me.etiquetaver = New System.Windows.Forms.Label()
        Me.etiquetaadicion = New System.Windows.Forms.Label()
        Me.textoadicional = New System.Windows.Forms.TextBox()
        Me.Texto = New System.Windows.Forms.TextBox()
        Me.botonguardar = New System.Windows.Forms.Button()
        Me.botonabrir = New System.Windows.Forms.Button()
        Me.botonadicionar = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'etiquetaver
        '
        Me.etiquetaver.AutoSize = True
        Me.etiquetaver.Location = New System.Drawing.Point(53, 35)
        Me.etiquetaver.Name = "etiquetaver"
        Me.etiquetaver.Size = New System.Drawing.Size(184, 13)
        Me.etiquetaver.TabIndex = 0
        Me.etiquetaver.Text = "Texto del archivo de escritura/lectura"
        '
        'etiquetaadicion
        '
        Me.etiquetaadicion.AutoSize = True
        Me.etiquetaadicion.Location = New System.Drawing.Point(53, 218)
        Me.etiquetaadicion.Name = "etiquetaadicion"
        Me.etiquetaadicion.Size = New System.Drawing.Size(104, 13)
        Me.etiquetaadicion.TabIndex = 1
        Me.etiquetaadicion.Text = "Texto para adicionar"
        '
        'textoadicional
        '
        Me.textoadicional.Location = New System.Drawing.Point(56, 234)
        Me.textoadicional.Multiline = True
        Me.textoadicional.Name = "textoadicional"
        Me.textoadicional.Size = New System.Drawing.Size(409, 102)
        Me.textoadicional.TabIndex = 2
        '
        'Texto
        '
        Me.Texto.Location = New System.Drawing.Point(56, 75)
        Me.Texto.Multiline = True
        Me.Texto.Name = "Texto"
        Me.Texto.Size = New System.Drawing.Size(409, 109)
        Me.Texto.TabIndex = 3
        '
        'botonguardar
        '
        Me.botonguardar.Location = New System.Drawing.Point(56, 366)
        Me.botonguardar.Name = "botonguardar"
        Me.botonguardar.Size = New System.Drawing.Size(109, 23)
        Me.botonguardar.TabIndex = 4
        Me.botonguardar.Text = "Guardar en archivo"
        Me.botonguardar.UseVisualStyleBackColor = True
        '
        'botonabrir
        '
        Me.botonabrir.Location = New System.Drawing.Point(230, 366)
        Me.botonabrir.Name = "botonabrir"
        Me.botonabrir.Size = New System.Drawing.Size(75, 23)
        Me.botonabrir.TabIndex = 5
        Me.botonabrir.Text = "Abrir archivo"
        Me.botonabrir.UseVisualStyleBackColor = True
        '
        'botonadicionar
        '
        Me.botonadicionar.Location = New System.Drawing.Point(390, 366)
        Me.botonadicionar.Name = "botonadicionar"
        Me.botonadicionar.Size = New System.Drawing.Size(75, 23)
        Me.botonadicionar.TabIndex = 6
        Me.botonadicionar.Text = "Adicionar texto"
        Me.botonadicionar.UseVisualStyleBackColor = True
        '
        'formulario
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.botonadicionar)
        Me.Controls.Add(Me.botonabrir)
        Me.Controls.Add(Me.botonguardar)
        Me.Controls.Add(Me.Texto)
        Me.Controls.Add(Me.textoadicional)
        Me.Controls.Add(Me.etiquetaadicion)
        Me.Controls.Add(Me.etiquetaver)
        Me.Name = "formulario"
        Me.Text = "Guardar, leer y adicionar datos en archivo de texto"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents etiquetaver As Label
    Friend WithEvents etiquetaadicion As Label
    Friend WithEvents textoadicional As TextBox
    Friend WithEvents Texto As TextBox
    Friend WithEvents botonguardar As Button
    Friend WithEvents botonabrir As Button
    Friend WithEvents botonadicionar As Button
End Class
