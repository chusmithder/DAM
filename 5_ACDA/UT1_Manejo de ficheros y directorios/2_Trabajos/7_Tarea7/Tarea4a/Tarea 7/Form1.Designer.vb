<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Texto = New System.Windows.Forms.TextBox()
        Me.btnLeer = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(26, 23)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(248, 17)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Introduce la ruta del archivo a mostrar"
        '
        'Texto
        '
        Me.Texto.Location = New System.Drawing.Point(29, 75)
        Me.Texto.Name = "Texto"
        Me.Texto.Size = New System.Drawing.Size(100, 22)
        Me.Texto.TabIndex = 1
        '
        'btnLeer
        '
        Me.btnLeer.Location = New System.Drawing.Point(29, 128)
        Me.btnLeer.Name = "btnLeer"
        Me.btnLeer.Size = New System.Drawing.Size(75, 23)
        Me.btnLeer.TabIndex = 2
        Me.btnLeer.Text = "Leer"
        Me.btnLeer.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(384, 200)
        Me.Controls.Add(Me.btnLeer)
        Me.Controls.Add(Me.Texto)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Texto As TextBox
    Friend WithEvents btnLeer As Button
End Class
