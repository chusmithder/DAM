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
        Me.listNombre = New System.Windows.Forms.ListBox()
        Me.btnNombres = New System.Windows.Forms.Button()
        Me.listFiltro = New System.Windows.Forms.ListBox()
        Me.btnFiltro = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(124, 27)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(183, 17)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Linq-Tarea2-Consultar XML"
        '
        'listNombre
        '
        Me.listNombre.FormattingEnabled = True
        Me.listNombre.ItemHeight = 16
        Me.listNombre.Location = New System.Drawing.Point(12, 67)
        Me.listNombre.Name = "listNombre"
        Me.listNombre.Size = New System.Drawing.Size(250, 244)
        Me.listNombre.TabIndex = 1
        '
        'btnNombres
        '
        Me.btnNombres.Location = New System.Drawing.Point(23, 345)
        Me.btnNombres.Name = "btnNombres"
        Me.btnNombres.Size = New System.Drawing.Size(219, 49)
        Me.btnNombres.TabIndex = 3
        Me.btnNombres.Text = "Nombre de todos los contactos"
        Me.btnNombres.UseVisualStyleBackColor = True
        '
        'listFiltro
        '
        Me.listFiltro.FormattingEnabled = True
        Me.listFiltro.ItemHeight = 16
        Me.listFiltro.Location = New System.Drawing.Point(306, 67)
        Me.listFiltro.Name = "listFiltro"
        Me.listFiltro.Size = New System.Drawing.Size(250, 244)
        Me.listFiltro.TabIndex = 5
        '
        'btnFiltro
        '
        Me.btnFiltro.Location = New System.Drawing.Point(318, 345)
        Me.btnFiltro.Name = "btnFiltro"
        Me.btnFiltro.Size = New System.Drawing.Size(219, 49)
        Me.btnFiltro.TabIndex = 6
        Me.btnFiltro.Text = "Filtro de nombre y móvi (""L"")"
        Me.btnFiltro.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(590, 450)
        Me.Controls.Add(Me.btnFiltro)
        Me.Controls.Add(Me.listFiltro)
        Me.Controls.Add(Me.btnNombres)
        Me.Controls.Add(Me.listNombre)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents listNombre As ListBox
    Friend WithEvents btnNombres As Button
    Friend WithEvents listFiltro As ListBox
    Friend WithEvents btnFiltro As Button
End Class
