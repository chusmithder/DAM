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
        Me.texto = New System.Windows.Forms.TextBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'texto
        '
        Me.texto.Location = New System.Drawing.Point(82, 52)
        Me.texto.Name = "texto"
        Me.texto.Size = New System.Drawing.Size(186, 20)
        Me.texto.TabIndex = 0
        Me.texto.Text = "fichero a leer"
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(124, 98)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(124, 66)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Leer linea a linea hasta el final del fichero"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'formulario
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(389, 211)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.texto)
        Me.Name = "formulario"
        Me.Text = "Tarea3"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents texto As TextBox
    Friend WithEvents Button1 As Button
End Class
