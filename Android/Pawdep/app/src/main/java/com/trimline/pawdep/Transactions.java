package com.trimline.pawdep;


import androidx.lifecycle.ViewModelProviders;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import androidx.databinding.DataBindingUtil;
import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;


import android.os.Handler;
import android.os.Message;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import com.trimline.pawdep.databinding.Grouplist;
import com.google.gson.Gson;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class Transactions extends AppCompatActivity {
    public static final int ADD_TRANS = 1;
    public static final int Edit_TRANS = 1;
    Transaction.adapter adapter;
    Transaction.Model tmodel;
    RecyclerView recyclerView;
    SharedPreferences preferences;
    private Printer.printer p = new Printer.printer();
    Printer.Printerthread sp;
    private String mConnectedDeviceName = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getSupportActionBar().setTitle("Group Transaction");
        getSupportActionBar().setIcon(getDrawable(R.drawable.logo2));
        tmodel = ViewModelProviders.of(this)
                .get(Transaction.Model.class);
        Grouplist b = DataBindingUtil.setContentView(this, R.layout.activity_main);
        recyclerView = findViewById(R.id.recycler_view);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(true);
        new getadapterdata().execute();
        adapter    = new Transaction.adapter(Transactions.this);

        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        JsonParser.preferences = preferences;
        Printer.mHandler = mHandler;
        sp = new Printer.Printerthread(preferences);
        sp.start();

//        tmodel.getAll().observe(this, new Observer<List<Transaction>>() {
//            @Override
//            public void onChanged(@Nullable List<Transaction> notes) {
//                adapter.setTrans(notes);
//            }
//        });
        adapter.setOnItemClickListener(new Transaction.adapter.OnItemClickListener() {
            @Override
            public void onItemClick(Transaction note) {
                if (note.Posted) {
                    Toast.makeText(getApplicationContext(), "Posted Transactions cannot be edited", Toast.LENGTH_LONG).show();
                    //return;
                }
                Intent intent = new Intent(Transactions.this, addedittrans.class);
                intent.putExtra("Transaction", note);
                startActivityForResult(intent, Edit_TRANS);
            }
        });

//        new ItemTouchHelper(new ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT | ItemTouchHelper.RIGHT) {
//
//            @Override
//            public boolean onMove(@NonNull RecyclerView recyclerView, @NonNull RecyclerView.ViewHolder viewHolder, @NonNull RecyclerView.ViewHolder target) {
//                return false;
//            }
//            @Override
//            public void onSwiped(@NonNull RecyclerView.ViewHolder viewHolder, int direction) {
//                switch (direction) {
//                    case ItemTouchHelper.RIGHT: {
//                        Intent intent = new Intent(Transactions.this, transline.class);
//                        intent.putExtra("list", adapter.getTransAt(viewHolder.getAdapterPosition()));
//                        startActivityForResult(intent, Edit_TRANS);
//                        adapter.notifyDataSetChanged();
//                        break;
//                    }
//                    case ItemTouchHelper.LEFT: {
//                        break;
//                    }
//                }
//            }
//        }).attachToRecyclerView(recyclerView);
    }

    private class getadapterdata extends AsyncTask<Void, Void, List<Transaction>> {

        @Override
        protected List<Transaction> doInBackground(Void... notes) {

            return   tmodel.getAll();
        }
        @Override
        protected void onPostExecute(List<Transaction> res) {
            if(res.size()>0) {

                adapter.setTrans(res);
                recyclerView.setAdapter(adapter);
            }

        }
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.trans, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:
                add();
                return true;
            case R.id.refresh:
                new getadapterdata().execute();
                Runnable myRunnable5 = new Runnable() {
                    @Override
                    public void run() {
                        new worker(Transactions.this).sendtrans();
                    }
                };
                new Thread(myRunnable5).start();
                return true;
            case R.id.set:
                Intent summary = new Intent(Transactions.this, Settings.class);
                startActivity(summary);
                return true;
            case R.id.Receipts:
                Intent rec = new Intent(Transactions.this, Receipts_list.class);
                startActivityForResult(rec, 0);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
        @Override
        public void onResume(){
        super.onResume();
       new getadapterdata().execute();
    }
    private void add() {
        new addnew().execute();
    }

    private class addnew extends AsyncTask<Void, Void, List<Transaction>> {

        @Override
        protected List<Transaction> doInBackground(Void... notes) {
            return   tmodel.notposted();
        }
        @Override
        protected void onPostExecute(List<Transaction> res) {
//            if(res.size()>0) {
//                Toast.makeText(Transactions.this, "You have some Group transactions not sent for approval, Kindly send them for approval or remove them before you create new one.", Toast.LENGTH_LONG).show();
//                           }
//            else {
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yy");
                String tDate = df.format(c);
                df = new SimpleDateFormat("ddMMyyHHmmss");
                String no = df.format(c);

                Intent intent = new Intent(Transactions.this, addedittrans.class);
                Transaction t = new Transaction();
                TelephonyManager mngr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                String iidd = mngr.getDeviceId();
                t.StringDate = tDate;
                t.Transaction_No = String.format("%s%s", iidd.substring(iidd.length() - 7), no);
                t.Group_Officer_Code = Pawdep.Agent.Code;
                intent.putExtra("Transaction", t);
                startActivityForResult(intent, ADD_TRANS);
//            }
        }
    }

    private class opentranslines extends AsyncTask<String, Void, List<T_line>> {
        @Override
        protected List<T_line> doInBackground(String... notes) {
            return tmodel.tdao.Transctionline(notes[0]);
        }
        @Override
        protected void onPostExecute(List<T_line> res) {
            if (res.size() > 0) {
                String tlines = new Gson().toJson(res);
                Intent intent = new Intent(Transactions.this, transline.class);
                intent.putExtra("list", tlines);
                startActivityForResult(intent, Edit_TRANS);
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == ADD_TRANS && resultCode == RESULT_OK) {
            Transaction t = (Transaction) data.getSerializableExtra("Transaction");

            tmodel.insert(t);


        }
    }



    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
//
                case Printer.Constants.MESSAGE_WRITE:
                    byte[] writeBuf = (byte[]) msg.obj;
                    // construct a string from the buffer
                    String writeMessage = new String(writeBuf);

                    break;

                case Printer.Constants.PRINTER_CONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer connected", Toast.LENGTH_LONG).show();
                   // printer.setChecked(true);
                    break;

                case Printer.Constants.PRINTER_DISCONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer Disconnected", Toast.LENGTH_LONG).show();
                    //printer.setChecked(false);
                    break;

                case Printer.Constants.PRINTER_MESSAGE_READ:
                    byte[] preadBuf = (byte[]) msg.obj;
                    // construct a string from the valid bytes in the buffer
                    String preadMessage = new String(preadBuf, 0, msg.arg1);
                    Log.i("Printer Data Recieved", preadMessage);
                    String[] pread = preadMessage.split("\n");
                    break;
                case Printer.Constants.MESSAGE_DEVICE_NAME:
                    // save the connected device's name
                    mConnectedDeviceName = msg.getData().getString(Printer.Constants.DEVICE_NAME);
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), "Connected to "
                                + mConnectedDeviceName, Toast.LENGTH_SHORT).show();
                    }
                    break;
                case Printer.Constants.MESSAGE_TOAST:
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), msg.getData().getString(Printer.Constants.TOAST),
                                Toast.LENGTH_LONG).show();
                    }
                    break;
            }
        }
    };
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                try {
                    BluetoothDevice device = intent
                            .getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    if (Printer.printer.printerdevice.equals(device)) {
                        Printer.printer.printersock.close();
                        Printer.printer.printerout.close();
                        mHandler.obtainMessage(Printer.Constants.PRINTER_DISCONNECTED).sendToTarget();

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    };
}
