namespace Coffee
{
    partial class Stores
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
            this.variantsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.itemsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colNo = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDescription = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colUnit_Price = new DevExpress.XtraGrid.Columns.GridColumn();
            this.Inventory_Balance = new DevExpress.XtraGrid.Columns.GridColumn();
            this.variantsGridControl = new DevExpress.XtraGrid.GridControl();
            this.QtyoutLinkEdit1 = new DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit();
            this.QtyinLinkEdit1 = new DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit();
            this.Pricelink = new DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit();
            this.stockBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.variantsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.variantsGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.QtyoutLinkEdit1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.QtyinLinkEdit1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Pricelink)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.stockBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // variantsBindingSource
            // 
            this.variantsBindingSource.DataMember = "Variants";
            this.variantsBindingSource.DataSource = this.itemsBindingSource;
            // 
            // itemsBindingSource
            // 
            this.itemsBindingSource.DataSource = typeof(Coffee.Item);
            this.itemsBindingSource.CurrentChanged += new System.EventHandler(this.itemsBindingSource_CurrentChanged);
            // 
            // gridView1
            // 
            this.gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colNo,
            this.colDescription,
            this.colUnit_Price,
            this.Inventory_Balance});
            this.gridView1.DetailHeight = 431;
            this.gridView1.GridControl = this.variantsGridControl;
            this.gridView1.Name = "gridView1";
            this.gridView1.OptionsBehavior.Editable = false;
            // 
            // colNo
            // 
            this.colNo.FieldName = "No";
            this.colNo.MinWidth = 25;
            this.colNo.Name = "colNo";
            this.colNo.Visible = true;
            this.colNo.VisibleIndex = 0;
            this.colNo.Width = 94;
            // 
            // colDescription
            // 
            this.colDescription.FieldName = "Description";
            this.colDescription.MinWidth = 25;
            this.colDescription.Name = "colDescription";
            this.colDescription.Visible = true;
            this.colDescription.VisibleIndex = 1;
            this.colDescription.Width = 94;
            // 
            // colUnit_Price
            // 
            this.colUnit_Price.FieldName = "Unit_Price";
            this.colUnit_Price.MinWidth = 25;
            this.colUnit_Price.Name = "colUnit_Price";
            this.colUnit_Price.Visible = true;
            this.colUnit_Price.VisibleIndex = 2;
            this.colUnit_Price.Width = 94;
            // 
            // Inventory_Balance
            // 
            this.Inventory_Balance.Caption = "Stock Balance";
            this.Inventory_Balance.FieldName = "Inventory_Balance";
            this.Inventory_Balance.MinWidth = 25;
            this.Inventory_Balance.Name = "Inventory_Balance";
            this.Inventory_Balance.Visible = true;
            this.Inventory_Balance.VisibleIndex = 3;
            this.Inventory_Balance.Width = 94;
            // 
            // variantsGridControl
            // 
            this.variantsGridControl.DataSource = this.itemsBindingSource;
            this.variantsGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.variantsGridControl.EmbeddedNavigator.Margin = new System.Windows.Forms.Padding(4);
            this.variantsGridControl.Location = new System.Drawing.Point(0, 0);
            this.variantsGridControl.MainView = this.gridView1;
            this.variantsGridControl.Margin = new System.Windows.Forms.Padding(4);
            this.variantsGridControl.Name = "variantsGridControl";
            this.variantsGridControl.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.QtyoutLinkEdit1,
            this.QtyinLinkEdit1,
            this.Pricelink});
            this.variantsGridControl.Size = new System.Drawing.Size(1131, 556);
            this.variantsGridControl.TabIndex = 8;
            this.variantsGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            // 
            // QtyoutLinkEdit1
            // 
            this.QtyoutLinkEdit1.AutoHeight = false;
            this.QtyoutLinkEdit1.Name = "QtyoutLinkEdit1";
            this.QtyoutLinkEdit1.OpenLink += new DevExpress.XtraEditors.Controls.OpenLinkEventHandler(this.QtyoutLinkEdit1_OpenLink);
            this.QtyoutLinkEdit1.ButtonClick += new DevExpress.XtraEditors.Controls.ButtonPressedEventHandler(this.QtyoutLinkEdit1_ButtonClick);
            this.QtyoutLinkEdit1.Click += new System.EventHandler(this.QtyoutLinkEdit1_Click);
            // 
            // QtyinLinkEdit1
            // 
            this.QtyinLinkEdit1.AutoHeight = false;
            this.QtyinLinkEdit1.Name = "QtyinLinkEdit1";
            this.QtyinLinkEdit1.Click += new System.EventHandler(this.QtyinLinkEdit1_Click);
            // 
            // Pricelink
            // 
            this.Pricelink.AutoHeight = false;
            this.Pricelink.Name = "Pricelink";
            // 
            // stockBindingSource
            // 
            this.stockBindingSource.DataSource = typeof(Coffee.Stock);
            // 
            // Stores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1131, 556);
            this.Controls.Add(this.variantsGridControl);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Stores";
            this.Text = "Stores";
            ((System.ComponentModel.ISupportInitialize)(this.variantsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.variantsGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.QtyoutLinkEdit1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.QtyinLinkEdit1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Pricelink)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.stockBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.BindingSource itemsBindingSource;
        private System.Windows.Forms.BindingSource variantsBindingSource;
        private System.Windows.Forms.BindingSource stockBindingSource;
        private DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit QtyoutLinkEdit1;
        private DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit QtyinLinkEdit1;
        private DevExpress.XtraEditors.Repository.RepositoryItemHyperLinkEdit Pricelink;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn colNo;
        private DevExpress.XtraGrid.Columns.GridColumn colDescription;
        private DevExpress.XtraGrid.Columns.GridColumn colUnit_Price;
        private DevExpress.XtraGrid.GridControl variantsGridControl;
        private DevExpress.XtraGrid.Columns.GridColumn Inventory_Balance;
    }
}