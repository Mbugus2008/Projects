using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WeighCon
{
    public partial class frmItemMaster : Form
    {
        WEIGHCONEntities db = new WEIGHCONEntities();
        public frmItemMaster()
        {
            InitializeComponent();
        }

        private void frmItemMaster_Load(object sender, EventArgs e)
        {

           
            db.ITEMMASTERs.Load();
            iTEMMASTERBindingSource.DataSource = db.ITEMMASTERs.Local;

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            iTEMMASTERBindingSource.AddNew();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure want to delete this records?", "Message", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                iTEMMASTERBindingSource.RemoveCurrent();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            db.SaveChanges();
            MessageBox.Show("Your data has been successfully saved !", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void frmItemMaster_FormClosing(object sender, FormClosingEventArgs e)
        {
            db.Dispose();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            var changed = db.ChangeTracker.Entries().Where(x => !Operators.ConditionalCompareObjectEqual(x.State, EntityState.Unchanged, false)).ToList();
            foreach (var obj in changed)
            {
                switch (obj.State)
                {
                    case var @case when Operators.ConditionalCompareObjectEqual(@case, EntityState.Modified, false):
                        {
                            obj.CurrentValues.SetValues(obj.OriginalValues);
                            obj.State = EntityState.Unchanged;
                            break;
                        }

                    case var case1 when Operators.ConditionalCompareObjectEqual(case1, EntityState.Added, false):
                        {
                            obj.State = EntityState.Detached;
                            break;
                        }

                    case var case2 when Operators.ConditionalCompareObjectEqual(case2, EntityState.Deleted, false):
                        {
                            obj.State = EntityState.Unchanged;
                            break;
                        }
                }
            }

            iTEMMASTERBindingSource.ResetBindings(false);
        }

        private void iTEMMASTERBindingSource_CurrentChanged(object sender, EventArgs e)
        {

        }
    }
}
