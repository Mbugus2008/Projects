namespace Weigh
{
    partial class Filters
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Filter1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.cbocolumn = new System.Windows.Forms.ComboBox();
            this.Filter1.SuspendLayout();
            this.SuspendLayout();
            // 
            // Filter1
            // 
            this.Filter1.Controls.Add(this.label1);
            this.Filter1.Controls.Add(this.textBox1);
            this.Filter1.Controls.Add(this.cbocolumn);
            this.Filter1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Filter1.Location = new System.Drawing.Point(3, 3);
            this.Filter1.Margin = new System.Windows.Forms.Padding(0);
            this.Filter1.Name = "Filter1";
            this.Filter1.Padding = new System.Windows.Forms.Padding(0);
            this.Filter1.Size = new System.Drawing.Size(325, 40);
            this.Filter1.TabIndex = 4;
            this.Filter1.TabStop = false;
            this.Filter1.Text = "And";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(153, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "is";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(173, 12);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(144, 20);
            this.textBox1.TabIndex = 3;
            // 
            // cbocolumn
            // 
            this.cbocolumn.FormattingEnabled = true;
            this.cbocolumn.Location = new System.Drawing.Point(3, 12);
            this.cbocolumn.Name = "cbocolumn";
            this.cbocolumn.Size = new System.Drawing.Size(140, 21);
            this.cbocolumn.TabIndex = 2;
            // 
            // Filters
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.Filter1);
            this.Name = "Filters";
            this.Size = new System.Drawing.Size(339, 51);
            this.Load += new System.EventHandler(this.Filters_Load);
            this.Filter1.ResumeLayout(false);
            this.Filter1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox Filter1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.ComboBox cbocolumn;
    }
}
