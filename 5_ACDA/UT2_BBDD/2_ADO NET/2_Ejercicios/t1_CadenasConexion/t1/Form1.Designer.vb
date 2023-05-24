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
        Me.components = New System.ComponentModel.Container()
        Me.btnConectar = New System.Windows.Forms.Button()
        Me.btnE2 = New System.Windows.Forms.Button()
        Me.btnE3 = New System.Windows.Forms.Button()
        Me.btnE4 = New System.Windows.Forms.Button()
        Me.btnE5 = New System.Windows.Forms.Button()
        Me.btnE6 = New System.Windows.Forms.Button()
        Me.DataSet1BindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataSet1 = New t1.DataSet1()
        Me.btnE7 = New System.Windows.Forms.Button()
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        CType(Me.DataSet1BindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnConectar
        '
        Me.btnConectar.Location = New System.Drawing.Point(24, 22)
        Me.btnConectar.Name = "btnConectar"
        Me.btnConectar.Size = New System.Drawing.Size(114, 46)
        Me.btnConectar.TabIndex = 0
        Me.btnConectar.Text = "E1-Conectar mediante OLEDB"
        Me.btnConectar.UseVisualStyleBackColor = False
        '
        'btnE2
        '
        Me.btnE2.Location = New System.Drawing.Point(161, 22)
        Me.btnE2.Name = "btnE2"
        Me.btnE2.Size = New System.Drawing.Size(114, 46)
        Me.btnE2.TabIndex = 1
        Me.btnE2.Text = "E2-Conectar mediante ODBC"
        Me.btnE2.UseVisualStyleBackColor = False
        '
        'btnE3
        '
        Me.btnE3.Location = New System.Drawing.Point(299, 22)
        Me.btnE3.Name = "btnE3"
        Me.btnE3.Size = New System.Drawing.Size(114, 46)
        Me.btnE3.TabIndex = 2
        Me.btnE3.Text = "E3-Conectar ODBC - DSN archivo"
        Me.btnE3.UseVisualStyleBackColor = False
        '
        'btnE4
        '
        Me.btnE4.Location = New System.Drawing.Point(24, 83)
        Me.btnE4.Name = "btnE4"
        Me.btnE4.Size = New System.Drawing.Size(114, 46)
        Me.btnE4.TabIndex = 3
        Me.btnE4.Text = "E4-Conectar ODBC sin dsn"
        Me.btnE4.UseVisualStyleBackColor = False
        '
        'btnE5
        '
        Me.btnE5.Location = New System.Drawing.Point(161, 83)
        Me.btnE5.Name = "btnE5"
        Me.btnE5.Size = New System.Drawing.Size(114, 46)
        Me.btnE5.TabIndex = 4
        Me.btnE5.Text = "E5-Conectar dsn archivo dbf"
        Me.btnE5.UseVisualStyleBackColor = False
        '
        'btnE6
        '
        Me.btnE6.Location = New System.Drawing.Point(299, 83)
        Me.btnE6.Name = "btnE6"
        Me.btnE6.Size = New System.Drawing.Size(114, 46)
        Me.btnE6.TabIndex = 5
        Me.btnE6.Text = "E6-Conectar bd server oledb"
        Me.btnE6.UseVisualStyleBackColor = False
        '
        'DataSet1BindingSource
        '
        Me.DataSet1BindingSource.DataSource = Me.DataSet1
        Me.DataSet1BindingSource.Position = 0
        '
        'DataSet1
        '
        Me.DataSet1.DataSetName = "DataSet1"
        Me.DataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'btnE7
        '
        Me.btnE7.Location = New System.Drawing.Point(161, 151)
        Me.btnE7.Name = "btnE7"
        Me.btnE7.Size = New System.Drawing.Size(114, 66)
        Me.btnE7.TabIndex = 6
        Me.btnE7.Text = "E7-Conectar arhivo dsn en una carpeta compartida"
        Me.btnE7.UseVisualStyleBackColor = False
        '
        'DataGridView1
        '
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Location = New System.Drawing.Point(349, 179)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(240, 150)
        Me.DataGridView1.TabIndex = 7
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(517, 266)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.btnE7)
        Me.Controls.Add(Me.btnE6)
        Me.Controls.Add(Me.btnE5)
        Me.Controls.Add(Me.btnE4)
        Me.Controls.Add(Me.btnE3)
        Me.Controls.Add(Me.btnE2)
        Me.Controls.Add(Me.btnConectar)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.DataSet1BindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents btnConectar As Button
    Friend WithEvents btnE2 As Button
    Friend WithEvents btnE3 As Button
    Friend WithEvents btnE4 As Button
    Friend WithEvents btnE5 As Button
    Friend WithEvents btnE6 As Button
    Friend WithEvents DataSet1BindingSource As BindingSource
    Friend WithEvents DataSet1 As DataSet1
    Friend WithEvents btnE7 As Button
    Friend WithEvents DataGridView1 As DataGridView
End Class
