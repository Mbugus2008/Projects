package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.InputType;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.DatePicker;
import android.widget.ImageView;
import android.widget.Toast;

import com.trimline.pawdep.databinding.Receiptsbinding;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Receipts_app extends AppCompatActivity {
    Receiptsbinding receiptsbinding;
    Receipt_lines.adapter adapter;
    RecyclerView recyclerView;
    Receipts.Repository repository;
    Receipts.Model rmodel;
    Receipt_lines.dao rldao;
    Receipts.dao rdao;

    List<Receipts> data;
    List<Receipt_lines> receipt_lines;
    Member.Model mmodel;
    Group.Model gmodel;
    Banks.Model bmodel;
    ImageView add;
    Calendar myCalendar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.receipts_app);
        receiptsbinding = DataBindingUtil.setContentView(this, R.layout.receipts_app);
        Receipts r = new Receipts();
        DB db = DB.getInstance(this);
        rldao = db.rldao();
        rdao = db.rdao();
        repository = new Receipts.Repository(this.getApplication()   );
        rmodel = ViewModelProviders.of(this)
                .get(Receipts.Model.class);
        gmodel = ViewModelProviders.of(this)
                .get(Group.Model.class);
        mmodel = ViewModelProviders.of(this)
                .get(Member.Model.class);
        bmodel = ViewModelProviders.of(this)
                .get(Banks.Model.class);

        Intent i = getIntent();
        rmodel.r = (Receipts) i.getSerializableExtra("list");
        getSupportActionBar().setTitle("RECEIPTS");
        getSupportActionBar().setSubtitle(rmodel.r.Document_No);

        List<String> enumNames = Stream.of(Receipts.Receipt_Modes.values())
                .map(Receipts.Receipt_Modes::name)
                .collect(Collectors.toList());

        receiptsbinding.txtReceiptmode.setAdapter(new Pawdep.Ttypes(this,
                R.layout.enums, enumNames));
        receiptsbinding.txtReceiptmode.setInputType(InputType.TYPE_NULL);
//        receiptsbinding.txtReceiptmode.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//                System.out.println("herrreeeee");
//                receiptsbinding.txtReceiptmode.showDropDown();
//            }
//        });
        receiptsbinding.txtReceiptmode.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                System.out.println("herrreeeeerrrrr");
                receiptsbinding.txtReceiptmode.showDropDown();
                return false;
            }
        });

        receiptsbinding.setReceipts(rmodel.r);

        recyclerView = findViewById(R.id.receipt_line);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        bmodel.getbanks(receiptsbinding.txtBankCode);

        gmodel.getgroups(receiptsbinding.txtGroupname);

        receiptsbinding.txtGroupname.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                System.out.println("Here");
                Group g = (Group) parent.getItemAtPosition(position);
                if (g != null) {
                    mmodel.getgroupmembers(receiptsbinding.txtMemberno, g.Group_Name);
                    System.out.println(g.Group_Name);
                }
            }
        });
        add = (ImageView) findViewById(R.id.add);

        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Receipts r = receiptsbinding.getReceipts();
                if (r.Group_Name==null)
                {
                    Toast.makeText(Receipts_app.this, "Please select group name above", Toast.LENGTH_SHORT).show();
                    return;
                }
                Receipt_lines a = new Receipt_lines();
                a.No = r.No;
                a.No_ = Pawdep.Uid();
                a.Account_Type=1;
                a.Account_No = r.Member_No;
                if (receipt_lines == null)
                    receipt_lines = new ArrayList<>();
                receipt_lines.add(a);
                if (adapter == null) {
                    adapter = new Receipt_lines.adapter(Receipts_app.this, receiptsbinding.getReceipts());
                    adapter.sett_line(receipt_lines);
                    recyclerView.setAdapter(adapter);
                }
                adapter.notifyItemInserted(receipt_lines.size() - 1);
                recyclerView.scrollToPosition(adapter.getItemCount() - 1);
            }
        });

        myCalendar = Calendar.getInstance();

        final DatePickerDialog.OnDateSetListener date = new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear,
                                  int dayOfMonth) {
                // TODO Auto-generated method stub
                myCalendar.set(Calendar.YEAR, year);
                myCalendar.set(Calendar.MONTH, monthOfYear);
                myCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                String myFormat = "dd/MM/yy"; //In which you need put here
                SimpleDateFormat sdf = new SimpleDateFormat(myFormat, Locale.US);
                receiptsbinding.txtDate.setText(sdf.format(myCalendar.getTime()));
            }

        };

        receiptsbinding.txtDate.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                new DatePickerDialog(Receipts_app.this, date, myCalendar
                        .get(Calendar.YEAR), myCalendar.get(Calendar.MONTH),
                        myCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });
        new getadapterdata().execute(rmodel.r.No);
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.savereceipt, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.post:

                rmodel.sendforapproval(receiptsbinding.getReceipts());
                return true;
            case R.id.save:
                rmodel.insert(receiptsbinding.getReceipts());
                //  finish();
                return true;
            case R.id.printreceip:

                repository.printreceipts(receiptsbinding.getReceipts());

                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<String, Void, List<Receipt_lines>> {
        @Override
        protected List<Receipt_lines> doInBackground(String... notes) {
            return rldao.getreceiptlines(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Receipt_lines> res) {
            if (res.size() > 0) {
                receipt_lines = res;
                adapter = new Receipt_lines.adapter(getApplicationContext(),receiptsbinding.getReceipts());
                adapter.sett_line(receipt_lines);
                recyclerView.setAdapter(adapter);
            }
        }
    }

    private class savereceipt extends AsyncTask<Receipts, Void, Long> {
        @Override
        protected Long doInBackground(Receipts... notes) {
            return rdao.Insert(notes[0]);
        }
        @Override
        protected void onPostExecute(Long res) {
            if (res ==1) {
                Toast.makeText(Receipts_app.this, "Receipt saved succefully", Toast.LENGTH_SHORT).show();
            }
        }
    }
}
