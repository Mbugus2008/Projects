package com.trimline.metrocrew;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Handler;
import android.os.ParcelUuid;
import android.util.Log;
import com.facebook.stetho.dumpapp.Framer;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import kotlin.jvm.internal.ByteCompanionObject;

/* JADX INFO: loaded from: classes5.dex */
public class Printer {
    static Handler mHandler = null;

    public interface Constants {
        public static final int BOND = 6;
        public static final String DEVICE_NAME = "device_name";
        public static final int MESSAGE_DEVICE_NAME = 4;
        public static final int MESSAGE_READ = 2;
        public static final int MESSAGE_STATE_CHANGE = 1;
        public static final int MESSAGE_TOAST = 5;
        public static final int MESSAGE_WRITE = 3;
        public static final int PRINTER_CONNECTED = 9;
        public static final int PRINTER_DISCONNECTED = 10;
        public static final int PRINTER_MESSAGE_READ = 11;
        public static final int SCALE_CONNECTED = 7;
        public static final int SCALE_DISCONNECTED = 8;
        public static final String TOAST = "toast";
    }

    public static class PrinterCommands {
        public static final byte[] INIT = {27, 64};
        public static byte[] FEED_LINE = {10};
        public static byte[] SELECT_FONT_A = {27, Framer.ENTER_FRAME_PREFIX, 0};
        public static byte[] SET_BAR_CODE_HEIGHT = {29, 104, 100};
        public static byte[] PRINT_BAR_CODE_1 = {29, 107, 2};
        public static byte[] SEND_NULL_BYTE = {0};
        public static byte[] SELECT_PRINT_SHEET = {27, 99, 48, 2};
        public static byte[] FEED_PAPER_AND_CUT = {29, 86, 66, 0};
        public static byte[] SELECT_CYRILLIC_CHARACTER_CODE_TABLE = {27, 116, 17};
        public static byte[] SELECT_BIT_IMAGE_MODE = {27, 42, Framer.ENTER_FRAME_PREFIX, ByteCompanionObject.MIN_VALUE, 0};
        public static byte[] SET_LINE_SPACING_24 = {27, 51, 24};
        public static byte[] SET_LINE_SPACING_30 = {27, 51, 30};
        public static byte[] TRANSMIT_DLE_PRINTER_STATUS = {16, 4, 1};
        public static byte[] TRANSMIT_DLE_OFFLINE_PRINTER_STATUS = {16, 4, 2};
        public static byte[] TRANSMIT_DLE_ERROR_STATUS = {16, 4, 3};
        public static byte[] TRANSMIT_DLE_ROLL_PAPER_SENSOR_STATUS = {16, 4, 4};
    }

    public static class getdata {
        public String LastDate;
        public String firstdate;
        public String user;
    }

    public static class reportfields {
        public String field;
        public String value;
    }

    public static class reportheader {
        public int Count;
        public String Name;
        public Double Total;
    }

    public static class collectiondates {
        public int Count;
        public String MemberName;
        public String MemberNo;
        public Double Total;
        public String date;

        public String toString() {
            return this.date;
        }
    }

    public static class Receipts {
        public int Count;
        public String Name;
        public String No;
        public Double Total;
        public String date;
        public String receipt;
        public String user;

        public String toString() {
            return this.date;
        }
    }

    public static boolean createBond(BluetoothDevice btDevice) throws Exception {
        Method createBondMethod = Class.forName("android.bluetooth.BluetoothDevice").getMethod("createBond", new Class[0]);
        Boolean returnValue = (Boolean) createBondMethod.invoke(btDevice, new Object[0]);
        return returnValue.booleanValue();
    }

    public static class Printerthread extends Thread {
        private BluetoothSocket pSocket;
        SharedPreferences preferences;

        public Printerthread(SharedPreferences s) {
            try {
                this.preferences = s;
                printer.printThread = this;
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            String str;
            char c;
            String str2 = "";
            byte[] bArr = new byte[1024];
            while (true) {
                try {
                    Log.i("thread", "running");
                    String value = this.preferences.getString("PRINTER", str2);
                    if (!value.equals(str2)) {
                        BluetoothAdapter ad = BluetoothAdapter.getDefaultAdapter();
                        if (ad != null) {
                            if (!ad.isEnabled()) {
                                ad.enable();
                            }
                            BluetoothDevice prnt = ad.getRemoteDevice(value);
                            ParcelUuid[] uuds = prnt.getUuids();
                            if (uuds == null) {
                                str = str2;
                                c = 0;
                            } else {
                                int length = uuds.length;
                                int i = 0;
                                while (i < length) {
                                    ParcelUuid u = uuds[i];
                                    UUID pa = u.getUuid();
                                    str = str2;
                                    try {
                                        Log.i("Device uuid", pa.toString());
                                        i++;
                                        str2 = str;
                                    } catch (Exception e) {
                                        ex = e;
                                        ex.printStackTrace();
                                        str2 = str;
                                    }
                                }
                                str = str2;
                                c = 0;
                            }
                            printer.printerdevice = prnt;
                            Class<?> cls = prnt.getClass();
                            Class<?>[] clsArr = new Class[1];
                            clsArr[c] = Integer.TYPE;
                            Method m = cls.getMethod("createRfcommSocket", clsArr);
                            printer.printersock = (BluetoothSocket) m.invoke(prnt, 1);
                            try {
                                Thread.sleep(1000L);
                                if (!printer.printersock.isConnected()) {
                                    printer.printersock.connect();
                                }
                            } catch (IOException e2) {
                                UUID MY_UUID_SECURE = UUID.fromString("fa87c0d0-afac-11de-8a39-0800200c9a66");
                                List<UUID> ids = new ArrayList<>();
                                ids.add(MY_UUID_SECURE);
                                BluetoothConnector bc = new BluetoothConnector(prnt, true, ad, ids);
                                Thread.sleep(1000L);
                                printer.printersock = bc.connect();
                            }
                            Printer.mHandler.obtainMessage(9, true).sendToTarget();
                            this.pSocket = printer.printersock;
                            printer.printerout = this.pSocket.getOutputStream();
                            Log.i("thread", "printer connected");
                            while (printer.printersock.isConnected()) {
                                try {
                                    Log.i("thread", "printer connected");
                                    sleep(2000L);
                                } catch (Exception e3) {
                                    e3.printStackTrace();
                                }
                            }
                        } else {
                            str = str2;
                            Printer.mHandler.obtainMessage(5, "No bluetooth found").sendToTarget();
                        }
                        str2 = str;
                    } else {
                        return;
                    }
                } catch (Exception e4) {
                    ex = e4;
                    str = str2;
                }
            }
        }

        public void write(byte[] buffer) {
            try {
                printer.printerout.write(buffer);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        public void write(int buffer) {
            try {
                printer.printerout.write(buffer);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        public void flush() {
            try {
                printer.printerout.flush();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        public void cancel() {
            try {
                this.pSocket.close();
                printer.printerout.close();
            } catch (IOException e) {
            }
        }
    }

    public static class printer {
        public static Printerthread printThread;
        public static BluetoothDevice printerdevice;
        public static OutputStream printerout;
        public static BluetoothSocket printersock;
        BitSet dots;
        int mHeight;
        String mStatus;
        int mWidth;

        public void writetoprinter(byte[] out) {
            Printerthread r;
            synchronized (this) {
                r = printThread;
            }
            r.write(out);
        }

        public void writetoprinter(int out) {
            Printerthread r;
            synchronized (this) {
                r = printThread;
            }
            r.write(out);
        }

        public void flushprinter() {
            Printerthread r;
            synchronized (this) {
                r = printThread;
            }
            r.flush();
        }

        public void printcollection(Bitmap logo, theader t) {
            String str = "";
            String space = "";
            try {
                String head = "      METROTRANS CREW SACCO     \n     P.O. Box 11670 - 00400    \n";
                String head2 = ((((head + "           Nairobi             \n") + "      +254-721-381-573         \n") + "    metrotrans.bus@gmail.com   \n") + "-------------------------------\n") + "    CASH COLLECTION RECIEPT    \n";
                String value = t.No;
                String data = "--------------------------------\nRef:" + String.format("%" + (31 - ("Ref:".length() + value.length())) + "s", space) + value + "\n";
                String header = t.Account_No;
                String data2 = data + "Member. No:" + String.format("%" + (31 - ("Member. No:".length() + header.length())) + "s", space) + header + "\n";
                String value2 = t.Received_From.length() > 25 ? t.Received_From.substring(0, 24) : t.Received_From;
                Log.i("Name lenhg", String.valueOf(value2.length()));
                String data3 = data2 + "Name:" + String.format("%" + (31 - ("Name:".length() + value2.length())) + "s", space) + value2 + "\n";
                String value3 = t.Date.toString();
                String data4 = data3 + "Date:" + String.format("%" + (31 - ("Date:".length() + value3.length())) + "s", space) + value3 + "\n";
                SimpleDateFormat d = new SimpleDateFormat("HH:mm:ss");
                String value4 = d.format((Date) t.Created_Date_Time);
                String data5 = (((data4 + "Time:" + String.format("%" + (31 - ("Time:".length() + value4.length())) + "s", space) + value4 + "\n") + "--------------------------------\n\n") + "Trans Type" + String.format("%" + (31 - ("Trans Type".length() + "Amount".length())) + "s", space) + "Amount\n") + "----------" + String.format("%" + (31 - ("----------".length() + "------".length())) + "s", space) + "------\n";
                double total = 0.0d;
                for (transaction tt : t.tlines) {
                    String str2 = str;
                    String space2 = space;
                    String head3 = head2;
                    Log.i("ddd", new Gson().toJson(tt));
                    total += tt.Amount.doubleValue();
                    String header2 = tt.transtype == null ? str2 : tt.transtype;
                    String value5 = String.format("%.2f", tt.Amount);
                    Log.i("value", value5);
                    data5 = data5 + header2 + String.format("%" + (31 - (header2.length() + value5.length())) + "s", space2) + value5 + "\n";
                    str = str2;
                    space = space2;
                    head2 = head3;
                }
                String space3 = space;
                String head4 = head2;
                String value6 = String.format("%.2f", Double.valueOf(total));
                String data6 = ((data5 + "--------------------------------\n") + "TOTAL:" + String.format("%" + (31 - ("TOTAL:".length() + value6.length())) + "s", space3) + value6 + "\n") + "--------------------------------\n\n";
                String value7 = String.format("%s", agent.Model.CurrentAgent.Name);
                String data7 = data6 + "Served by:" + String.format("%" + (31 - ("Served by:".length() + value7.length())) + "s", space3) + value7 + "\n\n\n\n\n";
                try {
                    Thread.sleep(100L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (printersock != null) {
                    byte[] bArr = {27, Framer.ENTER_FRAME_PREFIX, 0};
                    byte[] format = {27, Framer.ENTER_FRAME_PREFIX, 0};
                    printerout.write(format);
                    printerout.write(head4.getBytes());
                    byte[] printformat = {27, Framer.ENTER_FRAME_PREFIX, 0};
                    printerout.write(printformat);
                    printerout.write(data7.getBytes());
                    printerout.write(13);
                    printerout.write(13);
                    printerout.write(13);
                    printerout.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        private void print_image(Bitmap bb) {
            try {
                convertBitmap(bb);
                printerout.write(PrinterCommands.SET_LINE_SPACING_24);
                int offset = 0;
                while (offset < bb.getHeight()) {
                    printerout.write(PrinterCommands.SELECT_BIT_IMAGE_MODE);
                    for (int x = 0; x < bb.getWidth(); x++) {
                        for (int k = 0; k < 3; k++) {
                            byte slice = 0;
                            for (int b = 0; b < 8; b++) {
                                int y = (((offset / 8) + k) * 8) + b;
                                int i = (bb.getWidth() * y) + x;
                                boolean v = false;
                                if (i < this.dots.length()) {
                                    v = this.dots.get(i);
                                }
                                slice = (byte) (((byte) ((v ? 1 : 0) << (7 - b))) | slice);
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

        public String convertBitmap(Bitmap inputBitmap) {
            this.mWidth = inputBitmap.getWidth();
            this.mHeight = inputBitmap.getHeight();
            convertArgbToGrayscale(inputBitmap, this.mWidth, this.mHeight);
            this.mStatus = "ok";
            return this.mStatus;
        }

        private void convertArgbToGrayscale(Bitmap bmpOriginal, int width, int height) {
            int k = 0;
            int k2 = 0;
            int B = 0;
            int G = 0;
            this.dots = new BitSet();
            int x = 0;
            while (x < height) {
                int i = k2;
                int B2 = k;
                int k3 = 0;
                int G2 = G;
                int B3 = B;
                int R = i;
                while (k3 < width) {
                    try {
                        int pixel = bmpOriginal.getPixel(k3, x);
                        int R2 = Color.red(pixel);
                        try {
                            int G3 = Color.green(pixel);
                            try {
                                int B4 = Color.blue(pixel);
                                int R3 = (int) ((((double) R2) * 0.299d) + (((double) G3) * 0.587d) + (((double) B4) * 0.114d));
                                if (R3 < 55) {
                                    try {
                                        this.dots.set(B2);
                                    } catch (Exception e) {
                                        e = e;
                                        G2 = R3;
                                        R = R3;
                                        B3 = R3;
                                        Log.e("TAG", e.toString());
                                        return;
                                    }
                                }
                                B2++;
                                k3++;
                                G2 = R3;
                                R = R3;
                                B3 = R3;
                            } catch (Exception e2) {
                                e = e2;
                                B3 = G3;
                                G2 = R2;
                            }
                        } catch (Exception e3) {
                            e = e3;
                            G2 = R2;
                        }
                    } catch (Exception e4) {
                        e = e4;
                    }
                }
                x++;
                k = B2;
                k2 = R;
                B = B3;
                G = G2;
            }
        }

        private String getpreferences(SharedPreferences s, String key) {
            String value = s.getString(key, "");
            if (value == null && value == "") {
                return "";
            }
            return value;
        }
    }

    public static class BluetoothConnector {
        private BluetoothAdapter adapter;
        private BluetoothSocketWrapper bluetoothSocket;
        private int candidate;
        private BluetoothDevice device;
        private boolean secure;
        private List<UUID> uuidCandidates;

        public interface BluetoothSocketWrapper {
            void close() throws IOException;

            BluetoothSocket connect() throws IOException;

            InputStream getInputStream() throws IOException;

            OutputStream getOutputStream() throws IOException;

            String getRemoteDeviceAddress();

            String getRemoteDeviceName();

            BluetoothSocket getUnderlyingSocket();
        }

        public BluetoothConnector(BluetoothDevice device, boolean secure, BluetoothAdapter adapter, List<UUID> uuidCandidates) {
            this.device = device;
            this.secure = secure;
            this.adapter = adapter;
            this.uuidCandidates = uuidCandidates;
            if (this.uuidCandidates == null || this.uuidCandidates.isEmpty()) {
                this.uuidCandidates = new ArrayList();
                this.uuidCandidates.add(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"));
            }
        }

        public BluetoothSocket connect() throws IOException {
            String str = "BT";
            boolean success = false;
            BluetoothSocket bs = null;
            while (selectSocket()) {
                this.adapter.cancelDiscovery();
                try {
                    bs = this.bluetoothSocket.connect();
                    success = true;
                    break;
                } catch (IOException e) {
                    try {
                        this.bluetoothSocket = new FallbackBluetoothSocket(this.bluetoothSocket.getUnderlyingSocket());
                        Thread.sleep(500L);
                        bs = this.bluetoothSocket.connect();
                        success = true;
                        break;
                    } catch (FallbackException e2) {
                        Log.w(str, "Could not initialize FallbackBluetoothSocket classes.", e);
                    } catch (IOException e1) {
                        Log.w(str, "Fallback failed. Cancelling.", e1);
                        e1.printStackTrace();
                    } catch (InterruptedException e3) {
                        Log.w(str, e3.getMessage(), e3);
                    }
                }
            }
            if (!success) {
                throw new IOException("Could not connect to device: " + this.device.getAddress());
            }
            return bs;
        }

        private boolean selectSocket() throws IOException {
            BluetoothSocket tmp;
            if (this.candidate >= this.uuidCandidates.size()) {
                return false;
            }
            List<UUID> list = this.uuidCandidates;
            int i = this.candidate;
            this.candidate = i + 1;
            UUID uuid = list.get(i);
            Log.i("BT", "Attempting to connect to Protocol: " + uuid);
            if (this.secure) {
                tmp = this.device.createRfcommSocketToServiceRecord(uuid);
            } else {
                tmp = this.device.createInsecureRfcommSocketToServiceRecord(uuid);
            }
            this.bluetoothSocket = new NativeBluetoothSocket(tmp);
            return true;
        }

        public static class NativeBluetoothSocket implements BluetoothSocketWrapper {
            private BluetoothSocket socket;

            public NativeBluetoothSocket(BluetoothSocket tmp) {
                this.socket = tmp;
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public InputStream getInputStream() throws IOException {
                return this.socket.getInputStream();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public OutputStream getOutputStream() throws IOException {
                return this.socket.getOutputStream();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public String getRemoteDeviceName() {
                return this.socket.getRemoteDevice().getName();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public BluetoothSocket connect() throws IOException {
                this.socket.connect();
                return getUnderlyingSocket();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public String getRemoteDeviceAddress() {
                return this.socket.getRemoteDevice().getAddress();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public void close() throws IOException {
                this.socket.close();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public BluetoothSocket getUnderlyingSocket() {
                return this.socket;
            }
        }

        public class FallbackBluetoothSocket extends NativeBluetoothSocket {
            private BluetoothSocket fallbackSocket;

            public FallbackBluetoothSocket(BluetoothSocket tmp) throws FallbackException {
                super(tmp);
                try {
                    Class<?> clazz = tmp.getRemoteDevice().getClass();
                    Class<?>[] paramTypes = {Integer.TYPE};
                    Method m = clazz.getMethod("createRfcommSocket", paramTypes);
                    Object[] params = {1};
                    this.fallbackSocket = (BluetoothSocket) m.invoke(tmp.getRemoteDevice(), params);
                } catch (Exception e) {
                    throw new FallbackException(e);
                }
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.NativeBluetoothSocket, com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public InputStream getInputStream() throws IOException {
                return this.fallbackSocket.getInputStream();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.NativeBluetoothSocket, com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public OutputStream getOutputStream() throws IOException {
                return this.fallbackSocket.getOutputStream();
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.NativeBluetoothSocket, com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public BluetoothSocket connect() throws IOException {
                this.fallbackSocket.connect();
                return this.fallbackSocket;
            }

            @Override // com.trimline.metrocrew.Printer.BluetoothConnector.NativeBluetoothSocket, com.trimline.metrocrew.Printer.BluetoothConnector.BluetoothSocketWrapper
            public void close() throws IOException {
                this.fallbackSocket.close();
            }
        }

        public static class FallbackException extends Exception {
            private static final long serialVersionUID = 1;

            public FallbackException(Exception e) {
                super(e);
            }
        }
    }
}
