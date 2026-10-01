package com.trimline.paul.metro;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Matrix;
import android.os.Handler;
import android.os.ParcelUuid;
import android.util.Log;

import com.google.gson.Gson;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.UUID;

import static com.trimline.paul.metro.summaries.printer.printThread;
import static com.trimline.paul.metro.summaries.printer.printerdevice;

import static com.trimline.paul.metro.summaries.printer.printerout;
import static com.trimline.paul.metro.summaries.printer.printersock;


/**
 * Created by Paul on 09-Oct-16.
 */

public class summaries {
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
        public String vehicle;
        public String fleetNo;
        public Boolean Recovery;

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
        volatile boolean  stopped = false;
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

if (stopped)
    break;
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
                                    new Class[]{int.class});
                            printersock = (BluetoothSocket) m.invoke(prnt, Integer.valueOf(1));
                            try {
                                Thread.sleep(1000);
                                if (stopped)
                                    break;
                                printersock.connect();
                                mHandler.obtainMessage(Constants.PRINTER_CONNECTED, true).sendToTarget();
                            } catch (IOException ex) {
                                BluetoothConnector bc;
                                final UUID MY_UUID_SECURE =
                                        UUID.fromString("fa87c0d0-afac-11de-8a39-0800200c9a66");
                                List<UUID> ids = new ArrayList<>();
                                UUID id = MY_UUID_SECURE;
                                ids.add(id);
                                bc = new BluetoothConnector(prnt, true, ad, ids);
                                Thread.sleep(1000);
                                if (stopped)
                                    break;
                                printersock = bc.connect();
                                mHandler.obtainMessage(Constants.PRINTER_CONNECTED, true).sendToTarget();
                            }

                            pSocket = printersock;
                            printerout = pSocket.getOutputStream();
                            //Log.i("thread", "printer connected");
                            //return;
                            try {
                                while (printersock.isConnected()) {
                                    Log.i("thread", "printer connected");
                                    this.sleep(2000);
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

            Log.i("Printer thread", "Stopped");
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
                stopped = true;
            } catch (IOException e) {

            }
        }
    }

    //    public static class Printerthread extends Thread {
//        private BluetoothSocket pSocket;
//        SharedPreferences preferences;
//
//        public Printerthread(SharedPreferences s) {
//            try {
//                preferences = s;
//                printThread = this;
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
//        }
//
//        public void run() {
//
//            byte[] pbuffer = new byte[1024];
//            int pbytes = 0;
//            int pbegin = 0;
//            // Make a connection to the BluetoothSocket
//            while (true) {
//                try {
//
//                    String value = preferences.getString("PRINTER", "");
////                BluetoothDevice prnt = BluetoothAdapter.getDefaultAdapter().                        getRemoteDevice("00:02:0A:02:60:10");
//                    if (!value.equals("")) {
//                        BluetoothAdapter ad = BluetoothAdapter.getDefaultAdapter();
//                        if (ad != null) {
//                            if (!ad.isEnabled())
//                                ad.enable();
//
//                            BluetoothDevice prnt = ad.getRemoteDevice(value);
//                            printerdevice = prnt;
//                            Method m = prnt.getClass().getMethod("createRfcommSocket",
//                                    new Class[]{int.class});
//
//                            printersock = (BluetoothSocket) m.invoke(prnt, Integer.valueOf(1));
//
//
//                            try {
//                                printersock.connect();
//                            } catch (IOException ex) {
//                                BluetoothConnector bc;
//                                final UUID MY_UUID_SECURE =
//                                        UUID.fromString("fa87c0d0-afac-11de-8a39-0800200c9a66");
//                                List<UUID> ids = new ArrayList<>();
//                                UUID id = MY_UUID_SECURE;
//                                ids.add(id);
//                                bc = new BluetoothConnector(prnt, true, ad, ids);
//                                printersock = bc.connect();
//                            }
//                            mHandler.obtainMessage(Constants.PRINTER_CONNECTED, true).sendToTarget();
//
//                            pSocket = printersock;
//
//                            printerin = pSocket.getInputStream();
//                            printerout = pSocket.getOutputStream();
//
//                            try {
//                                while (true) {
//                                    if ((pSocket.isConnected())) {
//                                        pbytes += printerin.read(pbuffer, pbytes, pbuffer.length - pbytes);
//                                        for (int i = pbegin; i < pbytes; i++) {
//                                            if (pbuffer[i] == "\n".getBytes()[0]) {
//                                                mHandler.obtainMessage(Constants.PRINTER_MESSAGE_READ, pbegin, i, pbuffer).sendToTarget();
//                                                pbegin = i + 1;
//                                                if (i == pbytes - 1) {
//                                                    pbytes = 0;
//                                                    pbegin = 0;
//                                                }
//                                            }
//                                        }
//                                    } else {
//                                        mHandler.obtainMessage(Constants.SCALE_DISCONNECTED, true).sendToTarget();
//                                    }
//                                }
//                            } catch (IOException e) {
//                                e.printStackTrace();
//                            }
//                        } else
//                            mHandler.obtainMessage(Constants.MESSAGE_TOAST, "No bluetooth found").sendToTarget();
//
//                    } else return;
//                } catch (Exception ex) {
//                    ex.printStackTrace();
//
//                }
//
//            }
//            // Reset the ConnectThread because we're done
//
//
//            // Start the connected thread
//        }
//
//        public void write(byte[] buffer) {
//            try {
//                printerout.write(buffer);
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//        public void write(int buffer) {
//            try {
//                printerout.write(buffer);
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//
//        public void flush() {
//            try {
//                printerout.flush();
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//
//        }
//
//        public void cancel() {
//            try {
//                pSocket.close();
//                printerin.close();
//                printerout.close();
//            } catch (IOException e) {
//
//            }
//        }
//    }
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

        public void printcollection(Bitmap logo, List<transaction> t) {
            try {
                Log.i("Printing", new Gson().toJson(t));
                //print_image(logo);
                String header, value;
                String head;
                head = " METROTRANS SACCO SOCIETY LTD  \n";
                head += "      Box 11670 - 00400\n";
                head += "        Nairobi, Kenya         \n";
                head += "Tel:    +254-721-381-573\n";
                head += "Email:  metrotrans.bus@gmail.com\n";
                head += "-------------------------------\n";
                head += "         CASH RECIEPT          \n";
                String data = "";
                data = "--------------------------------\n";

               data += printout("Ref:",t.get(0).OTTN);
               data += printout("M. No:",t.get(0).Account_No);
              // data += printout("Name:",t.get(0).Account_Name);
                if (t.get(0).Group!=null)
                    if(!t.get(0).Group.equals(""))
                        data += printout("Fleet. No:",t.get(0).Group);

               if(!t.get(0).Loan_No.equals(""))
                   data += printout("V. No:",t.get(0).Loan_No);


                data += printout("Date:" , t.get(0).Date );
                data += printout("Time:" , t.get(0).Time );
                data += "--------------------------------\n";
                data += printout("Trans Type","Amount");
                data += printout("----------" , "------");
                double total = 0.0;
                for (transaction tt : t
                ) {
                    total += tt.getAmount();

                        data +=printout(tt.typename,String.format("%.2f", tt.getAmount()));
                }
                data += "--------------------------------\n";
                data += printout("Total", String.format("%.2f", total) )+ "\n";
                data += printout("Served by:" , Myvariables.CurrentAgent.Name )+ "\n";
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
        public void printSummary(Bitmap logo, List<tsummary> t) {
            try {
                Log.i("Summary", new Gson().toJson(t));
               // print_image(logo);
                String header, value;
                String head;
                head = " METROTRANS SACCO SOCIETY LTD  \n";
                head += "      Box 11670 - 00400\n";
                head += "        Nairobi, Kenya         \n";
                head += "Tel:    +254-721-381-573\n";
                head += "Email:  metrotrans.bus@gmail.com\n";
                head += "-------------------------------\n";
                head += "         Transaction summary   \n";
                head += "         "+t.get(0).Date+" \n";
                String data = "";

                data += "--------------------------------\n";
                data += printout("Trans Type","Amount");
                data += printout("----------" , "------");
                double total = 0.0;
                for (tsummary tt : t
                ) {
                    total += tt.Amount;

                    data +=printout(tt.Type,String.format("%.2f",tt.Amount));
                }
                data += "--------------------------------\n";
                data += printout("Total", String.format("%.2f", total) )+ "\n";
                data += printout("Printed by:" , Myvariables.CurrentAgent.Name )+ "\n";
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

        public String printout(String header,String value){
    String space = "";
 return   header + String.format("%" + (31 - (header.length() + value.length())) + "s", space) + value + "\n";


}
        public void printcollectioncopy(Bitmap logo, List<transaction> t) {
            try {
                String head;
                head = " METROTRANS SACCO SOCIETY LTD  \n";
                head += "      Box 11670 - 00400\n";
                head += "        Nairobi, Kenya         \n";
                head += "Tel:    +254-721-381-573\n";
                head += "Email:  metrotrans.bus@gmail.com\n";
                head += "-------------------------------\n";
                head += "         CASH RECIEPT          \n";
                head += "             (COPY)\n";
                String data = "";
                data = "--------------------------------\n\n";
                data += "Ref:   " + t.get(0).OTTN + "\n";
                data += "M. No: " + t.get(0).Account_No + "\n";
                data += "Name:  " + t.get(0).Account_Name + "\n";
                data += "Date:  " + t.get(0).Date + "\n";
                data += "Time:  " + t.get(0).Time + "\n";
                data += "--------------------------------\n\n";
                data += "Trans Type            Amount\n";
                data += "----------            ------\n";
                double total = 0.0;
                for (transaction tt : t
                        ) {
                    total += tt.getAmount();
                    if (!tt.Loan_No.equals("")) {
                        data += tt.typename + "\n";
                        if (tt.Type.contains("LOAN")) {
                            data += "(" + tt.Ward + ")" + String.format("%-" + (22 - tt.Ward.length()) + "s", "") + tt.getAmount().toString() + "\n";
                            data += "(" + tt.Loan_No + ")\n";//+ String.format("%-" + (22 - tt.Ward.length()) + "s", "") + tt.Amount.toString() + "\n";

                        } else
                            data += "(" + tt.Loan_No + ")" + String.format("%-" + (22 - tt.Loan_No.length()) + "s", "") + tt.getAmount().toString() + "\n";

                    } else
                        data += tt.typename + ":" + String.format("%-" + (22 - tt.typename.length()) + "s", "") + tt.getAmount().toString() + "\n";
                }
                data += "--------------------------------\n";
                data += "TOTAL                 " + String.format("%.2f", total) + "\n\n";

                data += "Served by:  " + Myvariables.CurrentAgent.Name + "\n\n\n\n\n";


                try {
                    Thread.sleep(1000);
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

        private void print_image(Bitmap bb) {
            try {

                ByteArrayOutputStream stream = new ByteArrayOutputStream();
                PrintPic printPic = PrintPic.getInstance();
                printPic.init(bb);
              byte[] bitmapdata = printPic.printDraw();


                printerout.write(bitmapdata);

                printerout.flush();


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        public static Bitmap resizeImage(Bitmap bitmap, int w, int h) {
            Bitmap BitmapOrg = bitmap;
            int width = BitmapOrg.getWidth();
            int height = BitmapOrg.getHeight();
            int newWidth = w;
            int newHeight = h;

            float scaleWidth = ((float) newWidth) / width;
            float scaleHeight = ((float) newHeight) / height;
            Matrix matrix = new Matrix();
            matrix.postScale(scaleWidth, scaleWidth);
            Bitmap resizedBitmap = Bitmap.createBitmap(BitmapOrg, 10,10, width,
                    height, matrix, true);
            return resizedBitmap;
        }
        private static byte[] StartBmpToPrintCode(Bitmap bitmap, int t) {
            byte temp = 0;
            int j = 7;
            int start = 0;
            if (bitmap != null) {
                int mWidth = bitmap.getWidth();
                int mHeight = bitmap.getHeight();

                int[] mIntArray = new int[mWidth * mHeight];
                byte[] data = new byte[mWidth * mHeight];
                bitmap.getPixels(mIntArray, 0, mWidth, 0, 0, mWidth, mHeight);
                encodeYUV420SP(data, mIntArray, mWidth, mHeight, t);
                byte[] result = new byte[mWidth * mHeight / 8];
                for (int i = 0; i < mWidth * mHeight; i++) {
                    temp = (byte) ((byte) (data[i] << j) + temp);
                    j--;
                    if (j < 0) {
                        j = 7;
                    }
                    if (i % 8 == 7) {
                        result[start++] = temp;
                        temp = 0;
                    }
                }
                if (j != 7) {
                    result[start++] = temp;
                }

                int aHeight = 24 - mHeight % 24;
                byte[] add = new byte[aHeight * 48];
                byte[] nresult = new byte[mWidth * mHeight / 8 + aHeight * 48];
                System.arraycopy(result, 0, nresult, 0, result.length);
                System.arraycopy(add, 0, nresult, result.length, add.length);

                byte[] byteContent = new byte[(mWidth / 8 + 4)
                        * (mHeight + aHeight)];// ´òÓ¡Êý×é
                byte[] bytehead = new byte[4];// Ã¿ÐÐ´òÓ¡Í·
                bytehead[0] = (byte) 0x1f;
                bytehead[1] = (byte) 0x10;
                bytehead[2] = (byte) (mWidth / 8);
                bytehead[3] = (byte) 0x00;
                for (int index = 0; index < mHeight + aHeight; index++) {
                    System.arraycopy(bytehead, 0, byteContent, index * 52, 4);
                    System.arraycopy(nresult, index * 48, byteContent,
                            index * 52 + 4, 48);

                }
                return byteContent;
            }
            return null;

        }

        public static void encodeYUV420SP(byte[] yuv420sp, int[] rgba, int width,
                                          int height, int t) {
            final int frameSize = width * height;
            int[] U, V;
            U = new int[frameSize];
            V = new int[frameSize];
            final int uvwidth = width / 2;
            int r, g, b, y, u, v;
            int bits = 8;
            int index = 0;
            int f = 0;
            for (int j = 0; j < height; j++) {
                for (int i = 0; i < width; i++) {
                    r = (rgba[index] & 0xff000000) >> 24;
                    g = (rgba[index] & 0xff0000) >> 16;
                    b = (rgba[index] & 0xff00) >> 8;
                    // rgb to yuv
                    y = ((66 * r + 129 * g + 25 * b + 128) >> 8) + 16;
                    u = ((-38 * r - 74 * g + 112 * b + 128) >> 8) + 128;
                    v = ((112 * r - 94 * g - 18 * b + 128) >> 8) + 128;
                    // clip y
                    // yuv420sp[index++] = (byte) ((y < 0) ? 0 : ((y > 255) ? 255 :
                    // y));
                    byte temp = (byte) ((y < 0) ? 0 : ((y > 255) ? 255 : y));
                    if (t == 0) {
                        yuv420sp[index++] = temp > 0 ? (byte) 1 : (byte) 0;
                    } else {
                        yuv420sp[index++] = temp > 0 ? (byte) 0 : (byte) 1;
                    }

                    // {
                    // if (f == 0) {
                    // yuv420sp[index++] = 0;
                    // f = 1;
                    // } else {
                    // yuv420sp[index++] = 1;
                    // f = 0;
                    // }

                    // }

                }

            }
            f = 0;
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
}
