namespace Coffee
{
    partial class Posted_Debts
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
            DevExpress.XtraGrid.GridLevelNode gridLevelNode1 = new DevExpress.XtraGrid.GridLevelNode();
            DevExpress.XtraGrid.GridFormatRule gridFormatRule1 = new DevExpress.XtraGrid.GridFormatRule();
            DevExpress.XtraEditors.FormatConditionRuleValue formatConditionRuleValue1 = new DevExpress.XtraEditors.FormatConditionRuleValue();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Posted_Debts));
            this.gridView3 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colItem_description = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colQuantity = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colAmount = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colLine_total = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colSent1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colBalance = new DevExpress.XtraGrid.Columns.GridColumn();
            this.storeGridControl = new DevExpress.XtraGrid.GridControl();
            this.stores_headerBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colDate = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colEntry = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colClient = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colClient_name = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colTotal = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colPosted = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colPaymode_Name = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCredit_Amount = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colAmount_Paid = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colSent = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colServed_By = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCollector_No = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colCollector = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colMpesa_No = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colMpesa_Code = new DevExpress.XtraGrid.Columns.GridColumn();
            this.repositoryItemImageComboBox1 = new DevExpress.XtraEditors.Repository.RepositoryItemImageComboBox();
            this.gridView2 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.storeBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.itemBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.farmerBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cellcontext = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.filterWithThisValueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reverseThisReceiptToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ribbonControl1 = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.btnprint = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem1 = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            ((System.ComponentModel.ISupportInitialize)(this.gridView3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.storeGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.stores_headerBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemImageComboBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.storeBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.farmerBindingSource)).BeginInit();
            this.cellcontext.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).BeginInit();
            this.SuspendLayout();
            // 
            // gridView3
            // 
            this.gridView3.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colItem_description,
            this.colQuantity,
            this.colAmount,
            this.colLine_total,
            this.colSent1,
            this.colBalance});
            this.gridView3.DetailHeight = 284;
            this.gridView3.GridControl = this.storeGridControl;
            this.gridView3.Name = "gridView3";
            this.gridView3.OptionsBehavior.Editable = false;
            // 
            // colItem_description
            // 
            this.colItem_description.FieldName = "Item_description";
            this.colItem_description.MinWidth = 19;
            this.colItem_description.Name = "colItem_description";
            this.colItem_description.Visible = true;
            this.colItem_description.VisibleIndex = 0;
            this.colItem_description.Width = 70;
            // 
            // colQuantity
            // 
            this.colQuantity.FieldName = "Quantity";
            this.colQuantity.MinWidth = 19;
            this.colQuantity.Name = "colQuantity";
            this.colQuantity.Visible = true;
            this.colQuantity.VisibleIndex = 1;
            this.colQuantity.Width = 70;
            // 
            // colAmount
            // 
            this.colAmount.FieldName = "Amount";
            this.colAmount.MinWidth = 19;
            this.colAmount.Name = "colAmount";
            this.colAmount.Visible = true;
            this.colAmount.VisibleIndex = 2;
            this.colAmount.Width = 70;
            // 
            // colLine_total
            // 
            this.colLine_total.FieldName = "Line_total";
            this.colLine_total.MinWidth = 19;
            this.colLine_total.Name = "colLine_total";
            this.colLine_total.Visible = true;
            this.colLine_total.VisibleIndex = 3;
            this.colLine_total.Width = 70;
            // 
            // colSent1
            // 
            this.colSent1.FieldName = "Sent";
            this.colSent1.MinWidth = 19;
            this.colSent1.Name = "colSent1";
            this.colSent1.Visible = true;
            this.colSent1.VisibleIndex = 4;
            this.colSent1.Width = 70;
            // 
            // colBalance
            // 
            this.colBalance.FieldName = "Balance";
            this.colBalance.MinWidth = 19;
            this.colBalance.Name = "colBalance";
            this.colBalance.Visible = true;
            this.colBalance.VisibleIndex = 5;
            this.colBalance.Width = 70;
            // 
            // storeGridControl
            // 
            this.storeGridControl.DataSource = this.stores_headerBindingSource;
            this.storeGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            gridLevelNode1.LevelTemplate = this.gridView3;
            gridLevelNode1.RelationName = "Store_lines";
            this.storeGridControl.LevelTree.Nodes.AddRange(new DevExpress.XtraGrid.GridLevelNode[] {
            gridLevelNode1});
            this.storeGridControl.Location = new System.Drawing.Point(0, 150);
            this.storeGridControl.MainView = this.gridView1;
            this.storeGridControl.Name = "storeGridControl";
            this.storeGridControl.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.repositoryItemImageComboBox1});
            this.storeGridControl.Size = new System.Drawing.Size(946, 368);
            this.storeGridControl.TabIndex = 1;
            this.storeGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1,
            this.gridView2,
            this.gridView3});
            this.storeGridControl.Click += new System.EventHandler(this.storeGridControl_Click_1);
            this.storeGridControl.DoubleClick += new System.EventHandler(this.storeGridControl_DoubleClick);
            // 
            // stores_headerBindingSource
            // 
            this.stores_headerBindingSource.DataSource = typeof(Coffee.Stores_header);
            // 
            // gridView1
            // 
            this.gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colDate,
            this.colEntry,
            this.colClient,
            this.colClient_name,
            this.colTotal,
            this.colPosted,
            this.colPaymode_Name,
            this.colCredit_Amount,
            this.colAmount_Paid,
            this.colSent,
            this.colServed_By,
            this.colCollector_No,
            this.colCollector,
            this.colMpesa_No,
            this.colMpesa_Code});
            gridFormatRule1.ApplyToRow = true;
            gridFormatRule1.Name = "Format0";
            formatConditionRuleValue1.Appearance.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Strikeout);
            formatConditionRuleValue1.Appearance.ForeColor = System.Drawing.Color.Red;
            formatConditionRuleValue1.Appearance.Options.UseFont = true;
            formatConditionRuleValue1.Appearance.Options.UseForeColor = true;
            formatConditionRuleValue1.Condition = DevExpress.XtraEditors.FormatCondition.Equal;
            formatConditionRuleValue1.Value1 = "Reversed";
            gridFormatRule1.Rule = formatConditionRuleValue1;
            this.gridView1.FormatRules.Add(gridFormatRule1);
            this.gridView1.GridControl = this.storeGridControl;
            this.gridView1.Name = "gridView1";
            this.gridView1.OptionsBehavior.Editable = false;
            this.gridView1.OptionsFind.AlwaysVisible = true;
            this.gridView1.OptionsView.ShowFooter = true;
            this.gridView1.SelectionChanged += new DevExpress.Data.SelectionChangedEventHandler(this.gridView1_SelectionChanged);
            this.gridView1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.gridView1_MouseDown);
            this.gridView1.DoubleClick += new System.EventHandler(this.gridView1_DoubleClick);
            // 
            // colDate
            // 
            this.colDate.FieldName = "Date";
            this.colDate.MinWidth = 19;
            this.colDate.Name = "colDate";
            this.colDate.Visible = true;
            this.colDate.VisibleIndex = 0;
            this.colDate.Width = 70;
            // 
            // colEntry
            // 
            this.colEntry.Caption = "Receipt No";
            this.colEntry.FieldName = "Entry";
            this.colEntry.MinWidth = 19;
            this.colEntry.Name = "colEntry";
            this.colEntry.Visible = true;
            this.colEntry.VisibleIndex = 1;
            this.colEntry.Width = 70;
            // 
            // colClient
            // 
            this.colClient.Caption = "Member No";
            this.colClient.FieldName = "Client";
            this.colClient.MinWidth = 19;
            this.colClient.Name = "colClient";
            this.colClient.Visible = true;
            this.colClient.VisibleIndex = 2;
            this.colClient.Width = 70;
            // 
            // colClient_name
            // 
            this.colClient_name.Caption = "Member Name";
            this.colClient_name.FieldName = "Client_name";
            this.colClient_name.MinWidth = 19;
            this.colClient_name.Name = "colClient_name";
            this.colClient_name.Visible = true;
            this.colClient_name.VisibleIndex = 3;
            this.colClient_name.Width = 70;
            // 
            // colTotal
            // 
            this.colTotal.FieldName = "Total";
            this.colTotal.MinWidth = 19;
            this.colTotal.Name = "colTotal";
            this.colTotal.Visible = true;
            this.colTotal.VisibleIndex = 4;
            this.colTotal.Width = 70;
            // 
            // colPosted
            // 
            this.colPosted.FieldName = "Posted";
            this.colPosted.MinWidth = 19;
            this.colPosted.Name = "colPosted";
            this.colPosted.Visible = true;
            this.colPosted.VisibleIndex = 5;
            this.colPosted.Width = 70;
            // 
            // colPaymode_Name
            // 
            this.colPaymode_Name.Caption = "Payment Mode";
            this.colPaymode_Name.FieldName = "Paymode_Name";
            this.colPaymode_Name.MinWidth = 19;
            this.colPaymode_Name.Name = "colPaymode_Name";
            this.colPaymode_Name.Visible = true;
            this.colPaymode_Name.VisibleIndex = 6;
            this.colPaymode_Name.Width = 70;
            // 
            // colCredit_Amount
            // 
            this.colCredit_Amount.Caption = "Credit Amount";
            this.colCredit_Amount.FieldName = "Credit_Amount";
            this.colCredit_Amount.MinWidth = 19;
            this.colCredit_Amount.Name = "colCredit_Amount";
            this.colCredit_Amount.Visible = true;
            this.colCredit_Amount.VisibleIndex = 7;
            this.colCredit_Amount.Width = 70;
            // 
            // colAmount_Paid
            // 
            this.colAmount_Paid.Caption = "Amount Paid";
            this.colAmount_Paid.FieldName = "Amount_Paid";
            this.colAmount_Paid.MinWidth = 19;
            this.colAmount_Paid.Name = "colAmount_Paid";
            this.colAmount_Paid.Visible = true;
            this.colAmount_Paid.VisibleIndex = 8;
            this.colAmount_Paid.Width = 70;
            // 
            // colSent
            // 
            this.colSent.FieldName = "Sent";
            this.colSent.MinWidth = 19;
            this.colSent.Name = "colSent";
            this.colSent.Visible = true;
            this.colSent.VisibleIndex = 9;
            this.colSent.Width = 70;
            // 
            // colServed_By
            // 
            this.colServed_By.FieldName = "Served_By";
            this.colServed_By.MinWidth = 19;
            this.colServed_By.Name = "colServed_By";
            this.colServed_By.Visible = true;
            this.colServed_By.VisibleIndex = 10;
            this.colServed_By.Width = 70;
            // 
            // colCollector_No
            // 
            this.colCollector_No.Caption = "Collector Id";
            this.colCollector_No.FieldName = "Collector_No";
            this.colCollector_No.MinWidth = 19;
            this.colCollector_No.Name = "colCollector_No";
            this.colCollector_No.Visible = true;
            this.colCollector_No.VisibleIndex = 11;
            this.colCollector_No.Width = 70;
            // 
            // colCollector
            // 
            this.colCollector.Caption = "Collector Name";
            this.colCollector.FieldName = "Collector";
            this.colCollector.MinWidth = 19;
            this.colCollector.Name = "colCollector";
            this.colCollector.Visible = true;
            this.colCollector.VisibleIndex = 12;
            this.colCollector.Width = 70;
            // 
            // colMpesa_No
            // 
            this.colMpesa_No.Caption = "Mpesa No";
            this.colMpesa_No.FieldName = "Mpesa_No";
            this.colMpesa_No.MinWidth = 19;
            this.colMpesa_No.Name = "colMpesa_No";
            this.colMpesa_No.Visible = true;
            this.colMpesa_No.VisibleIndex = 13;
            this.colMpesa_No.Width = 70;
            // 
            // colMpesa_Code
            // 
            this.colMpesa_Code.Caption = "Mpesa Code";
            this.colMpesa_Code.FieldName = "Mpesa_Code";
            this.colMpesa_Code.MinWidth = 19;
            this.colMpesa_Code.Name = "colMpesa_Code";
            this.colMpesa_Code.Visible = true;
            this.colMpesa_Code.VisibleIndex = 14;
            this.colMpesa_Code.Width = 70;
            // 
            // repositoryItemImageComboBox1
            // 
            this.repositoryItemImageComboBox1.AutoHeight = false;
            this.repositoryItemImageComboBox1.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.repositoryItemImageComboBox1.Name = "repositoryItemImageComboBox1";
            // 
            // gridView2
            // 
            this.gridView2.DetailHeight = 284;
            this.gridView2.GridControl = this.storeGridControl;
            this.gridView2.Name = "gridView2";
            // 
            // storeBindingSource
            // 
            this.storeBindingSource.DataSource = typeof(Coffee.Store);
            // 
            // itemBindingSource
            // 
            this.itemBindingSource.DataSource = typeof(Coffee.Item);
            // 
            // farmerBindingSource
            // 
            this.farmerBindingSource.DataSource = typeof(Coffee.Farmer);
            // 
            // cellcontext
            // 
            this.cellcontext.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cellcontext.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.filterWithThisValueToolStripMenuItem,
            this.reverseThisReceiptToolStripMenuItem});
            this.cellcontext.Name = "cellcontext";
            this.cellcontext.Size = new System.Drawing.Size(180, 48);
            this.cellcontext.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.cellcontext_ItemClicked);
            // 
            // filterWithThisValueToolStripMenuItem
            // 
            this.filterWithThisValueToolStripMenuItem.Name = "filterWithThisValueToolStripMenuItem";
            this.filterWithThisValueToolStripMenuItem.Size = new System.Drawing.Size(179, 22);
            this.filterWithThisValueToolStripMenuItem.Text = "Filter with this value";
            // 
            // reverseThisReceiptToolStripMenuItem
            // 
            this.reverseThisReceiptToolStripMenuItem.Name = "reverseThisReceiptToolStripMenuItem";
            this.reverseThisReceiptToolStripMenuItem.Size = new System.Drawing.Size(179, 22);
            this.reverseThisReceiptToolStripMenuItem.Text = "Reverse this Receipt";
            this.reverseThisReceiptToolStripMenuItem.Click += new System.EventHandler(this.reverseThisReceiptToolStripMenuItem_Click);
            // 
            // ribbonControl1
            // 
            this.ribbonControl1.EmptyAreaImageOptions.ImagePadding = new System.Windows.Forms.Padding(22, 24, 22, 24);
            this.ribbonControl1.ExpandCollapseItem.Id = 0;
            this.ribbonControl1.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbonControl1.ExpandCollapseItem,
            this.ribbonControl1.SearchEditItem,
            this.btnprint,
            this.barButtonItem1});
            this.ribbonControl1.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl1.MaxItemId = 3;
            this.ribbonControl1.Name = "ribbonControl1";
            this.ribbonControl1.OptionsMenuMinWidth = 247;
            this.ribbonControl1.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1});
            this.ribbonControl1.Size = new System.Drawing.Size(946, 150);
            // 
            // btnprint
            // 
            this.btnprint.Caption = "Print";
            this.btnprint.Id = 1;
            this.btnprint.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnprint.ImageOptions.Image")));
            this.btnprint.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnprint.ImageOptions.LargeImage")));
            this.btnprint.Name = "btnprint";
            this.btnprint.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnprint_ItemClick);
            // 
            // barButtonItem1
            // 
            this.barButtonItem1.Caption = "&Cancel";
            this.barButtonItem1.Id = 2;
            this.barButtonItem1.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("barButtonItem1.ImageOptions.Image")));
            this.barButtonItem1.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("barButtonItem1.ImageOptions.LargeImage")));
            this.barButtonItem1.Name = "barButtonItem1";
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1});
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Actions";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.ItemLinks.Add(this.btnprint);
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.Text = "Edit";
            // 
            // Posted_Debts
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(946, 518);
            this.Controls.Add(this.storeGridControl);
            this.Controls.Add(this.ribbonControl1);
            this.Name = "Posted_Debts";
            this.Text = "Posted Debts";
            this.Activated += new System.EventHandler(this.Posted_Debts_Activated);
            this.Load += new System.EventHandler(this.Posted_Debts_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridView3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.storeGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.stores_headerBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemImageComboBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.storeBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.farmerBindingSource)).EndInit();
            this.cellcontext.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.BindingSource storeBindingSource;
        private DevExpress.XtraGrid.GridControl storeGridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private System.Windows.Forms.BindingSource farmerBindingSource;
        private System.Windows.Forms.BindingSource itemBindingSource;
        private System.Windows.Forms.ContextMenuStrip cellcontext;
        private System.Windows.Forms.ToolStripMenuItem filterWithThisValueToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reverseThisReceiptToolStripMenuItem;
        private System.Windows.Forms.BindingSource stores_headerBindingSource;
        private DevExpress.XtraGrid.Columns.GridColumn colDate;
        private DevExpress.XtraGrid.Columns.GridColumn colEntry;
        private DevExpress.XtraGrid.Columns.GridColumn colClient;
        private DevExpress.XtraGrid.Columns.GridColumn colClient_name;
        private DevExpress.XtraGrid.Columns.GridColumn colTotal;
        private DevExpress.XtraGrid.Columns.GridColumn colPosted;
        private DevExpress.XtraEditors.Repository.RepositoryItemImageComboBox repositoryItemImageComboBox1;
        private DevExpress.XtraGrid.Columns.GridColumn colPaymode_Name;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView2;
        private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl1;
        private DevExpress.XtraBars.BarButtonItem btnprint;
        private DevExpress.XtraBars.BarButtonItem barButtonItem1;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraGrid.Columns.GridColumn colCredit_Amount;
        private DevExpress.XtraGrid.Columns.GridColumn colAmount_Paid;
        private DevExpress.XtraGrid.Columns.GridColumn colSent;
        private DevExpress.XtraGrid.Columns.GridColumn colServed_By;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView3;
        private DevExpress.XtraGrid.Columns.GridColumn colItem_description;
        private DevExpress.XtraGrid.Columns.GridColumn colQuantity;
        private DevExpress.XtraGrid.Columns.GridColumn colAmount;
        private DevExpress.XtraGrid.Columns.GridColumn colLine_total;
        private DevExpress.XtraGrid.Columns.GridColumn colSent1;
        private DevExpress.XtraGrid.Columns.GridColumn colBalance;
        private DevExpress.XtraGrid.Columns.GridColumn colCollector_No;
        private DevExpress.XtraGrid.Columns.GridColumn colCollector;
        private DevExpress.XtraGrid.Columns.GridColumn colMpesa_No;
        private DevExpress.XtraGrid.Columns.GridColumn colMpesa_Code;
    }
}