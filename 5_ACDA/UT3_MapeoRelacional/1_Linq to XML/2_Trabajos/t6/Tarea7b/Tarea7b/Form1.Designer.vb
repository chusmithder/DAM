<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
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
        Me.texto = New System.Windows.Forms.TextBox()
        Me.btneliminar = New System.Windows.Forms.Button()
        Me.btneliminar2 = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'texto
        '
        Me.texto.Location = New System.Drawing.Point(50, 31)
        Me.texto.Multiline = True
        Me.texto.Name = "texto"
        Me.texto.ReadOnly = True
        Me.texto.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.texto.Size = New System.Drawing.Size(405, 286)
        Me.texto.TabIndex = 0
        '
        'btneliminar
        '
        Me.btneliminar.Location = New System.Drawing.Point(92, 323)
        Me.btneliminar.Name = "btneliminar"
        Me.btneliminar.Size = New System.Drawing.Size(146, 32)
        Me.btneliminar.TabIndex = 1
        Me.btneliminar.Text = "Eliminar nombre"
        Me.btneliminar.UseVisualStyleBackColor = True
        '
        'btneliminar2
        '
        Me.btneliminar2.Location = New System.Drawing.Point(259, 323)
        Me.btneliminar2.Name = "btneliminar2"
        Me.btneliminar2.Size = New System.Drawing.Size(162, 32)
        Me.btneliminar2.TabIndex = 2
        Me.btneliminar2.Text = "Eliminar atributo soloLectura"
        Me.btneliminar2.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(505, 367)
        Me.Controls.Add(Me.btneliminar2)
        Me.Controls.Add(Me.btneliminar)
        Me.Controls.Add(Me.texto)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents texto As TextBox
    Friend WithEvents btneliminar As Button
    Friend WithEvents btneliminar2 As Button
End Class
