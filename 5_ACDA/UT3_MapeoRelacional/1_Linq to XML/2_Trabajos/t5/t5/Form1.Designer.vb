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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.txtRuta = New System.Windows.Forms.TextBox()
        Me.btnUbicacion = New System.Windows.Forms.Button()
        Me.listArchivos = New System.Windows.Forms.ListBox()
        Me.txtContenido = New System.Windows.Forms.TextBox()
        Me.btnSalir = New System.Windows.Forms.Button()
        Me.FolderBrowserDialog1 = New System.Windows.Forms.FolderBrowserDialog()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(12, 25)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Ubicación"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(12, 70)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Archivos"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(216, 70)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(100, 13)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Documento XML"
        '
        'txtRuta
        '
        Me.txtRuta.Location = New System.Drawing.Point(95, 25)
        Me.txtRuta.Name = "txtRuta"
        Me.txtRuta.Size = New System.Drawing.Size(403, 20)
        Me.txtRuta.TabIndex = 3
        '
        'btnUbicacion
        '
        Me.btnUbicacion.Location = New System.Drawing.Point(523, 23)
        Me.btnUbicacion.Name = "btnUbicacion"
        Me.btnUbicacion.Size = New System.Drawing.Size(145, 23)
        Me.btnUbicacion.TabIndex = 4
        Me.btnUbicacion.Text = "Seleccionar ubicación"
        Me.btnUbicacion.UseVisualStyleBackColor = True
        '
        'listArchivos
        '
        Me.listArchivos.FormattingEnabled = True
        Me.listArchivos.Location = New System.Drawing.Point(17, 93)
        Me.listArchivos.Name = "listArchivos"
        Me.listArchivos.Size = New System.Drawing.Size(164, 290)
        Me.listArchivos.TabIndex = 5
        '
        'txtContenido
        '
        Me.txtContenido.Location = New System.Drawing.Point(219, 94)
        Me.txtContenido.Multiline = True
        Me.txtContenido.Name = "txtContenido"
        Me.txtContenido.Size = New System.Drawing.Size(448, 288)
        Me.txtContenido.TabIndex = 6
        '
        'btnSalir
        '
        Me.btnSalir.Location = New System.Drawing.Point(523, 396)
        Me.btnSalir.Name = "btnSalir"
        Me.btnSalir.Size = New System.Drawing.Size(145, 23)
        Me.btnSalir.TabIndex = 7
        Me.btnSalir.Text = "Salir"
        Me.btnSalir.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(698, 431)
        Me.Controls.Add(Me.btnSalir)
        Me.Controls.Add(Me.txtContenido)
        Me.Controls.Add(Me.listArchivos)
        Me.Controls.Add(Me.btnUbicacion)
        Me.Controls.Add(Me.txtRuta)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents txtRuta As TextBox
    Friend WithEvents btnUbicacion As Button
    Friend WithEvents listArchivos As ListBox
    Friend WithEvents txtContenido As TextBox
    Friend WithEvents btnSalir As Button
    Friend WithEvents FolderBrowserDialog1 As FolderBrowserDialog
End Class
