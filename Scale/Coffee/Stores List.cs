using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Coffee
{
    public partial class Stores_List : Form, IStores_headerView
    {
        Navigation navigation;
        public static List<Stores_header> Debts = new List<Stores_header>();
        AutoweighEntities db = new AutoweighEntities(coffee.ConnectionString());
        public Stores_List()
        {
            InitializeComponent();
            navigation = new Navigation(stores_headerBindingSource, storeGridControl, db, true, false, "Coffee.Debts", "", ribbonControl1, this);
            this.Controls.Add(navigation);
           
        }
        public IList<Stores_header> Stores_headerList
        {
            get => (IList<Stores_header>)this.stores_headerBindingSource.DataSource;
            set
            {
                this.stores_headerBindingSource.DataSource = value;
            }
        }



        public Stores_header Selected
        {
            get => (Stores_header)this.stores_headerBindingSource.Current;
            set => this.stores_headerBindingSource.DataSource = value;
        }
        public CustomerPresenter Presenter { private get; set; }


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
