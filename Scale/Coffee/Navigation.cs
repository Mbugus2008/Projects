using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraGrid.Views.Grid;
using System.Threading.Tasks;
using DevExpress.XtraBars.Ribbon;
using DevExpress.XtraGrid.Views.Base;
using DevExpress.Utils;
using DevExpress.XtraGrid.Views.Grid.ViewInfo;
using System.Data.Entity;

namespace Coffee
{
    public   partial  class Navigation : UserControl
    {     

        public navi navis { get; set; }
        public Form hostform = null;
        private bool saveonchange = true;
        private DevExpress.XtraBars.Ribbon.RibbonControl ribbon;
        private BindingSource bs { get; set; }
        private  AutoweighEntities db;
        private string editaddform;
        private string datatype;
        public object Selecteditem { get; set; }
        public RibbonControl Ribbon { get => ribbon; set => ribbon = value; }

        private   DevExpress.XtraGrid.GridControl grid;
        public Navigation(navi navi)
        { InitializeComponent(); }
        public Navigation()
        { InitializeComponent(); }
        public Navigation(BindingSource b, DevExpress.XtraGrid.GridControl g, AutoweighEntities e, Boolean edit = true, bool soc = true, string editform = "", string datatype = "", RibbonControl r = null, Form form = null)
        {
            InitializeComponent();
            // Task.Factory.StartNew(() => {  
            this.hostform = form;
            if (hostform != null)
            {
                hostform.Activated += new EventHandler( Allcollections_Activated);
                hostform.FormClosing += new FormClosingEventHandler(Users_FormClosing);
            }
            this.bs = b;
            this.grid = g;
            this.db = e;
            this.saveonchange = soc;
            this.editaddform = editform;
            this.datatype = datatype;
            this.ribbon = r;
            //   }); 
            this.AutoSize = true;
            this.navigationribbon.MdiMergeStyle = RibbonMdiMergeStyle.Always;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            if (bs != null)
            {
                bs.CurrentChanged += new EventHandler(BindingSource_CurrentChanged);
                bs.CurrentItemChanged += new EventHandler(BindingSource_CurrentItemChanged);
                bs.PositionChanged += new EventHandler(BindingSource_PositionChanged);

            }
            else
            {
                ribbonPageGroup1.Visible = false;

            }
            ribbonPageGroup3.Visible = edit;
            if (grid == null)
            {
                exportgroup.Visible = false;
                //  ((GridView)grid.FocusedView).OptionsBehavior.ReadOnly = edit;
            }
            if(grid !=null)
            {
                grid.Views[0].DoubleClick += new EventHandler(GridControl_DoubleClick);

            }

            this.Dock = DockStyle.Top;
            this.SendToBack();
            if (ribbon != null)
            {
                navigationribbon.MergeRibbon(ribbon);
                ribbon.Visible = false;

            }
            IRibbon f = hostform as IRibbon;
            if (f != null)
            {
                exportgroup.Visible = (f.formtype == Formtype.List);

                    }
        }
        private void BindingSource_CurrentItemChanged(object sender, EventArgs e)
        {
            try
            {
                if (bs != null) 
                bs.EndEdit();
               
                if (saveonchange==true)
                    db.SaveChanges();
              if (bs !=null )
                   btnedit .Enabled = bs.Current !=null;
                
               
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
        }
        private void Navigation_Load(object sender, EventArgs e)
        {

            initializenav();
        }
        private void Allcollections_Activated(object sender, EventArgs e)
        {
            
                    if (hostform != null)
                    {
                        iCoffee hf = hostform as iCoffee;
                        hf.loaddata();
                    }
        }
        private void Users_FormClosing(object sender, FormClosingEventArgs e)
        {
            //stop = true;
            if (db.ChangeTracker.Entries().Any(ee => ee.State == EntityState.Added
                                                 || ee.State == EntityState.Modified
                                                 || ee.State == EntityState.Deleted))
            {
                DialogResult result1 = MessageBox.Show("There are changes made to your data, do you want to save them?", "Save Changes", MessageBoxButtons.YesNo);
                if (result1 == DialogResult.Yes)
                    db.SaveChanges(true);
            }
        }
        private  void ribbonControl1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            BindingSource b = bs;

            switch (e.Item.Name)
            {
                case "btnedit":
                    if (hostform != null)
                    {
                        if (bs != null)
                        {
                            if (bs.Current != null)
                            {
                                iCoffee i = hostform as iCoffee;
                                i.edititem(bs.Current);
                            }
                        }
                    }
                    break;
                case "btnrefresh":
                    if (hostform != null)
                    {
                        iCoffee hf = hostform as iCoffee;

                        hf.loaddata();

                    }
                    //if (grid != null)
                    //grid.MainView.RefreshData();
                    break;

                case "btnclose":
                    ((Form)this.Parent).Close();
                    break;
                case "btnSelect":
                    db.SaveChanges();
                    this.Selecteditem = bs.Current;
                    ((Form)this.Parent).DialogResult = DialogResult.OK;
                    ((Form)this.Parent).Close();
                    break;
                case "btndelete":
                    if (hostform != null)
                    {
                        if (bs != null)
                        {
                            if (bs.Current != null)
                            {
                                iCoffee i = hostform as iCoffee;
                                i.deleteitem(bs.Current);
                            }
                        }
                    }
                     //if (bs != null)
                     //   if (bs.Current != null) if (bs.AllowRemove)
                     //           bs.RemoveCurrent();

                    break;
                case "btnnew":

                    if (hostform != null)
                    {
                        iCoffee hf = hostform as iCoffee;

                        hf.newitem();

                    }

                    //if (!string.IsNullOrEmpty(editaddform))
                    //{

                    //    Type t = Type.GetType(editaddform);

                    //    if (t != null)
                    //    {
                    //        Form frm = Activator.CreateInstance(t) as Form;
                    //        if (frm != null)
                    //            frm.ShowDialog();
                    //    }
                    //}
                    //else
                    //    bs.AddNew(); 
                    break;
                case "btnsave":
                    if (bs!=null)
                    bs.EndEdit();
                    db.SaveChanges(true);
                    break;
                case "btnsavennew":
                    if (bs != null)
                        bs.EndEdit();
                    db.SaveChanges();
                    bs.AddNew();
                    break;
                case "navfirst":
                    b.MoveFirst();

                    break;
                case "navnext":
                    b.MoveNext();
                    break;
                case "navprevious":
                    b.MovePrevious();
                    break;
                case "navlast":
                    b.MoveLast();
                    break;
                case "btnexcelx":
                    try
                    {
                        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                        saveFileDialog1.Filter = "Excel 2010|*.xlsx";
                        saveFileDialog1.Title = "Save list to File";
                        saveFileDialog1.ShowDialog();

                        // If the file name is not an empty string open it for saving.  
                        if (saveFileDialog1.FileName != "")
                        {
                            grid.ExportToXlsx(saveFileDialog1.FileName);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                        MessageBox.Show("Unable to save file");
                    }
                    break;
                case "btnexcel":
                    try
                    {
                        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                        saveFileDialog1.Filter = "Excel File|*.xls";
                        saveFileDialog1.Title = "Save list to File";
                        saveFileDialog1.ShowDialog();

                        // If the file name is not an empty string open it for saving.  
                        if (saveFileDialog1.FileName != "")
                        {
                            grid.ExportToXls(saveFileDialog1.FileName);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                        MessageBox.Show("Unable to save file");
                    }
                    break;
                case "btnpdf":
                    try
                    {
                        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                        saveFileDialog1.Filter = "Pdf|*.pdf";
                        saveFileDialog1.Title = "Save list to File";
                        saveFileDialog1.ShowDialog();

                        // If the file name is not an empty string open it for saving.  
                        if (saveFileDialog1.FileName != "")
                        {
                            grid.ExportToPdf(saveFileDialog1.FileName);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                        MessageBox.Show("Unable to save file");
                    }
                    break;
            }
            if (bs != null)
            {
               
                txtrecord.Caption = string.Format("of {0}", bs.Count);
            }
        }
        private void initializenav()
        {
            if (bs != null)
            {
             
                txtrecord.EditValue = bs.Position + 1;
                

                txtrecord.Caption = string.Format("of {0}", bs.Count);

                if (bs.Position == 0)
                {
                    navprevious.Enabled = false;
                    navfirst.Enabled = false;
                }
                else
                {
                    navprevious.Enabled = true;
                    navfirst.Enabled = true;
                }

                if (bs.Position == bs.Count - 1)
                {
                    navnext.Enabled = false;
                    navlast.Enabled = false;
                }
                else
                {
                    navnext.Enabled = true;
                    navlast.Enabled = true;
                }
            }
            if (grid != null)
            {
               
                ((GridView)grid.FocusedView).OptionsBehavior.EditingMode = GridEditingMode.EditForm;
                 grid.DataSourceChanged += DataSourceChanged;
               


            }

        }
        private void DataSourceChanged(object sender, EventArgs e)
        {
            foreach (GridView view in grid.Views)
            {
                foreach (DevExpress.XtraGrid.Columns.GridColumn column in view.Columns)
                {
                    if (column.ColumnType == typeof(double))
                    {
                        column.DisplayFormat.FormatType = DevExpress.Utils.FormatType.Numeric;
                        column.DisplayFormat.FormatString = "N2";
                        column.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
                    }
                }
            }
        }
       
        private void GridView1_CustomDrawCell(object sender, RowCellCustomDrawEventArgs e)
        {
            GridView view = sender as GridView;
            foreach (DevExpress.XtraGrid.Columns.GridColumn column in view.Columns)
            {
                if (column.ColumnType == typeof(DateTime))
                {
                    e.Cache.FillRectangle(Color.Salmon, e.Bounds);
                    e.Appearance.DrawString(e.Cache, e.DisplayText, e.Bounds);
                    e.Handled = true;
                }
            }

        }
        private void BindingSource_CurrentChanged(object sender, EventArgs e)
        {
            if (bs.Current == null)
                disable();
            else { 
                enable();
              
             
            }

            if (bs.Position == 0)
            {
                navprevious.Enabled = false;
                navfirst.Enabled = false;
            }
            else
            {
                navprevious.Enabled = true;
                navfirst.Enabled = true;
            }

            if (bs.Position == bs.Count - 1)
            {
                navnext.Enabled = false;
                navlast.Enabled = false;
            }
            else
            {
                navnext.Enabled = true;
                navlast.Enabled = true;
            }
        }
        private void BindingSource_PositionChanged(object sender, EventArgs e)
        {
            txtrecord.EditValue = bs.Position+1;
        }
        private void enable()
        {
            navlast.Enabled = true;
            navprevious.Enabled = true;
            navnext.Enabled = true;
            navfirst.Enabled = true;

        }
        private void disable()
        {
            navlast.Enabled = false;
            navprevious.Enabled = false;
            navfirst.Enabled = false;
            navnext.Enabled = false;
        }

        private void txtrecord_EditValueChanged(object sender, EventArgs e)
        {

         
        }
        private void GridControl_DoubleClick(object sender, EventArgs e)
        {
            DXMouseEventArgs ea = e as DXMouseEventArgs;
            GridView view = sender as GridView;
            GridHitInfo info = view.CalcHitInfo(ea.Location);
            if (info.InRow || info.InRowCell)
            {
                string colCaption = info.Column == null ? "N/A" : info.Column.GetCaption();
                //MessageBox.Show(string.Format("DoubleClick on row: {0}, column: {1}.", info.RowHandle, colCaption));
                iCoffee i = hostform as iCoffee;
                i.edititem(view.FocusedRowObject);
            }
        }
        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }
    }
}
