namespace Coffee
{
    partial class Allcollections
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Allcollections));
            DevExpress.XtraGrid.GridFormatRule gridFormatRule1 = new DevExpress.XtraGrid.GridFormatRule();
            DevExpress.XtraEditors.FormatConditionRuleValue formatConditionRuleValue1 = new DevExpress.XtraEditors.FormatConditionRuleValue();
            this.colCancelled = new DevExpress.XtraGrid.Columns.GridColumn();
            this.bindingNavigator1 = new System.Windows.Forms.BindingNavigator(this.components);
            this.daily_Collections_DetailsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bindingNavigatorCountItem = new System.Windows.Forms.ToolStripLabel();
            this.bindingNavigatorMoveFirstItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMovePreviousItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorPositionItem = new System.Windows.Forms.ToolStripTextBox();
            this.bindingNavigatorSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorMoveNextItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveLastItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.gridControl1 = new DevExpress.XtraGrid.GridControl();
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colCollections_Date = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCollection_time = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colFarmers_Number = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colFarmers_Name = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCollection_Number = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCoffee_Type = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colNo_ = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colKg__Collected = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colPaid = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colID_Number = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colFactory = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colSent = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colComments = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCumm = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colUser = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCan = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCollect_type = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCrop = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colGross = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colNo_of_Bags = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colTare = new DevExpress.XtraGrid.Columns.GridColumn();
            this.cellcontext = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.filterWithThisValueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.collectEntryToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.bindingNavigator1)).BeginInit();
            this.bindingNavigator1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.daily_Collections_DetailsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            this.cellcontext.SuspendLayout();
            this.SuspendLayout();
            // 
            // colCancelled
            // 
            this.colCancelled.FieldName = "Cancelled";
            this.colCancelled.MinWidth = 27;
            this.colCancelled.Name = "colCancelled";
            this.colCancelled.Width = 100;
            // 
            // bindingNavigator1
            // 
            this.bindingNavigator1.AddNewItem = null;
            this.bindingNavigator1.BindingSource = this.daily_Collections_DetailsBindingSource;
            this.bindingNavigator1.CountItem = this.bindingNavigatorCountItem;
            this.bindingNavigator1.DeleteItem = null;
            this.bindingNavigator1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.bindingNavigator1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.bindingNavigator1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bindingNavigatorMoveFirstItem,
            this.bindingNavigatorMovePreviousItem,
            this.bindingNavigatorSeparator,
            this.bindingNavigatorPositionItem,
            this.bindingNavigatorCountItem,
            this.bindingNavigatorSeparator1,
            this.bindingNavigatorMoveNextItem,
            this.bindingNavigatorMoveLastItem,
            this.bindingNavigatorSeparator2,
            this.toolStripButton1});
            this.bindingNavigator1.Location = new System.Drawing.Point(0, 475);
            this.bindingNavigator1.MoveFirstItem = this.bindingNavigatorMoveFirstItem;
            this.bindingNavigator1.MoveLastItem = this.bindingNavigatorMoveLastItem;
            this.bindingNavigator1.MoveNextItem = this.bindingNavigatorMoveNextItem;
            this.bindingNavigator1.MovePreviousItem = this.bindingNavigatorMovePreviousItem;
            this.bindingNavigator1.Name = "bindingNavigator1";
            this.bindingNavigator1.PositionItem = this.bindingNavigatorPositionItem;
            this.bindingNavigator1.Size = new System.Drawing.Size(1013, 27);
            this.bindingNavigator1.TabIndex = 1;
            this.bindingNavigator1.Text = "bindingNavigator1";
            this.bindingNavigator1.Visible = false;
            // 
            // daily_Collections_DetailsBindingSource
            // 
            this.daily_Collections_DetailsBindingSource.DataSource = typeof(Coffee.Daily_Collections_Detail);
            // 
            // bindingNavigatorCountItem
            // 
            this.bindingNavigatorCountItem.Name = "bindingNavigatorCountItem";
            this.bindingNavigatorCountItem.Size = new System.Drawing.Size(45, 24);
            this.bindingNavigatorCountItem.Text = "of {0}";
            this.bindingNavigatorCountItem.ToolTipText = "Total number of items";
            // 
            // bindingNavigatorMoveFirstItem
            // 
            this.bindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveFirstItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveFirstItem.Image")));
            this.bindingNavigatorMoveFirstItem.Name = "bindingNavigatorMoveFirstItem";
            this.bindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveFirstItem.Size = new System.Drawing.Size(29, 24);
            this.bindingNavigatorMoveFirstItem.Text = "Move first";
            // 
            // bindingNavigatorMovePreviousItem
            // 
            this.bindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMovePreviousItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMovePreviousItem.Image")));
            this.bindingNavigatorMovePreviousItem.Name = "bindingNavigatorMovePreviousItem";
            this.bindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMovePreviousItem.Size = new System.Drawing.Size(29, 24);
            this.bindingNavigatorMovePreviousItem.Text = "Move previous";
            // 
            // bindingNavigatorSeparator
            // 
            this.bindingNavigatorSeparator.Name = "bindingNavigatorSeparator";
            this.bindingNavigatorSeparator.Size = new System.Drawing.Size(6, 27);
            // 
            // bindingNavigatorPositionItem
            // 
            this.bindingNavigatorPositionItem.AccessibleName = "Position";
            this.bindingNavigatorPositionItem.AutoSize = false;
            this.bindingNavigatorPositionItem.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.bindingNavigatorPositionItem.Name = "bindingNavigatorPositionItem";
            this.bindingNavigatorPositionItem.Size = new System.Drawing.Size(65, 27);
            this.bindingNavigatorPositionItem.Text = "0";
            this.bindingNavigatorPositionItem.ToolTipText = "Current position";
            // 
            // bindingNavigatorSeparator1
            // 
            this.bindingNavigatorSeparator1.Name = "bindingNavigatorSeparator1";
            this.bindingNavigatorSeparator1.Size = new System.Drawing.Size(6, 27);
            // 
            // bindingNavigatorMoveNextItem
            // 
            this.bindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveNextItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveNextItem.Image")));
            this.bindingNavigatorMoveNextItem.Name = "bindingNavigatorMoveNextItem";
            this.bindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveNextItem.Size = new System.Drawing.Size(29, 24);
            this.bindingNavigatorMoveNextItem.Text = "Move next";
            // 
            // bindingNavigatorMoveLastItem
            // 
            this.bindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveLastItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveLastItem.Image")));
            this.bindingNavigatorMoveLastItem.Name = "bindingNavigatorMoveLastItem";
            this.bindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveLastItem.Size = new System.Drawing.Size(29, 24);
            this.bindingNavigatorMoveLastItem.Text = "Move last";
            // 
            // bindingNavigatorSeparator2
            // 
            this.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2";
            this.bindingNavigatorSeparator2.Size = new System.Drawing.Size(6, 27);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.Image = global::Coffee.Properties.Resources.excel;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(132, 24);
            this.toolStripButton1.Text = "Export to excel";
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // gridControl1
            // 
            this.gridControl1.DataSource = this.daily_Collections_DetailsBindingSource;
            this.gridControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControl1.EmbeddedNavigator.Margin = new System.Windows.Forms.Padding(4);
            this.gridControl1.Location = new System.Drawing.Point(0, 0);
            this.gridControl1.MainView = this.gridView1;
            this.gridControl1.Margin = new System.Windows.Forms.Padding(4);
            this.gridControl1.Name = "gridControl1";
            this.gridControl1.Size = new System.Drawing.Size(1013, 502);
            this.gridControl1.TabIndex = 2;
            this.gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            this.gridControl1.Click += new System.EventHandler(this.gridControl1_Click);
            // 
            // gridView1
            // 
            this.gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colCollections_Date,
            this.colCollection_time,
            this.colFarmers_Number,
            this.colFarmers_Name,
            this.colCollection_Number,
            this.colCoffee_Type,
            this.colNo_,
            this.colKg__Collected,
            this.colCancelled,
            this.colPaid,
            this.colID_Number,
            this.colFactory,
            this.colSent,
            this.colComments,
            this.colCumm,
            this.colUser,
            this.colCan,
            this.colCollect_type,
            this.colCrop,
            this.colGross,
            this.colNo_of_Bags,
            this.colTare});
            this.gridView1.DetailHeight = 431;
            gridFormatRule1.ApplyToRow = true;
            gridFormatRule1.Column = this.colCancelled;
            gridFormatRule1.Name = "Format0";
            formatConditionRuleValue1.Appearance.Font = new System.Drawing.Font("Tahoma", 8.25F, ((System.Drawing.FontStyle)(((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic) 
                | System.Drawing.FontStyle.Strikeout))));
            formatConditionRuleValue1.Appearance.ForeColor = System.Drawing.Color.Red;
            formatConditionRuleValue1.Appearance.Options.UseFont = true;
            formatConditionRuleValue1.Appearance.Options.UseForeColor = true;
            formatConditionRuleValue1.Condition = DevExpress.XtraEditors.FormatCondition.Equal;
            formatConditionRuleValue1.Value1 = "Yes";
            gridFormatRule1.Rule = formatConditionRuleValue1;
            this.gridView1.FormatRules.Add(gridFormatRule1);
            this.gridView1.GridControl = this.gridControl1;
            this.gridView1.GroupSummary.AddRange(new DevExpress.XtraGrid.GridSummaryItem[] {
            new DevExpress.XtraGrid.GridGroupSummaryItem(DevExpress.Data.SummaryItemType.Sum, "Kg__Collected", null, "")});
            this.gridView1.Name = "gridView1";
            this.gridView1.OptionsBehavior.Editable = false;
            this.gridView1.OptionsClipboard.AllowCopy = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.AllowCsvFormat = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.AllowExcelFormat = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.AllowHtmlFormat = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.AllowRtfFormat = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.AllowTxtFormat = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsClipboard.ClipboardMode = DevExpress.Export.ClipboardMode.Formatted;
            this.gridView1.OptionsClipboard.CopyColumnHeaders = DevExpress.Utils.DefaultBoolean.True;
            this.gridView1.OptionsCustomization.CustomizationFormSearchBoxVisible = true;
            this.gridView1.OptionsDetail.AutoZoomDetail = true;
            this.gridView1.OptionsFind.AlwaysVisible = true;
            this.gridView1.OptionsMenu.ShowConditionalFormattingItem = true;
            this.gridView1.OptionsPrint.PrintDetails = true;
            this.gridView1.OptionsPrint.PrintFilterInfo = true;
            this.gridView1.OptionsPrint.PrintPreview = true;
            this.gridView1.OptionsSelection.MultiSelect = true;
            this.gridView1.OptionsView.ShowFooter = true;
            this.gridView1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.gridView1_MouseDown);
            // 
            // colCollections_Date
            // 
            this.colCollections_Date.Caption = "Date";
            this.colCollections_Date.DisplayFormat.FormatString = "D";
            this.colCollections_Date.DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime;
            this.colCollections_Date.FieldName = "Collections_Date";
            this.colCollections_Date.MinWidth = 27;
            this.colCollections_Date.Name = "colCollections_Date";
            this.colCollections_Date.Visible = true;
            this.colCollections_Date.VisibleIndex = 0;
            this.colCollections_Date.Width = 80;
            // 
            // colCollection_time
            // 
            this.colCollection_time.Caption = "Time";
            this.colCollection_time.DisplayFormat.FormatString = "t";
            this.colCollection_time.DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime;
            this.colCollection_time.FieldName = "Collection_time";
            this.colCollection_time.MinWidth = 27;
            this.colCollection_time.Name = "colCollection_time";
            this.colCollection_time.Visible = true;
            this.colCollection_time.VisibleIndex = 1;
            this.colCollection_time.Width = 48;
            // 
            // colFarmers_Number
            // 
            this.colFarmers_Number.Caption = "Farmer No.";
            this.colFarmers_Number.FieldName = "Farmers_Number";
            this.colFarmers_Number.MinWidth = 27;
            this.colFarmers_Number.Name = "colFarmers_Number";
            this.colFarmers_Number.Visible = true;
            this.colFarmers_Number.VisibleIndex = 3;
            this.colFarmers_Number.Width = 45;
            // 
            // colFarmers_Name
            // 
            this.colFarmers_Name.Caption = "Name";
            this.colFarmers_Name.FieldName = "Farmers_Name";
            this.colFarmers_Name.MinWidth = 27;
            this.colFarmers_Name.Name = "colFarmers_Name";
            this.colFarmers_Name.Visible = true;
            this.colFarmers_Name.VisibleIndex = 4;
            this.colFarmers_Name.Width = 69;
            // 
            // colCollection_Number
            // 
            this.colCollection_Number.Caption = "Reference";
            this.colCollection_Number.FieldName = "Collection_Number";
            this.colCollection_Number.MinWidth = 27;
            this.colCollection_Number.Name = "colCollection_Number";
            this.colCollection_Number.Visible = true;
            this.colCollection_Number.VisibleIndex = 2;
            this.colCollection_Number.Width = 80;
            // 
            // colCoffee_Type
            // 
            this.colCoffee_Type.Caption = "Coffee Type";
            this.colCoffee_Type.FieldName = "Coffe_Type_Name";
            this.colCoffee_Type.MinWidth = 27;
            this.colCoffee_Type.Name = "colCoffee_Type";
            this.colCoffee_Type.Visible = true;
            this.colCoffee_Type.VisibleIndex = 9;
            this.colCoffee_Type.Width = 87;
            // 
            // colNo_
            // 
            this.colNo_.FieldName = "No_";
            this.colNo_.MinWidth = 27;
            this.colNo_.Name = "colNo_";
            this.colNo_.Width = 100;
            // 
            // colKg__Collected
            // 
            this.colKg__Collected.Caption = "Net";
            this.colKg__Collected.FieldName = "Kg__Collected";
            this.colKg__Collected.MinWidth = 27;
            this.colKg__Collected.Name = "colKg__Collected";
            this.colKg__Collected.Summary.AddRange(new DevExpress.XtraGrid.GridSummaryItem[] {
            new DevExpress.XtraGrid.GridColumnSummaryItem(DevExpress.Data.SummaryItemType.Sum, "Kg__Collected", "SUM={0:0.##}")});
            this.colKg__Collected.Visible = true;
            this.colKg__Collected.VisibleIndex = 8;
            this.colKg__Collected.Width = 57;
            // 
            // colPaid
            // 
            this.colPaid.FieldName = "Paid";
            this.colPaid.MinWidth = 27;
            this.colPaid.Name = "colPaid";
            this.colPaid.Width = 100;
            // 
            // colID_Number
            // 
            this.colID_Number.FieldName = "ID_Number";
            this.colID_Number.MinWidth = 27;
            this.colID_Number.Name = "colID_Number";
            this.colID_Number.Width = 100;
            // 
            // colFactory
            // 
            this.colFactory.FieldName = "Factory";
            this.colFactory.MinWidth = 27;
            this.colFactory.Name = "colFactory";
            this.colFactory.Visible = true;
            this.colFactory.VisibleIndex = 10;
            this.colFactory.Width = 57;
            // 
            // colSent
            // 
            this.colSent.FieldName = "Sent";
            this.colSent.MinWidth = 27;
            this.colSent.Name = "colSent";
            this.colSent.Visible = true;
            this.colSent.VisibleIndex = 11;
            this.colSent.Width = 27;
            // 
            // colComments
            // 
            this.colComments.FieldName = "Comments";
            this.colComments.MinWidth = 27;
            this.colComments.Name = "colComments";
            this.colComments.Visible = true;
            this.colComments.VisibleIndex = 12;
            this.colComments.Width = 55;
            // 
            // colCumm
            // 
            this.colCumm.FieldName = "Cumm";
            this.colCumm.MinWidth = 27;
            this.colCumm.Name = "colCumm";
            this.colCumm.Width = 100;
            // 
            // colUser
            // 
            this.colUser.FieldName = "User";
            this.colUser.MinWidth = 27;
            this.colUser.Name = "colUser";
            this.colUser.Visible = true;
            this.colUser.VisibleIndex = 13;
            this.colUser.Width = 73;
            // 
            // colCan
            // 
            this.colCan.FieldName = "Can";
            this.colCan.MinWidth = 27;
            this.colCan.Name = "colCan";
            this.colCan.Width = 100;
            // 
            // colCollect_type
            // 
            this.colCollect_type.Caption = "Collect type";
            this.colCollect_type.FieldName = "Collect_type";
            this.colCollect_type.MinWidth = 27;
            this.colCollect_type.Name = "colCollect_type";
            this.colCollect_type.Visible = true;
            this.colCollect_type.VisibleIndex = 14;
            this.colCollect_type.Width = 49;
            // 
            // colCrop
            // 
            this.colCrop.FieldName = "Crop";
            this.colCrop.MinWidth = 27;
            this.colCrop.Name = "colCrop";
            this.colCrop.Visible = true;
            this.colCrop.VisibleIndex = 15;
            this.colCrop.Width = 78;
            // 
            // colGross
            // 
            this.colGross.FieldName = "Gross";
            this.colGross.MinWidth = 25;
            this.colGross.Name = "colGross";
            this.colGross.Visible = true;
            this.colGross.VisibleIndex = 6;
            this.colGross.Width = 61;
            // 
            // colNo_of_Bags
            // 
            this.colNo_of_Bags.Caption = "Bags";
            this.colNo_of_Bags.FieldName = "No_of_Bags";
            this.colNo_of_Bags.MinWidth = 25;
            this.colNo_of_Bags.Name = "colNo_of_Bags";
            this.colNo_of_Bags.Visible = true;
            this.colNo_of_Bags.VisibleIndex = 5;
            this.colNo_of_Bags.Width = 64;
            // 
            // colTare
            // 
            this.colTare.FieldName = "Tare";
            this.colTare.MinWidth = 25;
            this.colTare.Name = "colTare";
            this.colTare.Visible = true;
            this.colTare.VisibleIndex = 7;
            this.colTare.Width = 63;
            // 
            // cellcontext
            // 
            this.cellcontext.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cellcontext.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.filterWithThisValueToolStripMenuItem,
            this.collectEntryToolStripMenuItem});
            this.cellcontext.Name = "cellcontext";
            this.cellcontext.Size = new System.Drawing.Size(210, 52);
            this.cellcontext.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.cellcontext_ItemClicked);
            // 
            // filterWithThisValueToolStripMenuItem
            // 
            this.filterWithThisValueToolStripMenuItem.Name = "filterWithThisValueToolStripMenuItem";
            this.filterWithThisValueToolStripMenuItem.Size = new System.Drawing.Size(209, 24);
            this.filterWithThisValueToolStripMenuItem.Text = "Filter with this value";
            // 
            // collectEntryToolStripMenuItem
            // 
            this.collectEntryToolStripMenuItem.Name = "collectEntryToolStripMenuItem";
            this.collectEntryToolStripMenuItem.Size = new System.Drawing.Size(209, 24);
            this.collectEntryToolStripMenuItem.Text = "Collect Entry";
            this.collectEntryToolStripMenuItem.Visible = false;
            this.collectEntryToolStripMenuItem.Click += new System.EventHandler(this.collectEntryToolStripMenuItem_Click);
            // 
            // Allcollections
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1013, 502);
            this.Controls.Add(this.gridControl1);
            this.Controls.Add(this.bindingNavigator1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Allcollections";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "Collections";
            this.Activated += new System.EventHandler(this.Allcollections_Activated);
            this.Load += new System.EventHandler(this.Allcollections_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bindingNavigator1)).EndInit();
            this.bindingNavigator1.ResumeLayout(false);
            this.bindingNavigator1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.daily_Collections_DetailsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            this.cellcontext.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.BindingSource daily_Collections_DetailsBindingSource;
        private System.Windows.Forms.BindingNavigator bindingNavigator1;
        private System.Windows.Forms.ToolStripLabel bindingNavigatorCountItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveFirstItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMovePreviousItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator;
        private System.Windows.Forms.ToolStripTextBox bindingNavigatorPositionItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveNextItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveLastItem;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator2;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn colFarmers_Number;
        private DevExpress.XtraGrid.Columns.GridColumn colCollections_Date;
        private DevExpress.XtraGrid.Columns.GridColumn colCollection_Number;
        private DevExpress.XtraGrid.Columns.GridColumn colCoffee_Type;
        private DevExpress.XtraGrid.Columns.GridColumn colNo_;
        private DevExpress.XtraGrid.Columns.GridColumn colFarmers_Name;
        private DevExpress.XtraGrid.Columns.GridColumn colKg__Collected;
        private DevExpress.XtraGrid.Columns.GridColumn colCancelled;
        private DevExpress.XtraGrid.Columns.GridColumn colPaid;
        private DevExpress.XtraGrid.Columns.GridColumn colID_Number;
        private DevExpress.XtraGrid.Columns.GridColumn colFactory;
        private DevExpress.XtraGrid.Columns.GridColumn colSent;
        private DevExpress.XtraGrid.Columns.GridColumn colComments;
        private DevExpress.XtraGrid.Columns.GridColumn colCumm;
        private DevExpress.XtraGrid.Columns.GridColumn colUser;
        private DevExpress.XtraGrid.Columns.GridColumn colCan;
        private DevExpress.XtraGrid.Columns.GridColumn colCollection_time;
        private DevExpress.XtraGrid.Columns.GridColumn colCollect_type;
        private DevExpress.XtraGrid.Columns.GridColumn colCrop;
        private System.Windows.Forms.ContextMenuStrip cellcontext;
        private System.Windows.Forms.ToolStripMenuItem filterWithThisValueToolStripMenuItem;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripMenuItem collectEntryToolStripMenuItem;
        private DevExpress.XtraGrid.Columns.GridColumn colGross;
        private DevExpress.XtraGrid.Columns.GridColumn colNo_of_Bags;
        private DevExpress.XtraGrid.Columns.GridColumn colTare;
    }
}