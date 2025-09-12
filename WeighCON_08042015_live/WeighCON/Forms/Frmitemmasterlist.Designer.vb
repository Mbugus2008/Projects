<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frmitemmasterlist
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
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

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Frmitemmasterlist))
        Me.ITEMMASTERBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.ITEMMASTERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.WEIGHCONDataSet = New PrintPro.weighconDataSet()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.ITEMMASTERBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.ITEMMASTERDataGridView = New System.Windows.Forms.DataGridView()
        Me.ToolStripContainer1 = New System.Windows.Forms.ToolStripContainer()
        Me.ITEMMASTERTableAdapter = New PrintPro.weighconDataSetTableAdapters.ITEMMASTERTableAdapter()
        Me.TableAdapterManager = New PrintPro.weighconDataSetTableAdapters.TableAdapterManager()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NewBarCode = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ProductionOrderNo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Fixed = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.Weight = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.ITEMMASTERBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ITEMMASTERBindingNavigator.SuspendLayout()
        CType(Me.ITEMMASTERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.WEIGHCONDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ITEMMASTERDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ToolStripContainer1.BottomToolStripPanel.SuspendLayout()
        Me.ToolStripContainer1.ContentPanel.SuspendLayout()
        Me.ToolStripContainer1.SuspendLayout()
        Me.SuspendLayout()
        '
        'ITEMMASTERBindingNavigator
        '
        Me.ITEMMASTERBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.ITEMMASTERBindingNavigator.BindingSource = Me.ITEMMASTERBindingSource
        Me.ITEMMASTERBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.ITEMMASTERBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.ITEMMASTERBindingNavigator.Dock = System.Windows.Forms.DockStyle.None
        Me.ITEMMASTERBindingNavigator.ImageScalingSize = New System.Drawing.Size(24, 24)
        Me.ITEMMASTERBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorAddNewItem, Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorDeleteItem, Me.ITEMMASTERBindingNavigatorSaveItem})
        Me.ITEMMASTERBindingNavigator.Location = New System.Drawing.Point(4, 0)
        Me.ITEMMASTERBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.ITEMMASTERBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.ITEMMASTERBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.ITEMMASTERBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.ITEMMASTERBindingNavigator.Name = "ITEMMASTERBindingNavigator"
        Me.ITEMMASTERBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.ITEMMASTERBindingNavigator.Size = New System.Drawing.Size(525, 31)
        Me.ITEMMASTERBindingNavigator.TabIndex = 0
        Me.ITEMMASTERBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.Image = Global.PrintPro.My.Resources.Resources.add2
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(96, 28)
        Me.BindingNavigatorAddNewItem.Text = "Add new"
        '
        'ITEMMASTERBindingSource
        '
        Me.ITEMMASTERBindingSource.DataMember = "ITEMMASTER"
        Me.ITEMMASTERBindingSource.DataSource = Me.WEIGHCONDataSet
        '
        'WEIGHCONDataSet
        '
        Me.WEIGHCONDataSet.DataSetName = "WEIGHCONDataSet"
        Me.WEIGHCONDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(45, 28)
        Me.BindingNavigatorCountItem.Text = "of {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.Image = Global.PrintPro.My.Resources.Resources.delete
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(81, 28)
        Me.BindingNavigatorDeleteItem.Text = "Delete"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = Global.PrintPro.My.Resources.Resources.media_beginning
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(29, 28)
        Me.BindingNavigatorMoveFirstItem.Text = "Move first"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = Global.PrintPro.My.Resources.Resources.media_rewind
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(29, 28)
        Me.BindingNavigatorMovePreviousItem.Text = "Move previous"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 31)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Position"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Current position"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator1"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 31)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = Global.PrintPro.My.Resources.Resources.media_fast_forward
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(29, 28)
        Me.BindingNavigatorMoveNextItem.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = Global.PrintPro.My.Resources.Resources.media_end
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(29, 28)
        Me.BindingNavigatorMoveLastItem.Text = "Move last"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 31)
        '
        'ITEMMASTERBindingNavigatorSaveItem
        '
        Me.ITEMMASTERBindingNavigatorSaveItem.Image = Global.PrintPro.My.Resources.Resources.disk_blue_ok
        Me.ITEMMASTERBindingNavigatorSaveItem.Name = "ITEMMASTERBindingNavigatorSaveItem"
        Me.ITEMMASTERBindingNavigatorSaveItem.Size = New System.Drawing.Size(104, 28)
        Me.ITEMMASTERBindingNavigatorSaveItem.Text = "Save Data"
        '
        'ITEMMASTERDataGridView
        '
        Me.ITEMMASTERDataGridView.AutoGenerateColumns = False
        Me.ITEMMASTERDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill
        Me.ITEMMASTERDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.ITEMMASTERDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn3, Me.NewBarCode, Me.ProductionOrderNo, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.Fixed, Me.Weight})
        Me.ITEMMASTERDataGridView.DataSource = Me.ITEMMASTERBindingSource
        Me.ITEMMASTERDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.ITEMMASTERDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.ITEMMASTERDataGridView.Margin = New System.Windows.Forms.Padding(4)
        Me.ITEMMASTERDataGridView.Name = "ITEMMASTERDataGridView"
        Me.ITEMMASTERDataGridView.RowHeadersWidth = 51
        Me.ITEMMASTERDataGridView.Size = New System.Drawing.Size(992, 493)
        Me.ITEMMASTERDataGridView.TabIndex = 1
        '
        'ToolStripContainer1
        '
        '
        'ToolStripContainer1.BottomToolStripPanel
        '
        Me.ToolStripContainer1.BottomToolStripPanel.Controls.Add(Me.ITEMMASTERBindingNavigator)
        '
        'ToolStripContainer1.ContentPanel
        '
        Me.ToolStripContainer1.ContentPanel.Controls.Add(Me.ITEMMASTERDataGridView)
        Me.ToolStripContainer1.ContentPanel.Margin = New System.Windows.Forms.Padding(4)
        Me.ToolStripContainer1.ContentPanel.Size = New System.Drawing.Size(992, 493)
        Me.ToolStripContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.ToolStripContainer1.LeftToolStripPanelVisible = False
        Me.ToolStripContainer1.Location = New System.Drawing.Point(0, 0)
        Me.ToolStripContainer1.Margin = New System.Windows.Forms.Padding(4)
        Me.ToolStripContainer1.Name = "ToolStripContainer1"
        Me.ToolStripContainer1.RightToolStripPanelVisible = False
        Me.ToolStripContainer1.Size = New System.Drawing.Size(992, 524)
        Me.ToolStripContainer1.TabIndex = 2
        Me.ToolStripContainer1.Text = "ToolStripContainer1"
        Me.ToolStripContainer1.TopToolStripPanelVisible = False
        '
        'ITEMMASTERTableAdapter
        '
        Me.ITEMMASTERTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.GroupsTableAdapter = Nothing
        Me.TableAdapterManager.ITEMLOGTableAdapter = Nothing
        Me.TableAdapterManager.ITEMMASTERTableAdapter = Me.ITEMMASTERTableAdapter
        Me.TableAdapterManager.UpdateOrder = PrintPro.weighconDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        Me.TableAdapterManager.USERSTableAdapter = Nothing
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Item_Code"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Item Code"
        Me.DataGridViewTextBoxColumn3.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'NewBarCode
        '
        Me.NewBarCode.DataPropertyName = "NewBarCode"
        Me.NewBarCode.HeaderText = "NewBarCode"
        Me.NewBarCode.MinimumWidth = 6
        Me.NewBarCode.Name = "NewBarCode"
        '
        'ProductionOrderNo
        '
        Me.ProductionOrderNo.DataPropertyName = "ProductionOrderNo"
        Me.ProductionOrderNo.HeaderText = "ProductionOrderNo"
        Me.ProductionOrderNo.MinimumWidth = 6
        Me.ProductionOrderNo.Name = "ProductionOrderNo"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "Description"
        Me.DataGridViewTextBoxColumn5.HeaderText = "Description"
        Me.DataGridViewTextBoxColumn5.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "Theoretical_Mass"
        Me.DataGridViewTextBoxColumn6.HeaderText = "Theoretical Mass"
        Me.DataGridViewTextBoxColumn6.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "UOM"
        Me.DataGridViewTextBoxColumn7.HeaderText = "UOM"
        Me.DataGridViewTextBoxColumn7.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "Permitted_Tol_Upper_%"
        Me.DataGridViewTextBoxColumn8.HeaderText = "Permitted Tol Upper %"
        Me.DataGridViewTextBoxColumn8.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Permitted_Tol_Lower_%"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Permitted Tol Lower %"
        Me.DataGridViewTextBoxColumn9.MinimumWidth = 6
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        '
        'Fixed
        '
        Me.Fixed.DataPropertyName = "Fixed"
        Me.Fixed.HeaderText = "Fixed"
        Me.Fixed.MinimumWidth = 6
        Me.Fixed.Name = "Fixed"
        '
        'Weight
        '
        Me.Weight.DataPropertyName = "Weight"
        Me.Weight.HeaderText = "Weight"
        Me.Weight.MinimumWidth = 6
        Me.Weight.Name = "Weight"
        '
        'Frmitemmasterlist
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(992, 524)
        Me.Controls.Add(Me.ToolStripContainer1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "Frmitemmasterlist"
        Me.Text = "Items Master"
        CType(Me.ITEMMASTERBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ITEMMASTERBindingNavigator.ResumeLayout(False)
        Me.ITEMMASTERBindingNavigator.PerformLayout()
        CType(Me.ITEMMASTERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.WEIGHCONDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ITEMMASTERDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ToolStripContainer1.BottomToolStripPanel.ResumeLayout(False)
        Me.ToolStripContainer1.BottomToolStripPanel.PerformLayout()
        Me.ToolStripContainer1.ContentPanel.ResumeLayout(False)
        Me.ToolStripContainer1.ResumeLayout(False)
        Me.ToolStripContainer1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents WEIGHCONDataSet As PrintPro.WEIGHCONDataSet
    Friend WithEvents ITEMMASTERBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ITEMMASTERTableAdapter As PrintPro.WEIGHCONDataSetTableAdapters.ITEMMASTERTableAdapter
    Friend WithEvents TableAdapterManager As PrintPro.WEIGHCONDataSetTableAdapters.TableAdapterManager
    Friend WithEvents ITEMMASTERBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ITEMMASTERBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents ITEMMASTERDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents ToolStripContainer1 As System.Windows.Forms.ToolStripContainer
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents NewBarCode As DataGridViewTextBoxColumn
    Friend WithEvents ProductionOrderNo As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As DataGridViewTextBoxColumn
    Friend WithEvents Fixed As DataGridViewCheckBoxColumn
    Friend WithEvents Weight As DataGridViewTextBoxColumn
End Class
