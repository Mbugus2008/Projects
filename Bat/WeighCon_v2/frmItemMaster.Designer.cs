
namespace WeighCon
{
    partial class frmItemMaster
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
            this.panelItemMaster = new System.Windows.Forms.Panel();
            this.GroupBox1 = new System.Windows.Forms.GroupBox();
            this.txtBarcode = new System.Windows.Forms.TextBox();
            this.txtDescription = new System.Windows.Forms.TextBox();
            this.Label3 = new System.Windows.Forms.Label();
            this.txtUnitofMass = new System.Windows.Forms.TextBox();
            this.txtStandardMass = new System.Windows.Forms.TextBox();
            this.txtTolenceNegative = new System.Windows.Forms.TextBox();
            this.Label7 = new System.Windows.Forms.Label();
            this.txtTolencePositive = new System.Windows.Forms.TextBox();
            this.Label5 = new System.Windows.Forms.Label();
            this.Label6 = new System.Windows.Forms.Label();
            this.txtItemcode = new System.Windows.Forms.TextBox();
            this.Label4 = new System.Windows.Forms.Label();
            this.Label2 = new System.Windows.Forms.Label();
            this.Label1 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.txtProdOrderNO = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtOldBarcode = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtProdOrderNO1 = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtFixedMass = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.chkFixed = new System.Windows.Forms.CheckBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.dtItemMaster = new System.Windows.Forms.DataGridView();
            this.btnEdit = new FontAwesome.Sharp.IconButton();
            this.btnCancel = new FontAwesome.Sharp.IconButton();
            this.btnDelete = new FontAwesome.Sharp.IconButton();
            this.btnAdd = new FontAwesome.Sharp.IconButton();
            this.itemCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.newBarCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.productionOrderNoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.barCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.descriptionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.theoreticalMassDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.uOMDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.permittedTolUpperDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.permittedTolLowerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fixedDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.weightDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iTEMMASTERBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.panelItemMaster.SuspendLayout();
            this.GroupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtItemMaster)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.iTEMMASTERBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // panelItemMaster
            // 
            this.panelItemMaster.BackColor = System.Drawing.Color.AliceBlue;
            this.panelItemMaster.Controls.Add(this.groupBox4);
            this.panelItemMaster.Controls.Add(this.groupBox3);
            this.panelItemMaster.Controls.Add(this.GroupBox1);
            this.panelItemMaster.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelItemMaster.Location = new System.Drawing.Point(0, 0);
            this.panelItemMaster.Name = "panelItemMaster";
            this.panelItemMaster.Size = new System.Drawing.Size(1213, 675);
            this.panelItemMaster.TabIndex = 0;
            // 
            // GroupBox1
            // 
            this.GroupBox1.Controls.Add(this.groupBox2);
            this.GroupBox1.Controls.Add(this.txtProdOrderNO1);
            this.GroupBox1.Controls.Add(this.txtProdOrderNO);
            this.GroupBox1.Controls.Add(this.txtOldBarcode);
            this.GroupBox1.Controls.Add(this.txtBarcode);
            this.GroupBox1.Controls.Add(this.txtDescription);
            this.GroupBox1.Controls.Add(this.label10);
            this.GroupBox1.Controls.Add(this.label8);
            this.GroupBox1.Controls.Add(this.label9);
            this.GroupBox1.Controls.Add(this.Label3);
            this.GroupBox1.Controls.Add(this.txtUnitofMass);
            this.GroupBox1.Controls.Add(this.txtStandardMass);
            this.GroupBox1.Controls.Add(this.txtTolenceNegative);
            this.GroupBox1.Controls.Add(this.Label7);
            this.GroupBox1.Controls.Add(this.txtTolencePositive);
            this.GroupBox1.Controls.Add(this.Label5);
            this.GroupBox1.Controls.Add(this.Label6);
            this.GroupBox1.Controls.Add(this.txtItemcode);
            this.GroupBox1.Controls.Add(this.Label4);
            this.GroupBox1.Controls.Add(this.Label2);
            this.GroupBox1.Controls.Add(this.Label1);
            this.GroupBox1.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GroupBox1.Location = new System.Drawing.Point(12, 12);
            this.GroupBox1.Name = "GroupBox1";
            this.GroupBox1.Size = new System.Drawing.Size(1189, 177);
            this.GroupBox1.TabIndex = 1;
            this.GroupBox1.TabStop = false;
            this.GroupBox1.Text = "Item Details";
            // 
            // txtBarcode
            // 
            this.txtBarcode.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtBarcode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "NewBarCode", true));
            this.txtBarcode.Location = new System.Drawing.Point(407, 43);
            this.txtBarcode.Name = "txtBarcode";
            this.txtBarcode.Size = new System.Drawing.Size(316, 21);
            this.txtBarcode.TabIndex = 4;
            // 
            // txtDescription
            // 
            this.txtDescription.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDescription.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Description", true));
            this.txtDescription.Location = new System.Drawing.Point(9, 82);
            this.txtDescription.Multiline = true;
            this.txtDescription.Name = "txtDescription";
            this.txtDescription.Size = new System.Drawing.Size(316, 41);
            this.txtDescription.TabIndex = 1;
            // 
            // Label3
            // 
            this.Label3.AutoSize = true;
            this.Label3.Location = new System.Drawing.Point(404, 27);
            this.Label3.Name = "Label3";
            this.Label3.Size = new System.Drawing.Size(61, 13);
            this.Label3.TabIndex = 1;
            this.Label3.Text = "Bar Code";
            // 
            // txtUnitofMass
            // 
            this.txtUnitofMass.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtUnitofMass.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "UOM", true));
            this.txtUnitofMass.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUnitofMass.Location = new System.Drawing.Point(184, 142);
            this.txtUnitofMass.Name = "txtUnitofMass";
            this.txtUnitofMass.Size = new System.Drawing.Size(141, 21);
            this.txtUnitofMass.TabIndex = 3;
            this.txtUnitofMass.Text = "KG";
            // 
            // txtStandardMass
            // 
            this.txtStandardMass.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtStandardMass.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Theoretical_Mass", true));
            this.txtStandardMass.Location = new System.Drawing.Point(9, 142);
            this.txtStandardMass.Name = "txtStandardMass";
            this.txtStandardMass.Size = new System.Drawing.Size(131, 21);
            this.txtStandardMass.TabIndex = 2;
            // 
            // txtTolenceNegative
            // 
            this.txtTolenceNegative.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtTolenceNegative.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Permitted_Tol_Lower__", true));
            this.txtTolenceNegative.Location = new System.Drawing.Point(593, 142);
            this.txtTolenceNegative.Name = "txtTolenceNegative";
            this.txtTolenceNegative.Size = new System.Drawing.Size(130, 21);
            this.txtTolenceNegative.TabIndex = 7;
            // 
            // Label7
            // 
            this.Label7.AutoSize = true;
            this.Label7.Location = new System.Drawing.Point(181, 126);
            this.Label7.Name = "Label7";
            this.Label7.Size = new System.Drawing.Size(96, 13);
            this.Label7.TabIndex = 1;
            this.Label7.Text = "Unit of Measure";
            // 
            // txtTolencePositive
            // 
            this.txtTolencePositive.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtTolencePositive.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Permitted_Tol_Upper__", true));
            this.txtTolencePositive.Location = new System.Drawing.Point(407, 142);
            this.txtTolencePositive.Name = "txtTolencePositive";
            this.txtTolencePositive.Size = new System.Drawing.Size(151, 21);
            this.txtTolencePositive.TabIndex = 6;
            // 
            // Label5
            // 
            this.Label5.AutoSize = true;
            this.Label5.Location = new System.Drawing.Point(590, 126);
            this.Label5.Name = "Label5";
            this.Label5.Size = new System.Drawing.Size(132, 13);
            this.Label5.TabIndex = 1;
            this.Label5.Text = "Tolerance % Negative";
            // 
            // Label6
            // 
            this.Label6.AutoSize = true;
            this.Label6.Location = new System.Drawing.Point(6, 126);
            this.Label6.Name = "Label6";
            this.Label6.Size = new System.Drawing.Size(122, 13);
            this.Label6.TabIndex = 1;
            this.Label6.Text = "Standard Mass (KG)";
            // 
            // txtItemcode
            // 
            this.txtItemcode.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtItemcode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Item_Code", true));
            this.txtItemcode.Location = new System.Drawing.Point(9, 43);
            this.txtItemcode.Name = "txtItemcode";
            this.txtItemcode.Size = new System.Drawing.Size(221, 21);
            this.txtItemcode.TabIndex = 0;
            // 
            // Label4
            // 
            this.Label4.AutoSize = true;
            this.Label4.Location = new System.Drawing.Point(404, 126);
            this.Label4.Name = "Label4";
            this.Label4.Size = new System.Drawing.Size(126, 13);
            this.Label4.TabIndex = 1;
            this.Label4.Text = "Tolerance % Positive";
            // 
            // Label2
            // 
            this.Label2.AutoSize = true;
            this.Label2.Location = new System.Drawing.Point(6, 66);
            this.Label2.Name = "Label2";
            this.Label2.Size = new System.Drawing.Size(71, 13);
            this.Label2.TabIndex = 1;
            this.Label2.Text = "Description";
            // 
            // Label1
            // 
            this.Label1.AutoSize = true;
            this.Label1.Location = new System.Drawing.Point(6, 27);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(68, 13);
            this.Label1.TabIndex = 1;
            this.Label1.Text = "Item Code";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(799, 27);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(127, 13);
            this.label8.TabIndex = 1;
            this.label8.Text = "Production Order No.";
            // 
            // txtProdOrderNO
            // 
            this.txtProdOrderNO.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtProdOrderNO.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "ProductionOrderNo", true));
            this.txtProdOrderNO.Location = new System.Drawing.Point(802, 43);
            this.txtProdOrderNO.Name = "txtProdOrderNO";
            this.txtProdOrderNO.Size = new System.Drawing.Size(316, 21);
            this.txtProdOrderNO.TabIndex = 8;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(404, 66);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(84, 13);
            this.label9.TabIndex = 1;
            this.label9.Text = "Old Bar Code";
            // 
            // txtOldBarcode
            // 
            this.txtOldBarcode.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtOldBarcode.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "BarCode", true));
            this.txtOldBarcode.Location = new System.Drawing.Point(407, 82);
            this.txtOldBarcode.Name = "txtOldBarcode";
            this.txtOldBarcode.Size = new System.Drawing.Size(316, 21);
            this.txtOldBarcode.TabIndex = 5;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(799, 66);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(144, 13);
            this.label10.TabIndex = 1;
            this.label10.Text = "Production Order No.(2)";
            // 
            // txtProdOrderNO1
            // 
            this.txtProdOrderNO1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtProdOrderNO1.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "ProductionOrderNo", true));
            this.txtProdOrderNO1.Location = new System.Drawing.Point(802, 82);
            this.txtProdOrderNO1.Name = "txtProdOrderNO1";
            this.txtProdOrderNO1.Size = new System.Drawing.Size(316, 21);
            this.txtProdOrderNO1.TabIndex = 9;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(174, 13);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(72, 13);
            this.label11.TabIndex = 1;
            this.label11.Text = "Mass (KG)";
            // 
            // txtFixedMass
            // 
            this.txtFixedMass.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtFixedMass.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.iTEMMASTERBindingSource, "Weight", true));
            this.txtFixedMass.Location = new System.Drawing.Point(177, 29);
            this.txtFixedMass.Name = "txtFixedMass";
            this.txtFixedMass.Size = new System.Drawing.Size(130, 21);
            this.txtFixedMass.TabIndex = 1;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.chkFixed);
            this.groupBox2.Controls.Add(this.txtFixedMass);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.Color.Red;
            this.groupBox2.Location = new System.Drawing.Point(805, 108);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(313, 55);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Fixed Mass";
            // 
            // chkFixed
            // 
            this.chkFixed.AutoSize = true;
            this.chkFixed.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.iTEMMASTERBindingSource, "Fixed", true));
            this.chkFixed.ForeColor = System.Drawing.Color.Black;
            this.chkFixed.Location = new System.Drawing.Point(7, 29);
            this.chkFixed.Name = "chkFixed";
            this.chkFixed.Size = new System.Drawing.Size(66, 17);
            this.chkFixed.TabIndex = 0;
            this.chkFixed.Text = "Fixed ";
            this.chkFixed.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnEdit);
            this.groupBox3.Controls.Add(this.btnCancel);
            this.groupBox3.Controls.Add(this.btnDelete);
            this.groupBox3.Controls.Add(this.btnAdd);
            this.groupBox3.Location = new System.Drawing.Point(13, 196);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(1188, 37);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.dtItemMaster);
            this.groupBox4.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.groupBox4.Location = new System.Drawing.Point(12, 240);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(1189, 349);
            this.groupBox4.TabIndex = 3;
            this.groupBox4.TabStop = false;
            // 
            // dtItemMaster
            // 
            this.dtItemMaster.AllowUserToAddRows = false;
            this.dtItemMaster.AllowUserToDeleteRows = false;
            this.dtItemMaster.AutoGenerateColumns = false;
            this.dtItemMaster.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dtItemMaster.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtItemMaster.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.itemCodeDataGridViewTextBoxColumn,
            this.newBarCodeDataGridViewTextBoxColumn,
            this.productionOrderNoDataGridViewTextBoxColumn,
            this.barCodeDataGridViewTextBoxColumn,
            this.descriptionDataGridViewTextBoxColumn,
            this.theoreticalMassDataGridViewTextBoxColumn,
            this.uOMDataGridViewTextBoxColumn,
            this.permittedTolUpperDataGridViewTextBoxColumn,
            this.permittedTolLowerDataGridViewTextBoxColumn,
            this.fixedDataGridViewTextBoxColumn,
            this.weightDataGridViewTextBoxColumn});
            this.dtItemMaster.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dtItemMaster.DataSource = this.iTEMMASTERBindingSource;
            this.dtItemMaster.Location = new System.Drawing.Point(6, 19);
            this.dtItemMaster.Name = "dtItemMaster";
            this.dtItemMaster.Size = new System.Drawing.Size(1177, 323);
            this.dtItemMaster.TabIndex = 0;
            // 
            // btnEdit
            // 
            this.btnEdit.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEdit.IconChar = FontAwesome.Sharp.IconChar.Edit;
            this.btnEdit.IconColor = System.Drawing.Color.Black;
            this.btnEdit.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnEdit.IconSize = 20;
            this.btnEdit.Location = new System.Drawing.Point(170, 8);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.TabIndex = 2;
            this.btnEdit.Text = "Edit";
            this.btnEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancel.IconChar = FontAwesome.Sharp.IconChar.WindowClose;
            this.btnCancel.IconColor = System.Drawing.Color.Black;
            this.btnCancel.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnCancel.IconSize = 20;
            this.btnCancel.Location = new System.Drawing.Point(251, 8);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 3;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.BackColor = System.Drawing.Color.Gainsboro;
            this.btnDelete.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.IconChar = FontAwesome.Sharp.IconChar.TrashAlt;
            this.btnDelete.IconColor = System.Drawing.Color.Black;
            this.btnDelete.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnDelete.IconSize = 20;
            this.btnDelete.Location = new System.Drawing.Point(89, 8);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 1;
            this.btnDelete.Text = "Delete";
            this.btnDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnDelete.UseVisualStyleBackColor = false;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.BackColor = System.Drawing.Color.Gainsboro;
            this.btnAdd.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.IconChar = FontAwesome.Sharp.IconChar.Plus;
            this.btnAdd.IconColor = System.Drawing.Color.Black;
            this.btnAdd.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btnAdd.IconSize = 20;
            this.btnAdd.Location = new System.Drawing.Point(8, 8);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 0;
            this.btnAdd.Text = "Add";
            this.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // itemCodeDataGridViewTextBoxColumn
            // 
            this.itemCodeDataGridViewTextBoxColumn.DataPropertyName = "Item_Code";
            this.itemCodeDataGridViewTextBoxColumn.HeaderText = "Code";
            this.itemCodeDataGridViewTextBoxColumn.Name = "itemCodeDataGridViewTextBoxColumn";
            // 
            // newBarCodeDataGridViewTextBoxColumn
            // 
            this.newBarCodeDataGridViewTextBoxColumn.DataPropertyName = "NewBarCode";
            this.newBarCodeDataGridViewTextBoxColumn.HeaderText = "BarCode";
            this.newBarCodeDataGridViewTextBoxColumn.Name = "newBarCodeDataGridViewTextBoxColumn";
            // 
            // productionOrderNoDataGridViewTextBoxColumn
            // 
            this.productionOrderNoDataGridViewTextBoxColumn.DataPropertyName = "ProductionOrderNo";
            this.productionOrderNoDataGridViewTextBoxColumn.HeaderText = "Production Order No";
            this.productionOrderNoDataGridViewTextBoxColumn.Name = "productionOrderNoDataGridViewTextBoxColumn";
            // 
            // barCodeDataGridViewTextBoxColumn
            // 
            this.barCodeDataGridViewTextBoxColumn.DataPropertyName = "BarCode";
            this.barCodeDataGridViewTextBoxColumn.HeaderText = "Old BarCode";
            this.barCodeDataGridViewTextBoxColumn.Name = "barCodeDataGridViewTextBoxColumn";
            // 
            // descriptionDataGridViewTextBoxColumn
            // 
            this.descriptionDataGridViewTextBoxColumn.DataPropertyName = "Description";
            this.descriptionDataGridViewTextBoxColumn.HeaderText = "Description";
            this.descriptionDataGridViewTextBoxColumn.Name = "descriptionDataGridViewTextBoxColumn";
            // 
            // theoreticalMassDataGridViewTextBoxColumn
            // 
            this.theoreticalMassDataGridViewTextBoxColumn.DataPropertyName = "Theoretical_Mass";
            this.theoreticalMassDataGridViewTextBoxColumn.HeaderText = "Theoretical Mass";
            this.theoreticalMassDataGridViewTextBoxColumn.Name = "theoreticalMassDataGridViewTextBoxColumn";
            // 
            // uOMDataGridViewTextBoxColumn
            // 
            this.uOMDataGridViewTextBoxColumn.DataPropertyName = "UOM";
            this.uOMDataGridViewTextBoxColumn.HeaderText = "UOM";
            this.uOMDataGridViewTextBoxColumn.Name = "uOMDataGridViewTextBoxColumn";
            // 
            // permittedTolUpperDataGridViewTextBoxColumn
            // 
            this.permittedTolUpperDataGridViewTextBoxColumn.DataPropertyName = "Permitted_Tol_Upper__";
            this.permittedTolUpperDataGridViewTextBoxColumn.HeaderText = "Permitted_Tol_Upper";
            this.permittedTolUpperDataGridViewTextBoxColumn.Name = "permittedTolUpperDataGridViewTextBoxColumn";
            // 
            // permittedTolLowerDataGridViewTextBoxColumn
            // 
            this.permittedTolLowerDataGridViewTextBoxColumn.DataPropertyName = "Permitted_Tol_Lower__";
            this.permittedTolLowerDataGridViewTextBoxColumn.HeaderText = "Permitted_Tol_Lower";
            this.permittedTolLowerDataGridViewTextBoxColumn.Name = "permittedTolLowerDataGridViewTextBoxColumn";
            // 
            // fixedDataGridViewTextBoxColumn
            // 
            this.fixedDataGridViewTextBoxColumn.DataPropertyName = "Fixed";
            this.fixedDataGridViewTextBoxColumn.HeaderText = "Fixed";
            this.fixedDataGridViewTextBoxColumn.Name = "fixedDataGridViewTextBoxColumn";
            // 
            // weightDataGridViewTextBoxColumn
            // 
            this.weightDataGridViewTextBoxColumn.DataPropertyName = "Weight";
            this.weightDataGridViewTextBoxColumn.HeaderText = "Weight";
            this.weightDataGridViewTextBoxColumn.Name = "weightDataGridViewTextBoxColumn";
            // 
            // iTEMMASTERBindingSource
            // 
            this.iTEMMASTERBindingSource.DataSource = typeof(WeighCon.ITEMMASTER);
            this.iTEMMASTERBindingSource.CurrentChanged += new System.EventHandler(this.iTEMMASTERBindingSource_CurrentChanged);
            // 
            // frmItemMaster
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1213, 675);
            this.Controls.Add(this.panelItemMaster);
            this.Name = "frmItemMaster";
            this.Text = "Item Master";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmItemMaster_FormClosing);
            this.Load += new System.EventHandler(this.frmItemMaster_Load);
            this.panelItemMaster.ResumeLayout(false);
            this.GroupBox1.ResumeLayout(false);
            this.GroupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtItemMaster)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.iTEMMASTERBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelItemMaster;
        internal System.Windows.Forms.GroupBox GroupBox1;
        internal System.Windows.Forms.TextBox txtBarcode;
        internal System.Windows.Forms.TextBox txtDescription;
        internal System.Windows.Forms.Label Label3;
        internal System.Windows.Forms.TextBox txtUnitofMass;
        internal System.Windows.Forms.TextBox txtStandardMass;
        internal System.Windows.Forms.TextBox txtTolenceNegative;
        internal System.Windows.Forms.Label Label7;
        internal System.Windows.Forms.TextBox txtTolencePositive;
        internal System.Windows.Forms.Label Label5;
        internal System.Windows.Forms.Label Label6;
        internal System.Windows.Forms.TextBox txtItemcode;
        internal System.Windows.Forms.Label Label4;
        internal System.Windows.Forms.Label Label2;
        internal System.Windows.Forms.Label Label1;
        internal System.Windows.Forms.TextBox txtProdOrderNO1;
        internal System.Windows.Forms.TextBox txtProdOrderNO;
        internal System.Windows.Forms.TextBox txtOldBarcode;
        internal System.Windows.Forms.Label label10;
        internal System.Windows.Forms.Label label8;
        internal System.Windows.Forms.Label label9;
        internal System.Windows.Forms.TextBox txtFixedMass;
        internal System.Windows.Forms.Label label11;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.CheckBox chkFixed;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.DataGridView dtItemMaster;
        private FontAwesome.Sharp.IconButton btnEdit;
        private FontAwesome.Sharp.IconButton btnCancel;
        private FontAwesome.Sharp.IconButton btnDelete;
        private FontAwesome.Sharp.IconButton btnAdd;
        private System.Windows.Forms.BindingSource iTEMMASTERBindingSource;
        private System.Windows.Forms.DataGridViewTextBoxColumn itemCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn newBarCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn productionOrderNoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn barCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn descriptionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn theoreticalMassDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn uOMDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn permittedTolUpperDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn permittedTolLowerDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn fixedDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn weightDataGridViewTextBoxColumn;
    }
}