package com.trimline.pawdep;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Handler;
import android.os.ParcelUuid;
import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.UUID;

import static com.trimline.pawdep.Printer.printer.printThread;
import static com.trimline.pawdep.Printer.printer.printerdevice;
import static com.trimline.pawdep.Printer.printer.printerout;
import static com.trimline.pawdep.Printer.printer.printersock;


/**
 * Created by Paul on 09-Oct-16.
 */

public class Printer {
    public static class reportfields {
        public String field;
        public String value;

    }

    public static class collectiondates {
        public String date;
        public int Count;
        public Double Total;

        public String MemberNo;
        public String MemberName;

        public String toString() {
            return this.date;
        }
    }
    public  static class getdata{
        public  String firstdate;
        public  String LastDate;
        public String user;

    }
    public static class Receipts {
        public String date;
        public String receipt;
        public int Count;
        public Double Total;
        public String No;
        public String Name;
        public String user;

        public String toString() {
            return this.date;
        }
    }

    public static class reportheader {
        public String Name;
        public int Count;
        public Double Total;
    }

    static Handler mHandler = null;


    public static boolean createBond(BluetoothDevice btDevice)
            throws Exception {
        Class class1 = Class.forName("android.bluetooth.BluetoothDevice");
        Method createBondMethod = class1.getMethod("createBond");
        Boolean returnValue = (Boolean) createBondMethod.invoke(btDevice);
        return returnValue.booleanValue();
    }


    public static class Printerthread extends Thread {
        private BluetoothSocket pSocket;
        SharedPreferences preferences;

        public Printerthread(SharedPreferences s) {
            try {
                preferences = s;
                printThread = this;
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        public void run() {
            byte[] pbuffer = new byte[1024];
            int pbytes = 0;
            int pbegin = 0;
            // Make a connection to the BluetoothSocket
            while (true) {
                try {
                    Log.i("thread", "running");
                    String value = preferences.getString("PRINTER", "");
//                BluetoothDevice prnt = BluetoothAdapter.getDefaultAdapter().                        getRemoteDevice("00:02:0A:02:60:10");
                    if (!value.equals("")) {
                        BluetoothAdapter ad = BluetoothAdapter.getDefaultAdapter();
                        if (ad != null) {
                            if (!ad.isEnabled())
                                ad.enable();
                            BluetoothDevice prnt = ad.getRemoteDevice(value);
                            ParcelUuid[] uuds = prnt.getUuids();
                            if (uuds != null)
                                for (ParcelUuid u : uuds
                                        ) {
                                    UUID pa = u.getUuid();
                                    Log.i("Device uuid", pa.toString());
                                }
                            printerdevice = prnt;
                            Method m = prnt.getClass().getMethod("createRfcommSocket",
                                    int.class);
                            printersock = (BluetoothSocket) m.invoke(prnt, Integer.valueOf(1));
                            try {
                                Thread.sleep(1000);
                                printersock.connect();
                            } catch (IOException ex) {
                                BluetoothConnector bc;
                                final UUID MY_UUID_SECURE =
                                        UUID.fromString("fa87c0d0-afac-11de-8a39-0800200c9a66");
                                List<UUID> ids = new ArrayList<>();
                                UUID id = MY_UUID_SECURE;
                                ids.add(id);
                                bc = new BluetoothConnector(prnt, true, ad, ids);
                                Thread.sleep(1000);
                                printersock = bc.connect();
                            }
                            mHandler.obtainMessage(Constants.PRINTER_CONNECTED, true).sendToTarget();
                            pSocket = printersock;

                            printerout = pSocket.getOutputStream();
                            Log.i("thread", "printer connected");
                            //return;
                   try {
                                while (printersock.isConnected()){
                                    Log.i("thread", "printer connected");
                                    sleep(2000);
                                }

                               // mHandler.obtainMessage(Constants.PRINTER_DISCONNECTED, true).sendToTarget();

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else
                            mHandler.obtainMessage(Constants.MESSAGE_TOAST, "No bluetooth found").sendToTarget();

                    } else return;
                } catch (Exception ex) {
                    ex.printStackTrace();

                }

            }
            // Reset the ConnectThread because we're done


            // Start the connected thread
        }

        public void write(byte[] buffer) {
            try {
                printerout.write(buffer);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void write(int buffer) {
            try {
                printerout.write(buffer);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void flush() {
            try {
                printerout.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        public void cancel() {
            try {
                pSocket.close();
                printerout.close();
            } catch (IOException e) {

            }
        }
    }


    public static class printer {
        public static BluetoothSocket printersock;
        public static OutputStream printerout;
        public static Printerthread printThread;
        public static BluetoothDevice printerdevice;

        public void writetoprinter(byte[] out) {
            // Create temporary object
            Printerthread r;
            // Synchronize a copy of the ConnectedThread
            synchronized (this) {

                r = printThread;
            }
            // Perform the write unsynchronized
            r.write(out);
        }

        public void writetoprinter(int out) {
            // Create temporary object
            Printerthread r;
            // Synchronize a copy of the ConnectedThread
            synchronized (this) {

                r = printThread;
            }
            // Perform the write unsynchronized
            r.write(out);
        }

        public void flushprinter() {
            // Create temporary object
            Printerthread r;
            // Synchronize a copy of the ConnectedThread
            synchronized (this) {

                r = printThread;
            }
            // Perform the write unsynchronized
            r.flush();
        }

        public void printcollection( Member m) {
            try {
                //Professional Center, 3rd Floor, next to KCB bank, Kiambu
                //      +254 715 792111
                // info[at]pawdep.org

                byte[] left = new byte[]{0x1b, 0x61, 0x00};
                byte[] center = new byte[]{0x1b, 0x61, 0x01};
                byte[] right = new byte[]{0x1b, 0x61, 0x02};
                byte[] clear = new byte[]{0x1b, 0x40};

                String head;
                head = "PAMOJA WOMEN DEVELOPMENT(PAWDEP)\n";
                head += "Professional Center, 3rd Floor \n";
                head += "    next to KCB bank,Kiambu   \n";
                head += "P.O. Box 2472 00100   \n";
                head += "     Nairobi, Kenya   \n";
                head += "Tel: (+254) (0)66 202 2205  \n";
                head += "     (+254) (0)20 238 3881  \n";
                head += "     (+254) (0)715 792 111  \n";
                head += "Email:info@pawdep.org  \n";
                head += "     customercare[at]pawdep.org \n";
                head += "--------------------------------\n";
                head += "      GROUP MEMBER PERFORMANCE   \n";

                String data = "";

                data = "--------------------------------\n";
                data += "Group:   " + m.Group_Name + "\n";
                data += "Ref:   " + m.Transaction_No + "\n";

                data += String.format("M. No:%s (%s) ", m.No, m.GID) + "\n";
                data += "Name:  " + m.Name + "\n";
                data += "Date:  " + m.StringDate + "\n";

                String header, value;
                String space = "";
                data += "--------------------------------\n\n";
                header = "Trans Type";
                value = "Amount";

                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                //   data += "Trans Type            Amount\n";
                //data += "1234567890123456789012345678901234567890\n";


                data += "--------------------------------\n";

                if ((m.Advance_Principle_Paid) > 0) {
                    header = "Adv. Principal:";
                    value = String.format("%,.2f", m.Advance_Principle_Paid);

                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

                }

                if ((m.Advance_Interest_Paid) > 0) {

                    header = "Adv. Interest:";
                    value = String.format("%,.2f", m.Advance_Interest_Paid);

                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                if ((m.Advance_Penalty) > 0) {

                    header = "Adv. Penalty:";
                    value = String.format("%,.2f", m.Advance_Penalty);

                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                // data += "Adv. Interest       :" + (String.format("%,.2f", m.Advance_Interest_Paid)) + "\n";
                if ((m.Advance_Fees) > 0) {
                    header = "Advance Fees:";
                    value = String.format("%,.2f", m.Advance_Fees);

                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                // data += "Advance Fees        :" + String.format("%,.2f", m.Advance_Fees) + "\n";
                if ((m.Principle_Paid) > 0) {
                    header = "Principal Paid:";
                    value = String.format("%,.2f", m.Principle_Paid);
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                //data += "Principal Paid      :" + String.format("%,.2f", m.Principle_Paid) + "\n";
                if ((m.Interest_Paid) > 0) {
                    header = "Interest Paid:";
                    value = String.format("%,.2f", m.Interest_Paid);
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                //data += "Interest Paid       :" + String.format("%,.2f", m.Interest_Paid) + "\n";
                if ((m.Penalty) > 0) {
                    header = "Penalty :";
                    value = String.format("%,.2f", m.Penalty);
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                //data += "Penalty             :" + String.format("%,.2f", m.Penalty) + "\n";
                if ((m.Monthly_Savings) > 0) {
                    header = "Savings :";
                    value = String.format("%,.2f", m.Monthly_Savings);
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                //data += "Savings             :" + String.format("%,.2f", m.Monthly_Savings) + "\n";
                if ((m.Hall) > 0) {
                    header = "Hall:";
                    value = String.format("%,.2f", m.Hall);
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                //data += "Hall                :" + String.format("%,.2f", m.Hall) + "\n";
                if ((m.othertrans.stream().mapToDouble(o -> o.Amount)).sum() > 0) {
                    header = "Other Transactions:";
                    value = String.format("%,.2f", m.othertrans.stream().mapToDouble(o -> o.Amount).sum());
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                }
                // data += "Other Transactions  :" + String.format("%,.2f", m.othertrans.stream().mapToDouble(o -> o.Amount).sum()) + "\n";
                data += "_________________________________\n";
                header = "Total payment:";
                value = String.format("%,.2f", m.Total);
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

                //data += "Total payment       :" + String.format("%,.2f", m.Total) + "\n";
                data += "_______________________________\n";
                data += "_______________________________\n";


                header = "Server:";
                value = Pawdep.Agent.Name;
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                data += "_______________________________\n";
                data += "_______________________________\n";

//                data += "TOTAL                 " + String.format("%.2f", total) + "\n\n";
//                data += "Served by:  " + Myvariables.CurrentAgent.Name + "\n\n\n\n\n";

                if (printersock != null) {
                    byte[] arrayOfByte1 = {27, 33, 0};
                    byte[] format = {27, 33, 0};
                    printerout.write(format);
                    String msg = head;
                    printerout.write(msg.getBytes());
                    byte[] printformat = {27, 33, 0};
                    printerout.write(printformat);
                    msg = data;
                    printerout.write(msg.getBytes());
                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.flush();
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        public void printallocation( Allocation_header m) {
            try {
                //Professional Center, 3rd Floor, next to KCB bank, Kiambu
                //      +254 715 792111
                // info[at]pawdep.org

                byte[] left = new byte[]{0x1b, 0x61, 0x00};
                byte[] center = new byte[]{0x1b, 0x61, 0x01};
                byte[] right = new byte[]{0x1b, 0x61, 0x02};
                byte[] clear = new byte[]{0x1b, 0x40};

                String head;
                head = "PAMOJA WOMEN DEVELOPMENT(PAWDEP)\n";
                head += "Professional Center, 3rd Floor \n";
                head += "    next to KCB bank,Kiambu   \n";
                head += "P.O. Box 2472 00100   \n";
                head += "     Nairobi, Kenya   \n";
                head += "Tel: (+254) (0)66 202 2205  \n";
                head += "     (+254) (0)20 238 3881  \n";
                head += "     (+254) (0)715 792 111  \n";
                head += "Email:info@pawdep.org  \n";
                head += "     customercare[at]pawdep.org \n";
                head += "--------------------------------\n";
                head += "       TRANSACTION RECEIPT   \n";

                String data = "";
                String header, value;
                String space = "";
                data = "--------------------------------\n";
               // data += "Group:   " + m.Group_Name + "\n";
                //data += "Ref:   " + m.Transaction_No + "\n";

                header = "Ref:";
                value = m.Transaction_No;
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";


               // data += String.format("M. No:%s (%s) ", m.Pawdep_No, m.Member_No) + "\n";
                header = "M. No:";
                value =String.format("%s (%s) ", m.Pawdep_No, m.Member_No);
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

              //  data += "Name:  " + m.Member_Names + "\n";
                header = "Name:";
                value =m.Member_Names;
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

                //data += "Date:  " + m.Allocation_Date + "\n";
                header = "Date:";
                value =m.Allocation_Date.toString();
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

                data += "--------------------------------\n\n";
                header = "Trans Type";
                value = "Amount";

                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                //   data += "Trans Type            Amount\n";
                //data += "1234567890123456789012345678901234567890\n";


                data += "--------------------------------\n";
                for (Allocation_Line l: m.allocation_lines
                     ) {
                    header = l.Transaction_Type.toString();
                    value = String.format("%,.2f", l.getAmount());
                    data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
            }

                // data += "Other Transactions  :" + String.format("%,.2f", m.othertrans.stream().mapToDouble(o -> o.Amount).sum()) + "\n";
                data += "_________________________________\n";
                header = "Total payment:";
                value = String.format("%,.2f", m.Amount);
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";

                //data += "Total payment       :" + String.format("%,.2f", m.Total) + "\n";
                data += "_______________________________\n";
                data += "_______________________________\n";


                header = "Served By:";
                value = Pawdep.Agent.Name;
                data += header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";
                data += "_______________________________\n";
                data += "_______________________________\n";

//                data += "TOTAL                 " + String.format("%.2f", total) + "\n\n";
//                data += "Served by:  " + Myvariables.CurrentAgent.Name + "\n\n\n\n\n";

                if (printersock != null) {
                    byte[] arrayOfByte1 = {27, 33, 0};
                    byte[] format = {27, 33, 0};
                    printerout.write(format);
                    String msg = head;
                    printerout.write(msg.getBytes());
                    byte[] printformat = {27, 33, 0};
                    printerout.write(printformat);
                    msg = data;
                    printerout.write(msg.getBytes());
                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.flush();
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        public void printreceipts( com.trimline.pawdep.Receipts m) {
            try {
                //Professional Center, 3rd Floor, next to KCB bank, Kiambu
                //      +254 715 792111
                // info[at]pawdep.org

                byte[] left = new byte[]{ 0x1b, 0x61, 0x00 };
                byte[] center = new byte[]{ 0x1b, 0x61, 0x01 };
                byte[] right = new byte[]{ 0x1b, 0x61, 0x02 };
                byte[] clear = new byte[]{ 0x1b, 0x40 };

                String head;
                head = "PAMOJA WOMEN DEVELOPMENT(PAWDEP)\n";
                head += "Professional Center, 3rd Floor \n";
                head += "    next to KCB bank,Kiambu   \n";
                head += "P.O. Box 2472 00100   \n";
                head += "     Nairobi, Kenya   \n";
                head += "Tel: (+254) (0)66 202 2205  \n";
                head += "     (+254) (0)20 238 3881  \n";
                head += "     (+254) (0)715 792 111  \n";
                head += "Email:info@pawdep.org  \n";
                head += "     customercare[at]pawdep.org \n";
                head += "--------------------------------\n";
                head += "       PAYMENT RECEIPT    \n";
                String data = "";
                String header,value;
                String space = "";
                data = "--------------------------------\n";
                header = "RCPT. No:";
                value = m.No;
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                header = "RCPT. Date:";
                value = m.Receipt_Date;
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                header = "Received From:";
                value = m.Received_From != null ? m.Received_From : "";
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                header = "Payment Mode:";
                value = m.ReceiptMode != null ? m.ReceiptMode :"";
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                header = "Document No:";
                value = m.Document_No  != null ?m.Document_No :"";
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                data += "--------------------------------\n\n";
                header = "Trans Type";
                value = "Amount";

                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";
                //   data += "Trans Type            Amount\n";
                //data += "1234567890123456789012345678901234567890\n";
                data += "--------------------------------\n";

                for (Receipt_lines rl: m.receipt_lines
                     ) {
                    header =Transaction_Type.values()[rl.Transaction_Type].getText();
                    value = String.format("%,.2f", rl.Amount);

                    data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";

                }

                data += "_________________________________\n";
                header = "Served by:";
                value = Pawdep.Agent.Name;
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";
                data += "_______________________________\n";


                header = "Total:";
                value = String.format("%,.2f",m.receipt_lines.stream().mapToDouble(o -> o.Amount).sum() );
                data += header +String.format("%" + (31-(header.length()+value.length())) +"s",space)+value +  "\n";
                data += "_______________________________\n";
                data += "_______________________________\n";

                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (printersock != null) {
                    byte[] arrayOfByte1 = {27, 33, 0};
                    byte[] format = {27, 33, 0};
                    printerout.write(format);
                    String msg = head;
                    printerout.write(msg.getBytes());
                    byte[] printformat = {27, 33, 0};
                    printerout.write(printformat);
                    msg = data;
                    printerout.write(msg.getBytes());


                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.write(0x0D);
                    printerout.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        public void printcollectioncopy(Bitmap logo, List<Transaction> t) {
//            try {
//                String head;
//                head = "    EMBASSAVA SACCO SOCIETY   \n";
//                head += "    Jiwabhai Vekaria Building  \n";
//                head += "          Taveta Road   \n";
//                head += "    P.O Box 3546-00200   \n";
//                head += "          Nairobi, Kenya   \n";
//                head += "    Tel: +254-20-269-1285  \n";
//                head += "  Email: info@embassavasacco.com  \n";
//                head += "--------------------------------\n";
//                // print_image(logo);
//                head += "         CASH RECIEPT           \n";
//                head += "             (COPY)\n";
//                String data = "";
//                data = "--------------------------------\n\n";
//                data += "Ref:   " + t.get(0).OTTN + "\n";
//                data += "M. No: " + t.get(0).Account_No + "\n";
//                data += "Name:  " + t.get(0).Account_Name + "\n";
//                data += "Date:  " + t.get(0).Date + "\n";
//                data += "Time:  " + t.get(0).Time + "\n";
//                data += "--------------------------------\n\n";
//                data += "Trans Type            Amount\n";
//                data += "----------            ------\n";
//                double total = 0.0;
//                for (transaction tt : t
//                        ) {
//                    total += tt.Amount;
//                    if (!tt.Loan_No.equals("")) {
//                        data += tt.typename + "\n";
//                        if (tt.Type.contains("LOAN")) {
//                            data += "(" + tt.Ward + ")" + String.format("%-" + (22 - tt.Ward.length()) + "s", "") + tt.Amount.toString() + "\n";
//                            data += "(" + tt.Loan_No + ")\n";//+ String.format("%-" + (22 - tt.Ward.length()) + "s", "") + tt.Amount.toString() + "\n";
//
//                        } else
//                            data += "(" + tt.Loan_No + ")" + String.format("%-" + (22 - tt.Loan_No.length()) + "s", "") + tt.Amount.toString() + "\n";
//
//                    } else
//                        data += tt.typename + ":" + String.format("%-" + (22 - tt.typename.length()) + "s", "") + tt.Amount.toString() + "\n";
//                }
//                data += "--------------------------------\n";
//                data += "TOTAL                 " + String.format("%.2f", total) + "\n\n";
//
//                data += "Served by:  " + Myvariables.CurrentAgent.Name + "\n\n\n\n\n";
//
//
//                try {
//                    Thread.sleep(1000);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//                if (printersock != null) {
//
//
//                    byte[] arrayOfByte1 = {27, 33, 0};
//                    byte[] format = {27, 33, 0};
//
//                    printerout.write(format);
//                    String msg = head;
//                    printerout.write(msg.getBytes());
//                    byte[] printformat = {27, 33, 0};
//                    printerout.write(printformat);
//                    msg = data;
//                    printerout.write(msg.getBytes());
//                    printerout.write(0x0D);
//                    printerout.write(0x0D);
//                    printerout.write(0x0D);
//                    printerout.flush();
//
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }

        }

        private void print_image(Bitmap bb) {
            try {
                Bitmap bmp = bb;
                convertBitmap(bmp);
                printerout.write(PrinterCommands.SET_LINE_SPACING_24);

                int offset = 0;
                while (offset < bmp.getHeight()) {
                    printerout.write(PrinterCommands.SELECT_BIT_IMAGE_MODE);
                    for (int x = 0; x < bmp.getWidth(); ++x) {

                        for (int k = 0; k < 3; ++k) {

                            byte slice = 0;
                            for (int b = 0; b < 8; ++b) {
                                int y = (((offset / 8) + k) * 8) + b;
                                int i = (y * bmp.getWidth()) + x;
                                boolean v = false;
                                if (i < dots.length()) {
                                    v = dots.get(i);
                                }
                                slice |= (byte) ((v ? 1 : 0) << (7 - b));
                            }
                            printerout.write(slice);
                        }
                    }
                    offset += 24;
                    printerout.write(PrinterCommands.FEED_LINE);
                    printerout.write(PrinterCommands.FEED_LINE);
                    printerout.write(PrinterCommands.FEED_LINE);
                    printerout.write(PrinterCommands.FEED_LINE);
                    printerout.write(PrinterCommands.FEED_LINE);
                    printerout.write(PrinterCommands.FEED_LINE);
                }
                printerout.write(PrinterCommands.SET_LINE_SPACING_30);


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        int mWidth, mHeight;
        String mStatus;

        public String convertBitmap(Bitmap inputBitmap) {

            mWidth = inputBitmap.getWidth();
            mHeight = inputBitmap.getHeight();

            convertArgbToGrayscale(inputBitmap, mWidth, mHeight);
            mStatus = "ok";
            return mStatus;

        }

        BitSet dots;

        private void convertArgbToGrayscale(Bitmap bmpOriginal, int width,
                                            int height) {
            int pixel;
            int k = 0;
            int B = 0, G = 0, R = 0;
            dots = new BitSet();
            try {

                for (int x = 0; x < height; x++) {
                    for (int y = 0; y < width; y++) {
                        // get one pixel color
                        pixel = bmpOriginal.getPixel(y, x);

                        // retrieve color of all channels
                        R = Color.red(pixel);
                        G = Color.green(pixel);
                        B = Color.blue(pixel);
                        // take conversion up to one single value by calculating
                        // pixel intensity.
                        R = G = B = (int) (0.299 * R + 0.587 * G + 0.114 * B);
                        // set bit into bitset, by calculating the pixel's luma
                        if (R < 55) {
                            dots.set(k);//this is the bitset that i'm printing
                        }
                        k++;

                    }


                }


            } catch (Exception e) {
                // TODO: handle exception
                Log.e("TAG", e.toString());
            }
        }

        private String getpreferences(SharedPreferences s, String key) {
            String pref = "";
            String value = s.getString(key, "");

            if (value != null || value != "") {
                pref = value;
            }
            return pref;
        }

    }
    public static    class PrinterCommands {
        public static final byte[] INIT = {27, 64};
        public static byte[] FEED_LINE = {10};

        public static byte[] SELECT_FONT_A = {27, 33, 0};

        public static byte[] SET_BAR_CODE_HEIGHT = {29, 104, 100};
        public static byte[] PRINT_BAR_CODE_1 = {29, 107, 2};
        public static byte[] SEND_NULL_BYTE = {0x00};

        public static byte[] SELECT_PRINT_SHEET = {0x1B, 0x63, 0x30, 0x02};
        public static byte[] FEED_PAPER_AND_CUT = {0x1D, 0x56, 66, 0x00};

        public static byte[] SELECT_CYRILLIC_CHARACTER_CODE_TABLE = {0x1B, 0x74, 0x11};

        public static byte[] SELECT_BIT_IMAGE_MODE = {0x1B, 0x2A, 33, -128, 0};
        //   public static byte[] SELECT_BIT_IMAGE_MODE = {0x1B, 0x2A, 33, (byte) 255, 3};
        public static byte[] SET_LINE_SPACING_24 = {0x1B, 0x33, 24};
        public static byte[] SET_LINE_SPACING_30 = {0x1B, 0x33, 30};

        public static byte[] TRANSMIT_DLE_PRINTER_STATUS = {0x10, 0x04, 0x01};
        public static byte[] TRANSMIT_DLE_OFFLINE_PRINTER_STATUS = {0x10, 0x04, 0x02};
        public static byte[] TRANSMIT_DLE_ERROR_STATUS = {0x10, 0x04, 0x03};
        public static byte[] TRANSMIT_DLE_ROLL_PAPER_SENSOR_STATUS = {0x10, 0x04, 0x04};
    }
    public static class BluetoothConnector {

        private BluetoothSocketWrapper bluetoothSocket;
        private BluetoothDevice device;
        private boolean secure;
        private BluetoothAdapter adapter;
        private List<UUID> uuidCandidates;
        private int candidate;


        /**
         * @param device the device
         * @param secure if connection should be done via a secure socket
         * @param adapter the Android BT adapter
         * @param uuidCandidates a list of UUIDs. if null or empty, the Serial PP id is used
         */
        public BluetoothConnector(BluetoothDevice device, boolean secure, BluetoothAdapter adapter,
                                  List<UUID> uuidCandidates) {
            this.device = device;
            this.secure = secure;
            this.adapter = adapter;
            this.uuidCandidates = uuidCandidates;

            if (this.uuidCandidates == null || this.uuidCandidates.isEmpty()) {
                this.uuidCandidates = new ArrayList<UUID>();
                this.uuidCandidates.add(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"));
            }
        }

        public BluetoothSocket connect() throws IOException {
            boolean success = false;
            BluetoothSocket bs=null ;
            while (selectSocket()) {
                adapter.cancelDiscovery();

                try {
                    bs=   bluetoothSocket.connect();
                    success = true;
                    break;
                } catch (IOException e) {
                    //try the fallback
                    try {
                        bluetoothSocket = new FallbackBluetoothSocket(bluetoothSocket.getUnderlyingSocket());
                        Thread.sleep(500);
                        bs=   bluetoothSocket.connect();
                        success = true;
                        break;
                    } catch (FallbackException e1) {
                        Log.w("BT", "Could not initialize FallbackBluetoothSocket classes.", e);
                    } catch (InterruptedException e1) {
                        Log.w("BT", e1.getMessage(), e1);
                    } catch (IOException e1) {
                        Log.w("BT", "Fallback failed. Cancelling.", e1);
                        e1.printStackTrace();
                    }
                }
            }

            if (!success) {
                throw new IOException("Could not connect to device: "+ device.getAddress());
            }

            return bs;
        }
        private boolean selectSocket() throws IOException {
            if (candidate >= uuidCandidates.size()) {
                return false;
            }

            BluetoothSocket tmp;
            UUID uuid = uuidCandidates.get(candidate++);

            Log.i("BT", "Attempting to connect to Protocol: "+ uuid);
            if (secure) {
                tmp = device.createRfcommSocketToServiceRecord(uuid);
            } else {
                tmp = device.createInsecureRfcommSocketToServiceRecord(uuid);
            }
            bluetoothSocket = new NativeBluetoothSocket(tmp);

            return true;
        }

        public interface BluetoothSocketWrapper {

            InputStream getInputStream() throws IOException;

            OutputStream getOutputStream() throws IOException;

            String getRemoteDeviceName();

            BluetoothSocket connect() throws IOException;

            String getRemoteDeviceAddress();

            void close() throws IOException;

            BluetoothSocket getUnderlyingSocket();

        }

        public static class NativeBluetoothSocket implements BluetoothSocketWrapper {

            private BluetoothSocket socket;

            public NativeBluetoothSocket(BluetoothSocket tmp) {
                this.socket = tmp;
            }

            @Override
            public InputStream getInputStream() throws IOException {
                return socket.getInputStream();
            }

            @Override
            public OutputStream getOutputStream() throws IOException {
                return socket.getOutputStream();
            }

            @Override
            public String getRemoteDeviceName() {
                return socket.getRemoteDevice().getName();
            }

            @Override
            public BluetoothSocket connect() throws IOException {
                socket.connect();
                return getUnderlyingSocket();
            }

            @Override
            public String getRemoteDeviceAddress() {
                return socket.getRemoteDevice().getAddress();
            }

            @Override
            public void close() throws IOException {
                socket.close();
            }

            @Override
            public BluetoothSocket getUnderlyingSocket() {
                return socket;
            }

        }

        public class FallbackBluetoothSocket extends NativeBluetoothSocket {

            private BluetoothSocket fallbackSocket;

            public FallbackBluetoothSocket(BluetoothSocket tmp) throws FallbackException {
                super(tmp);
                try
                {
                    Class<?> clazz = tmp.getRemoteDevice().getClass();
                    Class<?>[] paramTypes = new Class<?>[] {Integer.TYPE};
                    Method m = clazz.getMethod("createRfcommSocket", paramTypes);
                    Object[] params = new Object[] {Integer.valueOf(1)};
                    fallbackSocket = (BluetoothSocket) m.invoke(tmp.getRemoteDevice(), params);
                }
                catch (Exception e)
                {
                    throw new FallbackException(e);
                }
            }

            @Override
            public InputStream getInputStream() throws IOException {
                return fallbackSocket.getInputStream();
            }

            @Override
            public OutputStream getOutputStream() throws IOException {
                return fallbackSocket.getOutputStream();
            }


            @Override
            public BluetoothSocket connect() throws IOException {
                fallbackSocket.connect();
                return fallbackSocket;
            }


            @Override
            public void close() throws IOException {
                fallbackSocket.close();
            }

        }

        public static class FallbackException extends Exception {

            /**
             *
             */
            private static final long serialVersionUID = 1L;

            public FallbackException(Exception e) {
                super(e);
            }

        }
    }
    public interface Constants {

        // Message types sent from the BluetoothChatService Handler
        int MESSAGE_STATE_CHANGE = 1;
        int MESSAGE_READ = 2;
        int MESSAGE_WRITE = 3;
        int MESSAGE_DEVICE_NAME = 4;
        int MESSAGE_TOAST = 5;
        int BOND = 6;
        int SCALE_CONNECTED = 7;

        // Key names received from the BluetoothChatService Handler
        String DEVICE_NAME = "device_name";
        String TOAST = "toast";

        int SCALE_DISCONNECTED =8 ;
        int PRINTER_CONNECTED =9 ;
        int PRINTER_DISCONNECTED =10 ;
        int PRINTER_MESSAGE_READ =11 ;
    }

}
