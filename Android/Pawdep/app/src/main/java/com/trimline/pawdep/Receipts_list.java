package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.trimline.pawdep.databinding.Receiptsbinding;
import com.trimline.pawdep.databinding.Receiptsheader;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Receipts_list extends AppCompatActivity {
    Receipts.Model rmodel;
    Receiptsheader receiptsheader;
    RecyclerView recyclerView;
    Receipts.dao rdao;
   Receipts.adapter adapter;
  List<Receipts> receipts;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.receipts_list);
        DB db = DB.getInstance(this);
        rdao = db.rdao();
        getSupportActionBar().setTitle("RECEIPTS");

        receiptsheader = DataBindingUtil.setContentView(this, R.layout.receipts_list);
        recyclerView = (RecyclerView) findViewById(R.id.receiptslist);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        adapter = new Receipts.adapter(getApplicationContext());
        new getadapterdata().execute();

        adapter.setOnItemClickListener(new Receipts.adapter.OnItemClickListener() {
            @Override
            public void onItemClick(Receipts note) {

                Intent intent = new Intent(Receipts_list.this, Receipts_app.class);
                intent.putExtra("list", note);
                startActivityForResult(intent, 0);
            }
        });
    }
    @Override
    public void onResume(){
        super.onResume();

            new getadapterdata().execute();

    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.receipts, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:


                Receipts a = new Receipts();
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                a.No = df.format(c);
                if (receipts == null)
                    receipts = new ArrayList<>();


                Intent i = new Intent(Receipts_list.this, Receipts_app.class);
                i.putExtra("list", a);
                startActivityForResult(i, 0);
                return true;

            case R.id.save:
                recyclerView.requestFocus();
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<String, Void, List<Receipts>> {
        @Override
        protected List<Receipts> doInBackground(String... notes) {
            return rdao.getAll();
        }
        @Override
        protected void onPostExecute(List<Receipts> res) {
            if (res.size() > 0) {

                adapter.sett_line(res);
                recyclerView.setAdapter(adapter);
            }
        }
    }
}
