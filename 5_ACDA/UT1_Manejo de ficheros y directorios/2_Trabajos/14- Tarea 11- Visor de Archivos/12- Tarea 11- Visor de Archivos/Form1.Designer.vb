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
        Me.comboUnidades = New System.Windows.Forms.ComboBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.listaCarpetas = New System.Windows.Forms.ListBox()
        Me.listaArchivos = New System.Windows.Forms.ListBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtContenido = New System.Windows.Forms.TextBox()
        Me.btnGuardar = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'comboUnidades
        '
        Me.comboUnidades.FormattingEnabled = True
        Me.comboUnidades.Location = New System.Drawing.Point(20, 38)
        Me.comboUnidades.Name = "comboUnidades"
        Me.comboUnidades.Size = New System.Drawing.Size(215, 21)
        Me.comboUnidades.TabIndex = 0
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(17, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(116, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Seleccione una unidad"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(17, 85)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(120, 13)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Seleccione una carpeta"
        '
        'listaCarpetas
        '
        Me.listaCarpetas.FormattingEnabled = True
        Me.listaCarpetas.Location = New System.Drawing.Point(21, 119)
        Me.listaCarpetas.Name = "listaCarpetas"
        Me.listaCarpetas.Size = New System.Drawing.Size(214, 108)
        Me.listaCarpetas.TabIndex = 3
        '
        'listaArchivos
        '
        Me.listaArchivos.FormattingEnabled = True
        Me.listaArchivos.Location = New System.Drawing.Point(279, 38)
        Me.listaArchivos.Name = "listaArchivos"
        Me.listaArchivos.Size = New System.Drawing.Size(310, 186)
        Me.listaArchivos.TabIndex = 4
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(276, 9)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(119, 13)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "Seleccione una archivo"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(18, 250)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(110, 13)
        Me.Label4.TabIndex = 6
        Me.Label4.Text = "Contenido del archivo"
        '
        'txtContenido
        '
        Me.txtContenido.Location = New System.Drawing.Point(20, 290)
        Me.txtContenido.Multiline = True
        Me.txtContenido.Name = "txtContenido"
        Me.txtContenido.Size = New System.Drawing.Size(569, 148)
        Me.txtContenido.TabIndex = 7
        '
        'btnGuardar
        '
        Me.btnGuardar.Location = New System.Drawing.Point(514, 453)
        Me.btnGuardar.Name = "btnGuardar"
        Me.btnGuardar.Size = New System.Drawing.Size(75, 23)
        Me.btnGuardar.TabIndex = 8
        Me.btnGuardar.Text = "Guardar"
        Me.btnGuardar.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(640, 488)
        Me.Controls.Add(Me.btnGuardar)
        Me.Controls.Add(Me.txtContenido)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.listaArchivos)
        Me.Controls.Add(Me.listaCarpetas)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.comboUnidades)
        Me.Name = "Form1"
        Me.Text = "Visor de archivos de texto"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents comboUnidades As ComboBox
    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents listaCarpetas As ListBox
    Friend WithEvents listaArchivos As ListBox
    Friend WithEvents Label3 As Label
    Friend WithEvents Label4 As Label
    Friend WithEvents txtContenido As TextBox
    Friend WithEvents btnGuardar As Button
End Class
