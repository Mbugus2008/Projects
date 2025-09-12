package com.trimline.sales;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.BindingAdapter;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.InverseBindingAdapter;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


import com.facebook.stetho.Stetho;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.sales.databinding.Sales_invoices;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {
    Sales_invoice_lines.adapter adapter;
    RecyclerView recyclerView;
    Sales_invoice_lines.Repository repository;
    Sales_invoice.Repository srepo;
    Sales_invoice_lines.Model model;
    Sales_invoice_lines.dao sldao;
    Sales_invoices sales_invoice;
    Button newline;
    List<Sales_invoice_lines> lines = new ArrayList<>();
    item.Repository irepo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Stetho.initializeWithDefaults(this);
        sales_invoice = DataBindingUtil.setContentView(this, R.layout.activity_main);
        DB db = DB.getInstance(this);
        irepo = new item.Repository(this.getApplication());
        srepo = new Sales_invoice.Repository(this.getApplication());
        sldao = db.slDao();
        Date c = Calendar.getInstance().getTime();
        SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");
        Sales_invoice s = new Sales_invoice();
        s.No =df.format(c);// UUID.randomUUID().toString();
        s.Sell_to_Customer_No = "CASH";
s.Sell_to_Customer_Name ="Cash";
s.Document_Type ="Invoice";
s.Salesperson_Code ="PAUL";
         df = new SimpleDateFormat("dd/MM/yyyy");

        s.DocumentDate = df.format(c);
        sales_invoice.setInvoice(s);

        recyclerView = findViewById(R.id.receipt_line);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        adapter = new Sales_invoice_lines.adapter(getApplicationContext(), s);
        adapter.sett_line(lines);
        recyclerView.setAdapter(adapter);

        newline = (Button) findViewById(R.id.newline);
        newline.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Sales_invoice_lines sl = new Sales_invoice_lines();
             Sales_invoice si =   sales_invoice.getInvoice();
                sl.Document_No = si.No;
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("HHmmss");
                sl.Line_No = Integer.valueOf(df.format(c));
                sl.Type = "Item";
                sl.Location_Code ="BANDARI";
                lines.add(sl);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    si.Total =(float) lines.stream().mapToDouble(o-> o.Line_Amount).sum();
                }
                sales_invoice.setInvoice(si);
                adapter.notifyItemInserted(lines.size() - 1);
            }
        });
    new getitems().execute();
        new getadapterdata().execute(s.No);

    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            case R.id.Save:
                srepo.insert(sales_invoice.getInvoice());
                recyclerView.requestFocus();
new sendsales().execute(sales_invoice.getInvoice());
                return true;
                case R.id.Print:

                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<String, Void, List<Sales_invoice_lines>> {
        @Override
        protected List<Sales_invoice_lines> doInBackground(String... notes) {
            return sldao.getreceiptlines(notes[0]);
        }

        @Override
        protected void onPostExecute(List<Sales_invoice_lines> res) {
            if (res.size() > 0) {

                adapter = new Sales_invoice_lines.adapter(getApplicationContext(), sales_invoice.getInvoice());
                adapter.sett_line(res);
                recyclerView.setAdapter(adapter);
            }
        }
    }

    private class getitems extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... notes) {
            Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            String alines = JsonParser.postjson("items", null, null);
            Type adv = new TypeToken<List<item>>() {
            }.getType();
            List<item> lg = g.fromJson(alines, adv);
            if (lg != null)
                irepo.insert(lg);
            return null;
        }
    }
    private class sendsales extends AsyncTask<Sales_invoice, Void, Void> {
        @Override
        protected Void doInBackground(Sales_invoice... notes) {
            Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            String alines = JsonParser.postjson("Sales_header", "data", g.toJson(notes[0]));
            Type adv = new TypeToken<List<item>>() {
            }.getType();


            List<Sales_invoice_lines> sl =  sldao.getreceiptlines(notes[0].No);
            for (Sales_invoice_lines s:sl
                 ) {
                 alines = JsonParser.postjson("Sales_line", "data", g.toJson(s));
                 adv = new TypeToken<List<item>>() {
                }.getType();

            }
            return null;
        }
    }
}
