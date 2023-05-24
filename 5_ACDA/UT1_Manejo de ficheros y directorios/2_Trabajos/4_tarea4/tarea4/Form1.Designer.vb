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
        Me.btncrear = New System.Windows.Forms.Button()
        Me.btnleer = New System.Windows.Forms.Button()
        Me.btnagregar = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'btncrear
        '
        Me.btncrear.Location = New System.Drawing.Point(86, 22)
        Me.btncrear.Name = "btncrear"
        Me.btncrear.Size = New System.Drawing.Size(149, 23)
        Me.btncrear.TabIndex = 0
        Me.btncrear.Text = "Crear Archivo"
        Me.btncrear.UseVisualStyleBackColor = True
        '
        'btnleer
        '
        Me.btnleer.Location = New System.Drawing.Point(86, 71)
        Me.btnleer.Name = "btnleer"
        Me.btnleer.Size = New System.Drawing.Size(149, 51)
        Me.btnleer.TabIndex = 1
        Me.btnleer.Text = "Leer una a una dos lineas. El resto en una sola operacion"
        Me.btnleer.UseVisualStyleBackColor = True
        '
        'btnagregar
        '
        Me.btnagregar.Location = New System.Drawing.Point(86, 145)
        Me.btnagregar.Name = "btnagregar"
        Me.btnagregar.Size = New System.Drawing.Size(149, 52)
        Me.btnagregar.TabIndex = 2
        Me.btnagregar.Text = "Agregar texto a un archivo existente"
        Me.btnagregar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(356, 225)
        Me.Controls.Add(Me.btnagregar)
        Me.Controls.Add(Me.btnleer)
        Me.Controls.Add(Me.btncrear)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents btncrear As Button
    Friend WithEvents btnleer As Button
    Friend WithEvents btnagregar As Button
End Class
