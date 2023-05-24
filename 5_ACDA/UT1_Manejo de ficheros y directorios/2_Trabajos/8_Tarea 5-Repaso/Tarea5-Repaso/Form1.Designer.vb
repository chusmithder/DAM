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
        Me.txbNombre = New System.Windows.Forms.TextBox()
        Me.txbDNI = New System.Windows.Forms.TextBox()
        Me.dni = New System.Windows.Forms.Label()
        Me.btnAnadir = New System.Windows.Forms.Button()
        Me.btnMostrar = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(27, 60)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(44, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Nombre"
        '
        'txbNombre
        '
        Me.txbNombre.Location = New System.Drawing.Point(30, 88)
        Me.txbNombre.Name = "txbNombre"
        Me.txbNombre.Size = New System.Drawing.Size(100, 20)
        Me.txbNombre.TabIndex = 1
        '
        'txbDNI
        '
        Me.txbDNI.Location = New System.Drawing.Point(192, 88)
        Me.txbDNI.Name = "txbDNI"
        Me.txbDNI.Size = New System.Drawing.Size(100, 20)
        Me.txbDNI.TabIndex = 3
        '
        'dni
        '
        Me.dni.AutoSize = True
        Me.dni.Location = New System.Drawing.Point(189, 60)
        Me.dni.Name = "dni"
        Me.dni.Size = New System.Drawing.Size(26, 13)
        Me.dni.TabIndex = 2
        Me.dni.Text = "DNI"
        '
        'btnAnadir
        '
        Me.btnAnadir.Location = New System.Drawing.Point(67, 124)
        Me.btnAnadir.Name = "btnAnadir"
        Me.btnAnadir.Size = New System.Drawing.Size(180, 61)
        Me.btnAnadir.TabIndex = 4
        Me.btnAnadir.Text = "Añadir SOCIO"
        Me.btnAnadir.UseVisualStyleBackColor = True
        '
        'btnMostrar
        '
        Me.btnMostrar.Location = New System.Drawing.Point(94, 206)
        Me.btnMostrar.Name = "btnMostrar"
        Me.btnMostrar.Size = New System.Drawing.Size(130, 23)
        Me.btnMostrar.TabIndex = 5
        Me.btnMostrar.Text = "Mostrar Contenido"
        Me.btnMostrar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(329, 241)
        Me.Controls.Add(Me.btnMostrar)
        Me.Controls.Add(Me.btnAnadir)
        Me.Controls.Add(Me.txbDNI)
        Me.Controls.Add(Me.dni)
        Me.Controls.Add(Me.txbNombre)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Protected Friend WithEvents txbNombre As TextBox
    Protected Friend WithEvents txbDNI As TextBox
    Friend WithEvents dni As Label
    Friend WithEvents btnAnadir As Button
    Friend WithEvents btnMostrar As Button
End Class
