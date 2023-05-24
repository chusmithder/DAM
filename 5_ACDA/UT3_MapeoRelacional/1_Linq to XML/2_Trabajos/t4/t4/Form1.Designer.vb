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
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.txtContenido = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(25, 18)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(183, 61)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Crear actividades.xml (sin id)"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(245, 18)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(183, 61)
        Me.Button2.TabIndex = 1
        Me.Button2.Text = "Crear actividades2.xml (con id)"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'txtContenido
        '
        Me.txtContenido.Location = New System.Drawing.Point(25, 108)
        Me.txtContenido.Multiline = True
        Me.txtContenido.Name = "txtContenido"
        Me.txtContenido.Size = New System.Drawing.Size(402, 312)
        Me.txtContenido.TabIndex = 2
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(456, 450)
        Me.Controls.Add(Me.txtContenido)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Button1 As Button
    Friend WithEvents Button2 As Button
    Friend WithEvents txtContenido As TextBox
End Class
