using DevExpress.XtraBars.Ribbon;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Coffee
{
    public partial class WeighMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public bool stop = false;
        public server.Collect service = new server.Collect();
        private int childFormNumber = 0;
    
        public WeighMain()
        {
            InitializeComponent();
            coffee.status = statusbar1;
           new ExternalData().start();
            this.IsMdiContainer = true;
          
            //Scripting.Createscript();
        }
        private void Weigh_Load(object sender, EventArgs e)
        {
            this.IsMdiContainer = true;
            menuribbon.MdiMergeStyle = RibbonMdiMergeStyle.Always;

            while (coffee.setup == null)
            {
                Settings s = new Settings();
                s.ShowDialog();
                new coffee();
            }

            this.Text =String.Format("{0}|{1}" ,coffee.Factory_Name, Coffee.coffee.setup.Current_crop);
            if (Coffee.coffee.user == null)
            {
                Coffee.coffee.user = new AutoweighEntities(coffee.ConnectionString()).Users.FirstOrDefault();
            }
            Coffee.coffee.status.txtuser.Text = Coffee.coffee.user.Name;
        }
                private void WeighMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            //stop = true;
            //if (AutoweighEntities. Db.ChangeTracker.Entries().Any(ee => ee.State == EntityState.Added
            //                                     || ee.State == EntityState.Modified
            //                                     || ee.State == EntityState.Deleted))
            //{
            //    DialogResult result1 = MessageBox.Show("There are changes made to your data, do you want to save them?", "Save Changes", MessageBoxButtons.YesNo);
            //    if (result1 == DialogResult.Yes)
            //        AutoweighEntities. Db.SaveChanges(true);
            //}
            Application.Exit();
        }

        private void WeighMain_MdiChildActivate(object sender, EventArgs e)
        {
            
            var dd = "";
        }

        private void xtraTabbedMdiManager1_PageAdded(object sender, DevExpress.XtraTabbedMdi.MdiTabPageEventArgs e)
        {
            var dd = "";

        }

        private void xtraTabbedMdiManager1_PageRemoved(object sender, DevExpress.XtraTabbedMdi.MdiTabPageEventArgs e)
        {
           
        }
     
        private void xtraTabbedMdiManager2_SelectedPageChanged(object sender, EventArgs e)
        {
            if (xtraTabbedMdiManager1.SelectedPage != null)
            {
                IRibbon form = xtraTabbedMdiManager1.SelectedPage.MdiChild as IRibbon;
                if (form != null)
                {
                    menuribbon.MergeRibbon(form.Ribbon);
                    menuribbon.SelectedPage = menuribbon.MergedPages[0];
                }
            }
            //try
            //{

            //if (xtraTabbedMdiManager1.SelectedPage != null)
            //{
            //    foreach (Control c in xtraTabbedMdiManager1.SelectedPage.MdiChild.Controls)
            //    {
            //        if (c is UserControl)
            //            foreach (Control cc in c.Controls)
            //            {
            //                if (cc is RibbonControl)
            //                {
            //                    if (menuribbon != null)
            //                    {
            //                        menuribbon.MergeRibbon((RibbonControl)cc);
            //                        menuribbon.SelectedPage = menuribbon.Pages[menuribbon.Pages.Count()-1];
            //                        menuribbon.SelectedPage = menuribbon.MergedRibbon.Pages[((RibbonControl)cc).Pages[0].PageIndex];


            //                    }
            //                }
            //            }
            //        if (c is RibbonControl)
            //        {
            //            if (menuribbon != null)
            //            {
            //                menuribbon.MergeRibbon((RibbonControl)c);
            //                menuribbon.SelectedPage = menuribbon.MergedRibbon.Pages[((RibbonControl)c).Pages[0].PageIndex];
            //              //  mainribbon.SelectedPage = designerForm.RibbonControl.Pages[ribbon.SelectedPage.Text];


            //            }
            //        }
            //    }
            //}
            //else
            //    if (menuribbon != null)
            //    menuribbon.UnMergeRibbon();
            //}
            //catch (Exception ex)
            //{
            //    Logging.Logging.ReportError(ex);
            //}
        }

        private void menuribbon_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                bool open = false;
                var parent = this.Parent as Form;
                Form f = null;
                Form modal = null;
                switch (e.Item.Name)
                {
                    case "bcollections":
                        f = new Allcollections();
                        break;
                    case "bfarmers":
                        f = new Farmers();
                        break;
                    case "bstores":
                        f = new Stores();
                        break;
                    case "bdebts":
                        f = new Debts();
                        break;
                    case "bposteddebts":
                        f = new Posted_Debts(coffee.loaddb().Stores_headers.ToList());
                        break;
                        
                    case "btnpostedstores":
                        f = new Posted_Debts(coffee.db.Stores_headers.Where(o => o.Posted == true).ToList());
                        break;
                    case "bcollect":
                        modal = new Collection();
                        modal.TopLevel = true;
                        break;
                    case "bsetup":
                        modal = new Settings();
                        modal.TopLevel = true;
                        break;
                    case "busers":
                        modal = new Users();
                        modal.TopLevel = true;
                        break;
                    case "bchangepass":
                        modal = new FrmchangePass();
                        modal.TopLevel = true;
                        break;
                    //Reports
                    case "rptfarmers":
                        f = new Reportfilters(typeof(Farmer));
                        break;
                    case "rptdailysummary":
                        var x = new Reports.Daily_summary();
                        var r = new Report(x);
                        r.MdiParent = parent;
                        r.Show();
                        break;
                    case "rptcollections":
                        f = new Reportfilters(typeof(Daily_Collections_Detail));
                        break;
                }

                if (f != null)
                {
                    
                    if (this.HasChildren)
                        foreach (Form child in this.MdiChildren)
                        {
                            if (child.Name.Equals(f.Name))
                            {
                                child.Activate();
                                open = true;
                                break;
                            }
                        }
                    if (open == false)
                    {
                        f.MdiParent = this;
                        f.Show();

                    }
                    //foreach (Control item in f.Controls)

                    //                      {
                    //                          if (item is RibbonControl)
                    //                          {
                    //                                  ribbonControl1.MergeRibbon((RibbonControl)item);

                    //                                 ribbonControl1.SelectedPage= ribbonControl1.MergedRibbon.Pages["Collections"];


                    //                              break;
                    //                          }
                    //                      }
                }
                if (modal != null)
                {
                    modal.ShowDialog();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Unable to load form");
                Logging.Logging.ReportError(ex);
            }
        }

        private void xtraTabbedMdiManager1_FloatMDIChildActivated(object sender, EventArgs e)
        {
           
        }
    }
   
}
