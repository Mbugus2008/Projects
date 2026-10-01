package com.trimline.metrocrew;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.internal.view.SupportMenu;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import java.util.function.ToDoubleFunction;
import java.util.stream.Collectors;
import org.apache.commons.cli.HelpFormatter;

/* JADX INFO: loaded from: classes5.dex */
public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener, View.OnClickListener {
    private static final int REQUEST_BLUETOOTH_PERMISSIONS = 1001;
    String date;
    private int mDay;
    private int mHour;
    private int mMinute;
    private int mMonth;
    private int mYear;
    SharedPreferences preferences;
    CheckBox printer;
    FloatingActionButton receipts;
    Button setdate;
    Printer.Printerthread sp;
    theader.Model theaderModel;
    TextView tillbal;
    List<theader> transList;
    transaction.Model transModel;
    List<transaction> transactions;
    private Printer.printer p = new Printer.printer();
    private String mConnectedDeviceName = null;
    private final Handler mHandler = new Handler() { // from class: com.trimline.metrocrew.MainActivity.10
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 3:
                    byte[] writeBuf = (byte[]) msg.obj;
                    new String(writeBuf);
                    break;
                case 4:
                    MainActivity.this.mConnectedDeviceName = msg.getData().getString("device_name");
                    if (MainActivity.this.getApplicationContext() != null) {
                        Toast.makeText(MainActivity.this.getApplicationContext(), "Connected to " + MainActivity.this.mConnectedDeviceName, 0).show();
                    }
                    break;
                case 5:
                    if (MainActivity.this.getApplicationContext() != null) {
                        Toast.makeText(MainActivity.this.getApplicationContext(), msg.getData().getString("toast"), 1).show();
                    }
                    break;
                case 9:
                    Toast.makeText(MainActivity.this.getApplicationContext(), "Printer connected", 1).show();
                    MainActivity.this.printer.setChecked(true);
                    MainActivity.this.printer.setText("Printer Connected");
                    MainActivity.this.printer.setTextColor(-16711936);
                    break;
                case 10:
                    Toast.makeText(MainActivity.this.getApplicationContext(), "Printer Disconnected", 1).show();
                    MainActivity.this.printer.setChecked(false);
                    MainActivity.this.printer.setText("Printer Disconnected");
                    MainActivity.this.printer.setTextColor(SupportMenu.CATEGORY_MASK);
                    break;
                case 11:
                    byte[] preadBuf = (byte[]) msg.obj;
                    String preadMessage = new String(preadBuf, 0, msg.arg1);
                    Log.i("Printer Data Recieved", preadMessage);
                    preadMessage.split("\n");
                    break;
            }
        }
    };

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        permissions();
        this.theaderModel = (theader.Model) ViewModelProviders.of(this).get(theader.Model.class);
        this.transModel = (transaction.Model) ViewModelProviders.of(this).get(transaction.Model.class);
        this.printer = (CheckBox) findViewById(R.id.printer);
        this.printer.setText("Printer Disconnected");
        this.printer.setTextColor(SupportMenu.CATEGORY_MASK);
        this.preferences = getSharedPreferences("Settings", 0);
        JsonParser.preferences = this.preferences;
        Printer.mHandler = this.mHandler;
        this.sp = new Printer.Printerthread(this.preferences);
        this.sp.start();
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        Calendar c = Calendar.getInstance();
        DecimalFormat mFormat = new DecimalFormat("00");
        this.mYear = c.get(1);
        this.mMonth = c.get(2);
        this.mDay = c.get(5);
        this.date = mFormat.format(Double.valueOf(this.mDay)) + HelpFormatter.DEFAULT_OPT_PREFIX + mFormat.format(Double.valueOf(this.mMonth + 1)) + HelpFormatter.DEFAULT_OPT_PREFIX + this.mYear;
        this.setdate = (Button) findViewById(R.id.Date);
        this.setdate.setOnClickListener(this);
        this.setdate.setText(this.date);
        this.receipts = (FloatingActionButton) findViewById(R.id.Receipts);
        this.receipts.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.MainActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) Receipts.class));
            }
        });
        this.tillbal = (TextView) findViewById(R.id.tillbal);
        if (agent.Model.CurrentAgent != null) {
            this.tillbal.setText(Html.fromHtml(String.format("TILL BAL: <b>%,.2f</b>", Double.valueOf(agent.Model.CurrentAgent.Balance))));
        }
        theader.adapter adapter2 = new theader.adapter(this);
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.headerlist);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(true);
        recyclerView.setAdapter(adapter2);
        adapter2.setOnItemClickListener(new AnonymousClass2());
        this.theaderModel.gettodaystransactions().observe(this, new AnonymousClass3(adapter2));
        this.transModel.getall().observe(this, new Observer<List<transaction>>() { // from class: com.trimline.metrocrew.MainActivity.4
            @Override // androidx.lifecycle.Observer
            public void onChanged(List<transaction> notes) {
                MainActivity.this.transactions = notes;
            }
        });
    }

    /* JADX INFO: renamed from: com.trimline.metrocrew.MainActivity$2, reason: invalid class name */
    class AnonymousClass2 implements theader.adapter.OnItemClickListener {
        AnonymousClass2() {
        }

        @Override // com.trimline.metrocrew.theader.adapter.OnItemClickListener
        public void onItemClick(final theader note) {
            MainActivity.this.ConfirmationBox(note, (List) MainActivity.this.transactions.stream().filter(new Predicate() { // from class: com.trimline.metrocrew.MainActivity$2$$ExternalSyntheticLambda0
                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    return ((transaction) obj).No.contentEquals(note.No);
                }
            }).collect(Collectors.toList()));
        }
    }

    /* JADX INFO: renamed from: com.trimline.metrocrew.MainActivity$3, reason: invalid class name */
    class AnonymousClass3 implements Observer<List<theader>> {
        final /* synthetic */ theader.adapter val$adapter;

        AnonymousClass3(final theader.adapter val$adapter) {
            this.val$adapter = val$adapter;
        }

        @Override // androidx.lifecycle.Observer
        public void onChanged(List<theader> notes) {
            MainActivity.this.transList = notes;
            Log.i("notes", new Gson().toJson(notes));
            if (agent.Model.CurrentAgent != null) {
                MainActivity.this.new tillbalances(agent.Model.CurrentAgent).execute(new Void[0]);
                SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
                final String date = sd.format((Date) new java.sql.Date(Calendar.getInstance().getTime().getTime()));
                MainActivity.this.tillbal.setText(Html.fromHtml(String.format("Todays Col:<b>%,.2f</b>", Float.valueOf((float) notes.stream().filter(new Predicate() { // from class: com.trimline.metrocrew.MainActivity$3$$ExternalSyntheticLambda0
                    @Override // java.util.function.Predicate
                    public final boolean test(Object obj) {
                        return ((theader) obj).Getdate().contains(date);
                    }
                }).mapToDouble(new ToDoubleFunction() { // from class: com.trimline.metrocrew.MainActivity$3$$ExternalSyntheticLambda1
                    @Override // java.util.function.ToDoubleFunction
                    public final double applyAsDouble(Object obj) {
                        return ((theader) obj).Amount_Recieved;
                    }
                }).sum()))));
            }
            this.val$adapter.setTransactions(notes);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        DatePickerDialog datePickerDialog = new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() { // from class: com.trimline.metrocrew.MainActivity.5
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                DecimalFormat mFormat = new DecimalFormat("00");
                MainActivity.this.date = mFormat.format(Double.valueOf(dayOfMonth)) + HelpFormatter.DEFAULT_OPT_PREFIX + mFormat.format(Double.valueOf(monthOfYear + 1)) + HelpFormatter.DEFAULT_OPT_PREFIX + year;
                MainActivity.this.setdate.setText(MainActivity.this.date);
            }
        }, this.mYear, this.mMonth, this.mDay);
        datePickerDialog.show();
    }

    @Override // com.google.android.material.navigation.NavigationView.OnNavigationItemSelectedListener
    public boolean onNavigationItemSelected(MenuItem item) {
        Intent i = null;
        int id = item.getItemId();
        if (id == R.id.nav_settings) {
            i = new Intent(this, (Class<?>) Settings.class);
        } else if (id != R.id.summary && id != R.id.vehicle_collection && id == R.id.receipts) {
            i = new Intent(this, (Class<?>) transaction_details.class);
        }
        if (i != null) {
            startActivity(i);
        }
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void ConfirmationBox(final theader th, final List<transaction> t) {
        LayoutInflater li = LayoutInflater.from(this);
        View promptsView = li.inflate(R.layout.tdetails, (ViewGroup) null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
        alertDialogBuilder.setView(promptsView);
        RecyclerView otp = (RecyclerView) promptsView.findViewById(R.id.tdetails);
        adapter adapter2 = new adapter(this);
        adapter2.setTransactions(t);
        otp.setLayoutManager(new LinearLayoutManager(this));
        otp.setHasFixedSize(true);
        otp.setAdapter(adapter2);
        alertDialogBuilder.setCancelable(true).setTitle(String.format("Receipt No: %s", t.get(0).No)).setPositiveButton("Reprint", new DialogInterface.OnClickListener() { // from class: com.trimline.metrocrew.MainActivity.7
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
            }
        }).setNegativeButton("Ok", new DialogInterface.OnClickListener() { // from class: com.trimline.metrocrew.MainActivity.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(16);
        adialog.show();
        adialog.getButton(-1).setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.MainActivity.8
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (th.Print_No == 0) {
                    Bitmap b = BitmapFactory.decodeResource(MainActivity.this.getResources(), R.drawable.clear_24dp);
                    th.tlines = t;
                    MainActivity.this.p.printcollection(b, th);
                    adialog.dismiss();
                    return;
                }
                Toast.makeText(MainActivity.this, "Receipt has been cancelled", 0).show();
            }
        });
        adialog.getButton(-2).setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.MainActivity.9
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                adialog.dismiss();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    class tillbalances extends AsyncTask<Void, agent, List<agent>> {
        agent aa;

        public tillbalances(agent a) {
            this.aa = a;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public List<agent> doInBackground(Void... params) throws Throwable {
            try {
                new Gson();
                String result = JsonParser.postjson("Users", null, null);
                Type localType = new TypeToken<List<loan>>() { // from class: com.trimline.metrocrew.MainActivity.tillbalances.1
                }.getType();
                List<agent> results = (List) new Gson().fromJson(result, localType);
                return results;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(List<agent> res) {
            if (res != null) {
                try {
                    if (res.size() > 0) {
                        List<agent> a = (List) res.stream().filter(new Predicate() { // from class: com.trimline.metrocrew.MainActivity$tillbalances$$ExternalSyntheticLambda0
                            @Override // java.util.function.Predicate
                            public final boolean test(Object obj) {
                                return this.f$0.m436x7d6d24a9((agent) obj);
                            }
                        }).collect(Collectors.toList());
                        if (a.size() > 0) {
                            agent.Model.CurrentAgent = a.get(0);
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }

        /* JADX INFO: renamed from: lambda$onPostExecute$0$com-trimline-metrocrew-MainActivity$tillbalances, reason: not valid java name */
        /* synthetic */ boolean m436x7d6d24a9(agent o) {
            return o.Agent_Code.contains(this.aa.Agent_Code);
        }
    }

    public void permissions() {
        if (Build.VERSION.SDK_INT >= 31) {
            if (ContextCompat.checkSelfPermission(this, "android.permission.BLUETOOTH_CONNECT") != 0 || ContextCompat.checkSelfPermission(this, "android.permission.BLUETOOTH_SCAN") != 0) {
                ActivityCompat.requestPermissions(this, new String[]{"android.permission.BLUETOOTH_CONNECT", "android.permission.BLUETOOTH_SCAN"}, 1001);
                return;
            }
            return;
        }
        if (ContextCompat.checkSelfPermission(this, "android.permission.BLUETOOTH") != 0) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.BLUETOOTH"}, 1001);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == 1001) {
            if (grantResults.length > 0 && grantResults[0] == 0) {
                Toast.makeText(this, "Bluetooth permission granted", 0).show();
            } else {
                Toast.makeText(this, "Bluetooth permission denied", 0).show();
            }
        }
    }

    public static class adapter extends RecyclerView.Adapter<Holder> {
        private final LayoutInflater mInflater;
        private List<transaction> theaders;

        adapter(Context context) {
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public Holder onCreateViewHolder(ViewGroup parent, int viewType) {
            View itemView = this.mInflater.inflate(R.layout.transline, parent, false);
            return new Holder(itemView);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(Holder holder, int position) {
            transaction currentNote = this.theaders.get(position);
            new SimpleDateFormat("dd-MM-yy HH:mm:ss");
            holder.mode.setText(currentNote.PayMode);
            holder.type.setText(currentNote.transtype);
            holder.amount.setText(String.valueOf(currentNote.Amount));
        }

        void setTransactions(List<transaction> words) {
            this.theaders = words;
            notifyDataSetChanged();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (this.theaders != null) {
                return this.theaders.size();
            }
            return 0;
        }

        class Holder extends RecyclerView.ViewHolder {
            private TextView amount;
            private TextView mode;
            private TextView type;

            private Holder(View itemView) {
                super(itemView);
                this.mode = (TextView) itemView.findViewById(R.id.type);
                this.type = (TextView) itemView.findViewById(R.id.paymode);
                this.amount = (TextView) itemView.findViewById(R.id.amount);
            }
        }
    }
}
