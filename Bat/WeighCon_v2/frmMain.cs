using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Forms;
using FontAwesome.Sharp;
using Sharp7;

namespace WeighCon
{
    public partial class frmMain : Form
    {
        //PLC
        private S7Client Client;
        private byte[] Buffer = new byte[65536];
        private byte[] DB_A = new byte[1024];
        private byte[] DB_B = new byte[1024];
        private byte[] DB_C = new byte[1024];

        private double currentweight=0;

        //Fields
        private int borderSize = 2;
        public int intPanel;//1...scanner..2...scale...3...printer....4...alert
        private Size formSize; //Keep form size when it is minimized and restored.Since the form is resized because it takes into account the size of the title bar and borders.
        private Form currentChildForm;
        int count = 10;
        public frmMain(string strUser)
        {
            InitializeComponent();
            CollapseMenu();
            lblTitleChildForm.Text = "Home";
            this.Padding = new Padding(borderSize);//Border size
            this.BackColor = Color.FromArgb(41, 128, 185);//Border color
            lblLogintym.Text = DateTime.Now.ToString();
            lblUsername.Text = strUser.ToUpper();
            txtMassStatus.Text = "OVERWEIGHT";
            txtMassStatus.ForeColor = Color.Red;
        }
        //Drag Form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);
        private void panelTitleBar_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
        //Overridden methods
        protected override void WndProc(ref Message m)
        {
            const int WM_NCCALCSIZE = 0x0083;//Standar Title Bar - Snap Window
            const int WM_SYSCOMMAND = 0x0112;
            const int SC_MINIMIZE = 0xF020; //Minimize form (Before)
            const int SC_RESTORE = 0xF120; //Restore form (Before)
            const int WM_NCHITTEST = 0x0084;//Win32, Mouse Input Notification: Determine what part of the window corresponds to a point, allows to resize the form.
            const int resizeAreaSize = 10;

            #region Form Resize
            // Resize/WM_NCHITTEST values
            const int HTCLIENT = 1; //Represents the client area of the window
            const int HTLEFT = 10;  //Left border of a window, allows resize horizontally to the left
            const int HTRIGHT = 11; //Right border of a window, allows resize horizontally to the right
            const int HTTOP = 12;   //Upper-horizontal border of a window, allows resize vertically up
            const int HTTOPLEFT = 13;//Upper-left corner of a window border, allows resize diagonally to the left
            const int HTTOPRIGHT = 14;//Upper-right corner of a window border, allows resize diagonally to the right
            const int HTBOTTOM = 15; //Lower-horizontal border of a window, allows resize vertically down
            const int HTBOTTOMLEFT = 16;//Lower-left corner of a window border, allows resize diagonally to the left
            const int HTBOTTOMRIGHT = 17;//Lower-right corner of a window border, allows resize diagonally to the right

            ///<Doc> More Information: https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-nchittest </Doc>

            if (m.Msg == WM_NCHITTEST)
            { //If the windows m is WM_NCHITTEST
                base.WndProc(ref m);
                if (this.WindowState == FormWindowState.Normal)//Resize the form if it is in normal state
                {
                    if ((int)m.Result == HTCLIENT)//If the result of the m (mouse pointer) is in the client area of the window
                    {
                        Point screenPoint = new Point(m.LParam.ToInt32()); //Gets screen point coordinates(X and Y coordinate of the pointer)                           
                        Point clientPoint = this.PointToClient(screenPoint); //Computes the location of the screen point into client coordinates                          

                        if (clientPoint.Y <= resizeAreaSize)//If the pointer is at the top of the form (within the resize area- X coordinate)
                        {
                            if (clientPoint.X <= resizeAreaSize) //If the pointer is at the coordinate X=0 or less than the resizing area(X=10) in 
                                m.Result = (IntPtr)HTTOPLEFT; //Resize diagonally to the left
                            else if (clientPoint.X < (this.Size.Width - resizeAreaSize))//If the pointer is at the coordinate X=11 or less than the width of the form(X=Form.Width-resizeArea)
                                m.Result = (IntPtr)HTTOP; //Resize vertically up
                            else //Resize diagonally to the right
                                m.Result = (IntPtr)HTTOPRIGHT;
                        }
                        else if (clientPoint.Y <= (this.Size.Height - resizeAreaSize)) //If the pointer is inside the form at the Y coordinate(discounting the resize area size)
                        {
                            if (clientPoint.X <= resizeAreaSize)//Resize horizontally to the left
                                m.Result = (IntPtr)HTLEFT;
                            else if (clientPoint.X > (this.Width - resizeAreaSize))//Resize horizontally to the right
                                m.Result = (IntPtr)HTRIGHT;
                        }
                        else
                        {
                            if (clientPoint.X <= resizeAreaSize)//Resize diagonally to the left
                                m.Result = (IntPtr)HTBOTTOMLEFT;
                            else if (clientPoint.X < (this.Size.Width - resizeAreaSize)) //Resize vertically down
                                m.Result = (IntPtr)HTBOTTOM;
                            else //Resize diagonally to the right
                                m.Result = (IntPtr)HTBOTTOMRIGHT;
                        }
                    }
                }
                return;
            }
            #endregion

            //Remove border and keep snap window
            if (m.Msg == WM_NCCALCSIZE && m.WParam.ToInt32() == 1)
            {
                return;
            }

            //Keep form size when it is minimized and restored. Since the form is resized because it takes into account the size of the title bar and borders.
            if (m.Msg == WM_SYSCOMMAND)
            {
                /// <see cref="https://docs.microsoft.com/en-us/windows/win32/menurc/wm-syscommand"/>
                /// Quote:
                /// In WM_SYSCOMMAND messages, the four low - order bits of the wParam parameter 
                /// are used internally by the system.To obtain the correct result when testing 
                /// the value of wParam, an application must combine the value 0xFFF0 with the 
                /// wParam value by using the bitwise AND operator.
                int wParam = (m.WParam.ToInt32() & 0xFFF0);

                if (wParam == SC_MINIMIZE)  //Before
                    formSize = this.ClientSize;
                if (wParam == SC_RESTORE)// Restored form(Before)
                    this.Size = formSize;
            }
            base.WndProc(ref m);
        }
        private void frmMain_Resize(object sender, EventArgs e)
        {
            AdjustForm();
        }
        //Private methods
        private void AdjustForm()
        {
            switch (this.WindowState)
            {
                case FormWindowState.Maximized: //Maximized form (After)
                    this.Padding = new Padding(8, 8, 8, 0);
                    break;
                case FormWindowState.Normal: //Restored form (After)
                    if (this.Padding.Top != borderSize)
                        this.Padding = new Padding(borderSize);
                    break;
            }
        }
        private void OpenChildForm(Form childForm)
        {
            //open only form
            if (currentChildForm != null)
            {
                currentChildForm.Close();
            }
            currentChildForm = childForm;
            //End
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panelDesktop.Controls.Add(childForm);
            panelDesktop.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
            lblTitleChildForm.Text = childForm.Text;
        }
        private void iBtnMin_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
        private void iBtnMax_Click(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Normal)
            {
                formSize = this.ClientSize;
                this.WindowState = FormWindowState.Maximized;
            }
            else
            {
                this.WindowState = FormWindowState.Normal;
                this.Size = formSize;
            }
        }
        private void iBtnClose_Click(object sender, EventArgs e)
        {
            string message = "Do you want to close this system?";
            string title = "PrintPro";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            MessageBoxIcon Icon = MessageBoxIcon.Warning;
            DialogResult result = MessageBox.Show(message, title, buttons, Icon);
            if (result == DialogResult.Yes)
            {
                //Client.Disconnect();
                lblerror.Text = "Disconnected";
                Environment.Exit(Environment.ExitCode);
                Application.ExitThread();
                this.Close();
            }
            else
            {
                // Do something  
            }
        }
        private void iBtnMenu_Click(object sender, EventArgs e)
        {
            CollapseMenu();
        }
        private void CollapseMenu()
        {
            if (panelMenu.Width > 114) //Collapse menu
            {
                panelMenu.Width = 40;
                pictureBox1.Visible = false;
                iBtnMenu.Dock = DockStyle.Top;
                foreach (Button menuButton in panelMenu.Controls.OfType<Button>())
                {
                    menuButton.Text = "";
                    menuButton.ImageAlign = ContentAlignment.MiddleCenter;
                    menuButton.Padding = new Padding(0);
                }
            }
            else
            { //Expand menu
                panelMenu.Width = 115;
                pictureBox1.Visible = true;
                iBtnMenu.Dock = DockStyle.None;
                foreach (Button menuButton in panelMenu.Controls.OfType<Button>())
                {
                    menuButton.Text = "   " + menuButton.Tag.ToString();
                    menuButton.ImageAlign = ContentAlignment.MiddleLeft;
                    menuButton.Padding = new Padding(10, 0, 0, 0);
                }
            }
        }
        private void iBtnExit_Click(object sender, EventArgs e)
        {
            string message = "Do you want to close this system?";
            string title = "PrintPro";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            MessageBoxIcon Icon = MessageBoxIcon.Warning;
            DialogResult result = MessageBox.Show(message, title, buttons, Icon);
            if (result == DialogResult.Yes)
            {
                Client.Disconnect();
                lblerror.Text = "Disconnected";
                Environment.Exit(Environment.ExitCode);
                Application.ExitThread();
                this.Close();
            }
            else
            {
                // Do something  
            }
        }
        private void iBtnSettings_Click(object sender, EventArgs e)
        {
            OpenChildForm(new frmSettings());
        }
        private void iBtnHome_Click(object sender, EventArgs e)
        {
            if (currentChildForm != null)
            {
                currentChildForm.Close();
            }
            Reset();
        }
        private void Reset()
        {
            lblTitleChildForm.Text = "Home";
        }
        private void iBtnDataMaster_Click(object sender, EventArgs e)
        {
            OpenChildForm(new frmItemMaster());
        }
        private void iBtnReports_Click(object sender, EventArgs e)
        {
            OpenChildForm(new frmReports());
        }
        private void frmMain_Load(object sender, EventArgs e)
        {
            try
            {
                //Connect to PLC for scale
                int Result;
                Client = new S7Client();
                int Rack = System.Convert.ToInt32(ConfigurationManager.AppSettings["wplcRack"]);
                int Slot = System.Convert.ToInt32(ConfigurationManager.AppSettings["wplcSlot"]);
                Result = Client.ConnectTo(ConfigurationManager.AppSettings["wplcIP"], Rack, Slot);
                ShowResult(Result);
                if (Result == 0)
                {
                    lblerror.Text = lblerror.Text + " PDU Negotiated : " + Client.PduSizeNegotiated.ToString();
                    //TxtIP.Enabled = false;
                    //TxtRack.Enabled = false;
                    //TxtSlot.Enabled = false;
                    //ConnectBtn.Enabled = false;
                    //DisconnectBtn.Enabled = true;
                    //tabControl.Enabled = true;
                    Task.Factory.StartNew(() => ReadArea(), TaskCreationOptions.LongRunning);

                }
            }
            catch (Exception ex)
            { lblerror.Text = " PDU NOT Negotiated : " + ex.Message.ToString(); }

            //ReadInputs();
            ////Scanner
            //Thread scannerThrd = new Thread(new ThreadStart(ScannerDataReceive));
            //scannerThrd.Start();
            //Scale
            Thread scaleThrd = new Thread(new ThreadStart(ScaleDataReceive));
            scaleThrd.Start();
        }
        private void ReadArea()
        {
            // Declaration separated from the code for readability
            int DBNumber;
            int Amount;
            int SizeRead = 0;
            int Result;
            int[] Area =
            {
                 S7Consts.S7AreaPE,
                 S7Consts.S7AreaPA,
                 S7Consts.S7AreaMK,
                 S7Consts.S7AreaDB,
                 S7Consts.S7AreaCT,
                 S7Consts.S7AreaTM
            };
            int[] WordLen =
            {
                 S7Consts.S7WLBit,
                 S7Consts.S7WLByte,
                 S7Consts.S7WLChar,
                 S7Consts.S7WLWord,
                 S7Consts.S7WLInt,
                 S7Consts.S7WLDWord,
                 S7Consts.S7WLDInt,
                 S7Consts.S7WLReal,
                 S7Consts.S7WLCounter,
                 S7Consts.S7WLTimer
            };

            DBNumber = 1;// System.Convert.ToInt32(TxtDB.Text);
            Amount = 1;// System.Convert.ToInt32(TxtSize.Text);
            while (true)
            {
                Result = Client.ReadArea(Area[3], DBNumber, 0, Amount, WordLen[1], Buffer, ref SizeRead);

                ShowResult(Result);
                //label4.Text = SizeRead.ToString();
                if (Result == 0)
                    HexDump(label15, Buffer, SizeRead);
               Thread.Sleep(1000);
            }
        }
        private void HexDump(Label DumpBox, byte[] bytes, int Size)
        {
            if (bytes == null)
                return;
            int bytesLength = Size;
            int bytesPerLine = 16;

            char[] HexChars = "0123456789ABCDEF".ToCharArray();

            int firstHexColumn =
                  8                   // 8 characters for the address
                + 3;                  // 3 spaces

            int firstCharColumn = firstHexColumn
                + bytesPerLine * 3       // - 2 digit for the hexadecimal value and 1 space
                + (bytesPerLine - 1) / 8 // - 1 extra space every 8 characters from the 9th
                + 2;                  // 2 spaces 

            int lineLength = firstCharColumn
                + bytesPerLine           // - characters to show the ascii value
                + Environment.NewLine.Length; // Carriage return and line feed (should normally be 2)

            char[] line = (new String(' ', lineLength - 2) + Environment.NewLine).ToCharArray();
            int expectedLines = (bytesLength + bytesPerLine - 1) / bytesPerLine;
            StringBuilder result = new StringBuilder(expectedLines * lineLength);

            for (int i = 0; i < bytesLength; i += bytesPerLine)
            {
                line[0] = HexChars[(i >> 28) & 0xF];
                line[1] = HexChars[(i >> 24) & 0xF];
                line[2] = HexChars[(i >> 20) & 0xF];
                line[3] = HexChars[(i >> 16) & 0xF];
                line[4] = HexChars[(i >> 12) & 0xF];
                line[5] = HexChars[(i >> 8) & 0xF];
                line[6] = HexChars[(i >> 4) & 0xF];
                line[7] = HexChars[(i >> 0) & 0xF];

                int hexColumn = firstHexColumn;
                int charColumn = firstCharColumn;

                for (int j = 0; j < bytesPerLine; j++)
                {
                    if (j > 0 && (j & 7) == 0) hexColumn++;
                    if (i + j >= bytesLength)
                    {
                        line[hexColumn] = ' ';
                        line[hexColumn + 1] = ' ';
                        line[charColumn] = ' ';
                    }
                    else
                    {
                        byte b = bytes[i + j];
                        line[hexColumn] = HexChars[(b >> 4) & 0xF];
                        line[hexColumn + 1] = HexChars[b & 0xF];
                        line[charColumn] = (b < 32 ? '·' : (char)b);
                    }
                    hexColumn += 3;
                    charColumn++;
                }
                result.Append(line);
            }
            if (this.lblerror.InvokeRequired)
            {
                this.lblerror.BeginInvoke((MethodInvoker)delegate ()
                {
                    string r = result.ToString().Replace(" ", "").Trim();
                    string hl = r.Substring(r.Length - 2, 1);
                    DumpBox.Text = hl;
                    if (hl.Contains("1") && sighnalhigh == false)
                    {
                        sighnalhigh = true;
                        txtGrossMass.Text = currentweight.ToString();
                        ///TODO send datat to printer with current weight

                        ///TODO Set below to false
                        sighnalhigh = false;
                    }
                    else
                        txtGrossMass.Text = "0";
                });
            }
            else
            {
                DumpBox.Text = result.ToString();//.Substring(result.ToString().Length - 2);
            }
        }
        Boolean sighnalhigh = false;
        private void ScaleDataReceive()
        {
            //Action<string> DelegateTeste_ModifyText = THREAD_MOD_SCALE;
            //IPAddress ipAddress = IPAddress.Any;//.Parse(ConfigurationManager.AppSettings["wIP"]);
            //int port = int.Parse(ConfigurationManager.AppSettings["wPort"]);
            //TcpListener wlistener = new TcpListener(ipAddress, port );
            //try
            //{

            //    pnlScale.BackColor = Color.LimeGreen;
            //    Invoke(DelegateTeste_ModifyText, "Starting TCP listener...");
            //    wlistener.Start();
            //    while (true)
            //    {
            //        string data = null;
            //        // Accept incoming connection that matches IP / Port number
            //        // We need some form of security here later
            //        TcpClient client = wlistener.AcceptTcpClient();

            //        if (client.Connected)
            //        {

            //            // Get the stream of data send by the server and create a buffer of data we can read
            //            NetworkStream stream = client.GetStream();
            //            byte[] buffer = new byte[client.ReceiveBufferSize];

            //            int bytesRead = stream.Read(buffer, 0, client.ReceiveBufferSize);

            //            // Convert the data recieved into a string
            //            data = Encoding.ASCII.GetString(buffer, 0, bytesRead);
            //            txtGrossMass.Text = data;
            //        }
            //        client.Close();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    SoftBlink(pnlScale, Color.FromArgb(255, 255, 255), Color.Red, 2000, true);
            //    Invoke(DelegateTeste_ModifyText, wlistener.LocalEndpoint + " : " + ex.Message);
            //    ErrorHandler.GetExceptionMessage(ex);
            //    System.Threading.Thread.Sleep(5000);
            //}



            IPHostEntry host = Dns.GetHostEntry("localhost");
            IPAddress ipAddress = IPAddress.Parse(ConfigurationManager.AppSettings["wIP"]);// host.AddressList[0];
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, int.Parse(ConfigurationManager.AppSettings["wPort"]));

string data = null;
                byte[] bytes = null;
            try
            {

                // Create a Socket that will use Tcp protocol      
                Socket listener =  new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                // A Socket must be associated with an endpoint using the Bind method  
               //listener.Bind(localEndPoint);
                listener.Connect(localEndPoint);
                // Specify how many requests a Socket can listen before it gives Server busy response.  
                // We will listen 10 requests at a time  
                //listener.Listen(10);

                Console.WriteLine("Waiting for a connection...");
                //Socket handler = listener.Connect();

                // Incoming data from the client.    
                

                while (true)
                {
                    try
                    {
                        bytes = new byte[1024];
                        int bytesRec = listener.Receive(bytes);
                        data = Encoding.ASCII.GetString(bytes, 0, bytesRec);
                        currentweight = double.Parse(data.Trim());

                        if (data.IndexOf("<EOF>") > -1)
                        {
                            break;
                        }
                    }
                    catch (Exception ex)
                    { }
                }

                Console.WriteLine("Text received : {0}", data);

                //byte[] msg = Encoding.ASCII.GetBytes(data);
                //handler.Send(msg);
                //handler.Shutdown(SocketShutdown.Both);
                //handler.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine("\n Press any key to continue...");
            //Console.ReadKey();
        }
    
        private async void SoftBlink(Control ctrl, Color c1, Color c2, short CycleTime_ms, bool BkClr)
        {
            var sw = new Stopwatch(); sw.Start();
            short halfCycle = (short)Math.Round(CycleTime_ms * 0.5);
            while (true)
            {
                await Task.Delay(1);
                var n = sw.ElapsedMilliseconds % CycleTime_ms;
                var per = (double)Math.Abs(n - halfCycle) / halfCycle;
                var red = (short)Math.Round((c2.R - c1.R) * per) + c1.R;
                var grn = (short)Math.Round((c2.G - c1.G) * per) + c1.G;
                var blw = (short)Math.Round((c2.B - c1.B) * per) + c1.B;
                var clr = Color.FromArgb(red, grn, blw);
                if (BkClr) ctrl.BackColor = clr; else ctrl.ForeColor = clr;
            }
        }
        private void ScannerDataReceive()
        {
            Action<string> DelegateTeste_ModifyText = THREAD_MOD_SCAN;
            IPAddress ipAddress = IPAddress.Parse(ConfigurationManager.AppSettings["sIP"]);
            TcpListener slistener = new TcpListener(ipAddress, int.Parse(ConfigurationManager.AppSettings["sPort"]));
            try
            {
                Invoke(DelegateTeste_ModifyText, "Starting TCP listener...");
                slistener.Start();
                Invoke(DelegateTeste_ModifyText, "Server waiting connections!");

                while (true)
                {
                    string data = null;
                    // Accept incoming connection that matches IP / Port number
                    // We need some form of security here later
                    TcpClient client = slistener.AcceptTcpClient();

                    if (client.Connected)
                    {

                        // Get the stream of data send by the server and create a buffer of data we can read
                        NetworkStream stream = client.GetStream();
                        byte[] buffer = new byte[client.ReceiveBufferSize];

                        int bytesRead = stream.Read(buffer, 0, client.ReceiveBufferSize);

                        // Convert the data recieved into a string
                        data = Encoding.ASCII.GetString(buffer, 0, bytesRead);
                        ErrorHandler.WriteLog("camera", data);
                        if (data.Contains("NoRead"))
                        { txtBarcodeInput.Text = "NoRead"; }
                        else
                        {
                            data = data.Substring(6, 7);
                            txtBarcodeInput.Text = data;
                        }


                        ReadInputs();
                        //Console.WriteLine("Recieved Data: " + data);
                    }
                    client.Close();
                }

            }
            catch (Exception ex)
            {
                SoftBlink(pnlScanner, Color.FromArgb(255, 255, 255), Color.Red, 2000, true);
                Invoke(DelegateTeste_ModifyText, slistener.LocalEndpoint + " : " + ex.Message);
                ErrorHandler.GetExceptionMessage(ex);
                //System.Threading.Thread.Sleep(5000);

            }
        }
        private void THREAD_MOD_SCAN(string Status)
        {
            //lblScanStatus.Text += Environment.NewLine + Status;
            lblerror.Text = Status;
        }
        private void THREAD_MOD_SCALE(string Status)
        {
            //lblScaleStatus.Text =  Status;
        }
        private void THREAD_MOD_PRINT(string Status)
        {
            //lblPrintStatus.Text = Status;
        }
        private void UpdateTextBoxes(string text)
        {
            txtBarcodeInput.Text = string.Empty;
            txtBarcodeInput.Text = string.Empty;
            this.txtItemCode.Text = string.Empty;
            this.txtDescription.Text = string.Empty;
            this.txtTheoriticalmass.Text = string.Empty;
            this.txtToleLower.Text = string.Empty;
            this.txtToleUpper.Text = string.Empty;
            this.txtScaleStUpper.Text = string.Empty;
            this.txtScaleStLower.Text = string.Empty;
            this.txtMassStatus.Text = string.Empty;
            try
            {
                if (text.Contains("HeartBeat"))
                {
                    txtBarcodeInput.ForeColor = Color.Green;
                    txtBarcodeInput.Text = "Camera ---->  READY MODE";
                }
                else if (text.Contains("NoRead"))
                {
                    txtBarcodeInput.ForeColor = Color.Red;
                    txtBarcodeInput.Text = "NO READ";
                    //txtShortCode.Text = " ";
                    //itemscanned = true;
                    //log("Nothing read");
                    //readInputs();
                }
                else
                {
                    txtBarcodeInput.ForeColor = Color.Green;
                    var d = text.Split('C');
                    if (d.Count() > 2)
                    {
                        foreach (string dd in d)
                        {
                            try
                            {
                                if (dd.Length > 15)
                                {
                                    txtBarcodeInput.Text = dd.Substring(4, 8);
                                }

                                if (dd.Length < 15 & dd.Length > 8)
                                {
                                    //txtShortCode.Text = dd.Substring(3, 7);
                                }
                            }
                            catch (Exception ex)
                            {
                            }
                        }

                        //itemscanned = true;
                        //readInputs();
                    }
                    else
                    {
                        //txtShortCode.Text = text.Substring(5, 7);
                        //txtBarcodeInput.Text = text.Substring(6, 8);
                        //itemscanned = true;
                        //readInputs();
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorHandler.GetExceptionMessage(ex);
            }
        }
        private bool isAsciiChar(char c)
        {
            //byte valOfChar = (byte)Strings.AscW(c);
            //if (valOfChar >= 32 && valOfChar < 128 || valOfChar == 0xD || valOfChar == 0xA)
            //{
            //    return true;
            //}

            return false;
        }
        private void ReadInputs()
        {
            using (WEIGHCONEntities db = new WEIGHCONEntities())
            {
                var data = db.ITEMMASTERs.Where(t => t.NewBarCode == txtBarcodeInput.Text || t.ProductionOrderNo == txtBarcodeInput.Text).FirstOrDefault();

                if (data != null)
                {
                    txtItemCode.Text = data.Item_Code;
                    txtDescription.Text = data.Description;
                    txtTheoriticalmass.Text = data.Theoretical_Mass.ToString();
                    txtToleLower.Text = data.Permitted_Tol_Lower__.ToString();
                    txtToleUpper.Text = data.Permitted_Tol_Upper__.ToString();
                    txtScaleStUpper.Text = (data.Theoretical_Mass + (data.Theoretical_Mass * data.Permitted_Tol_Upper__ / 100)).ToString();
                    txtScaleStLower.Text = (data.Theoretical_Mass + (data.Theoretical_Mass * data.Permitted_Tol_Lower__ / 100)).ToString();
                    //txtBarcodeInput.Text = reader("NewBarCode")
                    txtNetMassfixed.Text = data.Weight.ToString();
                    chkFixed.Checked = (bool)data.Fixed;


                }
                else
                {
                    txtItemCode.Text = ConfigurationManager.AppSettings["Unknown_Code"];
                    txtDescription.Text = ConfigurationManager.AppSettings["Unknown_Description"];
                    txtTheoriticalmass.Text = string.Empty;
                    txtToleLower.Text = string.Empty;
                    txtToleUpper.Text = string.Empty;
                    txtScaleStUpper.Text = string.Empty;
                    txtScaleStLower.Text = string.Empty;
                    //txtBarcodeInput.Text = reader("NewBarCode")
                    txtNetMassfixed.Text = string.Empty;
                    chkFixed.Checked = false;
                }
            }


        }
        private int? GetNextSerialNo()
        {

            using (WEIGHCONEntities db = new WEIGHCONEntities())
            {
                int? Serial;
                return Serial = db.ITEMLOGs.Max(d => (int?)d.ID);

            }

        }

        private void PrintReject(string massStatus, string currentshift, string ItemCode, string ItemSerial, string ItemMass, string barCode)
        {
            string printDATA = string.Empty;
            string year = DateTime.Parse(DateTime.Now.ToString()).Year.ToString();
            string printerType = ConfigurationManager.AppSettings["printerType"];
            string labelName = ConfigurationManager.AppSettings["labelName"];
            DateTime time = DateTime.Now;
            CultureInfo culture = CultureInfo.InvariantCulture;
            int weekNum = culture.Calendar.GetWeekOfYear(DateTime.Now,
            CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            string dayOfWeek = time.DayOfWeek.ToString();
            string hourMin = time.ToString("HH:mm");

            switch (printerType)
            {
                case "1":
                    printDATA = "^UV0|1|8|0|" + dayOfWeek + "|1|" + currentshift + "|2|" + year + "|3|" + weekNum.ToString() + "|4|" + ItemCode + "|5|" + hourMin + "|6|" + ItemMass + "|7|" + ItemSerial + "|";
                    break;
                case "2":
                    printDATA = "~JS0|" + labelName + "|1|Field000|" + dayOfWeek + "|Field001|" + currentshift + "|Field002|" + year + "|Field003|" + weekNum.ToString() + "|Field004|" + ItemCode + "|Field005|" + hourMin + "|Field006|" + ItemMass + "|Field007|" + ItemSerial + "|";
                    break;
                case "3":
                    printDATA = "";
                    break;
            }
            //Log Data

            //Rejection
            switch (massStatus)
            {
                case "O":
                    break;
                case "U":
                    break;
                case "N":
                    break;
            }

        }

        private void logData(string massStatus, string currentshift, string ItemCode, string ItemSerial, decimal ItemMass, string barCode, string dayofweek, string shift, string year, string hourmin)
        {
            using (WEIGHCONEntities db = new WEIGHCONEntities())
            {
                ITEMLOG dt = new ITEMLOG();
                dt.Barcode = barCode;
                dt.Dayofweek = dayofweek;
                dt.itemcode = ItemCode;
                dt.Mass = ItemMass;
                dt.Shift = shift;
                dt.STATUS = massStatus;
                dt.Year = year;
                dt.Time = DateTime.Now;
                db.ITEMLOGs.Add(dt);
                db.SaveChanges();
            }
        }
        private void ShowResult(int Result)
        {
            // This function returns a textual explaination of the error code
            if (this.lblerror.InvokeRequired)
            {
                this.lblerror.BeginInvoke((MethodInvoker)delegate ()
                {
                    lblerror.Text = Client.ErrorText(Result);
                });
            }
            else
            { lblerror.Text = Client.ErrorText(Result); }
            if (Result == 0)
                if (this.lblerror.InvokeRequired)
                {
                    this.lblerror.BeginInvoke((MethodInvoker)delegate ()
                    {
                        lblerror.Text = lblerror.Text + " (" + Client.ExecutionTime.ToString() + " ms)";
                    });
                }
                else
                { lblerror.Text = lblerror.Text + " (" + Client.ExecutionTime.ToString() + " ms)"; }
        }

        private void label15_Click(object sender, EventArgs e)
        {

        }
    }

}
