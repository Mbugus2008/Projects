using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Coffee
{
    public partial class Posted_Debts : Form,IRibbon,iCoffee
    {
        Navigation navigation;
        public static List<Stores_header> Debts = new List<Stores_header>();
        AutoweighEntities db = new AutoweighEntities(coffee.ConnectionString());
        public Posted_Debts()
        {
            InitializeComponent();

            navigation = new Navigation(stores_headerBindingSource, storeGridControl, db, true, false, "Coffee.Debts","",ribbonControl1,this);
            this.Controls.Add(navigation);

            Task task = Task.Factory.StartNew(() =>
          {            
              stores_headerBindingSource.DataSource = db.Stores_headers.Where(o=> o.Crop_Year == coffee.setup.Current_crop).ToList();
          }, CancellationToken.None, TaskCreationOptions.None, TaskScheduler.FromCurrentSynchronizationContext());

        }
        public Posted_Debts(List<Stores_header> stores_Headers)
        {
            InitializeComponent();

            navigation = new Navigation(stores_headerBindingSource, storeGridControl, db, true, false, "Coffee.Debts", "", ribbonControl1, this);
            this.Controls.Add(navigation);

            Task task = Task.Factory.StartNew(() =>
            {
                Debts = stores_Headers.Where(o => o.Crop_Year == coffee.setup.Current_crop).ToList();
                stores_headerBindingSource.DataSource = Debts;
            }, CancellationToken.None, TaskCreationOptions.None, TaskScheduler.FromCurrentSynchronizationContext());

        }
        public void deleteitem<T>(T data)
        {
            var d = data as Stores_header;
            if (d!=null)
            db.Stores_headers.Remove(data as Stores_header);
        }
        public Form form => this;
        public Formtype formtype => Formtype.List;
        public void loaddata()
        {
               Task task = Task.Factory.StartNew(() =>
            {
                stores_headerBindingSource.DataSource = Debts;
                
            }, CancellationToken.None, TaskCreationOptions.None, TaskScheduler.FromCurrentSynchronizationContext());
        }

        public void newitem()
        {
            iCoffee coff = CardForm as iCoffee;
            coff.newitem();
            coff.form.StartPosition = FormStartPosition.CenterParent;
            coff.form.ShowDialog();
        }

        public void edititem<T >(T data)
        {
            var d = data as Stores_header;
            if (d.Posted != true)
            {
                iCoffee coff = CardForm as iCoffee;
                coff.edititem(data);
                coff.form.StartPosition = FormStartPosition.CenterParent;
                coff.form.ShowDialog();
            }
            
        }

        DevExpress.XtraBars.Ribbon.RibbonControl IRibbon.Ribbon
        {
            get { return navigation.navigationribbon; }
        }

        public Form CardForm => new Debts();

        public Posted_Debts(Item_Variant ss)
        {
            InitializeComponent();
            this.Text = String.Format("{0} - {1}", ss.Item_name.ToUpper(), ss.Code);
            //var q = from s in ps.Stores where s.Item ==ss.No && s.Variant == ss.Code join sh in ps.Stores_headers on s.Entry equals sh.Entry where sh.Posted == true select s;
            itemBindingSource.DataSource = db.Items.ToList();
            // var binding = new BindingList<Store>(q.ToList());

            farmerBindingSource.DataSource = db.Farmers.ToList();
            storeBindingSource.DataSource = db.Stores.ToList();

        }
        private void ribbonControl1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
        private void Posted_Debts_Load(object sender, EventArgs e)
        {

        }

        private void storeGridControl_Click(object sender, EventArgs e)
        {

        }

        private void Posted_Debts_Activated(object sender, EventArgs e)
        {

        }

        private void gridView1_MasterRowEmpty(object sender, DevExpress.XtraGrid.Views.Grid.MasterRowEmptyEventArgs e)
        {
            //Stores_header p = (Stores_header)gridView1.GetRow(e.RowHandle);
            //e.IsEmpty = p.Store_lines.Count() == 0;
        }

        private void gridView1_MasterRowGetRelationCount(object sender, DevExpress.XtraGrid.Views.Grid.MasterRowGetRelationCountEventArgs e)
        {
            //e.RelationCount = 1;
        }

        private void gridView1_MasterRowGetRelationName(object sender, DevExpress.XtraGrid.Views.Grid.MasterRowGetRelationNameEventArgs e)
        {
            //e.RelationName = "Stores";
        }

        private void gridView1_MasterRowGetChildList(object sender, DevExpress.XtraGrid.Views.Grid.MasterRowGetChildListEventArgs e)
        {
            //Stores_header p = (Stores_header)gridView1.GetRow(e.RowHandle);
            //e.ChildList = p.Store_lines.ToList(); ;
        }
        private void cellcontext_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            switch (e.ClickedItem.Name)
            {
                case "filterWithThisValueToolStripMenuItem":
                    gridView1.ActiveFilterString = "[" + gridView1.FocusedColumn.FieldName + "] = '" + gridView1.FocusedValue + "'";
                    break;
                case "reverseThisReceiptToolStripMenuItem":
                    if (coffee.user.Type == "Admin")
                    {
                        string reverseentry = gridView1.GetRowCellValue(gridView1.FocusedRowHandle, colEntry).ToString();
                        var dd = coffee.Reversestore(reverseentry);
                        MessageBoxIcon m = (dd.Code == 0 ? MessageBoxIcon.Information : MessageBoxIcon.Exclamation);
                        MessageBox.Show(dd.Desc, "Reversal", MessageBoxButtons.OK, m);
                        storeBindingSource.DataSource = null;
                        storeBindingSource.DataSource = db.Stores.ToList();
                        storeGridControl.RefreshDataSource();
                    }
                    else
                    {
                        MessageBox.Show("Contact the administrator for this action");

                    }
                    break;
            }
        }

        private void gridView1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
            {

                cellcontext.Show(storeGridControl, e.Location);
            }
        }

        private void storeGridControl_Click_1(object sender, EventArgs e)
        {

        }

        private void reverseThisReceiptToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void storeBindingSource_BindingComplete(object sender, BindingCompleteEventArgs e)
        {

        }

        private void btnprint_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                

                    DialogResult d = MessageBox.Show("Are you sure you want to Print this receipt", "Post Store", MessageBoxButtons.YesNo);
                    if (d == DialogResult.Yes)
                    {
                        
                        var fr = new Reports.Storereceipt_epson((Stores_header)stores_headerBindingSource.Current);
                        DevExpress.XtraReports.UI.ReportPrintTool pr = new DevExpress.XtraReports.UI.ReportPrintTool(fr);
                        //pr.PrinterSettings.PrinterName = coffee.setup.Printer;
                        //pr.PrinterSettings.Copies = (short)(coffee.setup.Stores_receipts_copies == null ? 1 : coffee.setup.Stores_receipts_copies);
                        for (int i = 1; i <= coffee.setup.Stores_receipts_copies; i++)
                        {
                            pr.Print();
                        }
                        this.Close();
                        //stores_headerBindingSource.DataSource = db.Stores_headers.Where(o => o.Posted == false).ToList();
                    }
                
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
        }

        private void storeGridControl_DoubleClick(object sender, EventArgs e)
        {

        }

        private void gridView1_DoubleClick(object sender, EventArgs e)
        {

        }

        private void gridView1_SelectionChanged(object sender, DevExpress.Data.SelectionChangedEventArgs e)
        {
           
        }
    }
}
