package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.trimline.pawdep.databinding.Noncash;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Non_Cash_Tran extends AppCompatActivity {
    Non_Cash.Model nmodel;
    RecyclerView recyclerView;
    Member.Model mmodel;
    Non_Cash.adapter adapter;
    List<Non_Cash> advances;
    Noncash b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_non__cash__tran);

        nmodel = ViewModelProviders.of(this)
                .get(Non_Cash.Model.class);

        Intent i = getIntent();
        nmodel.t = (Transaction) i.getSerializableExtra("list");
        b = DataBindingUtil.setContentView(this, R.layout.activity_non__cash__tran);

        getSupportActionBar().setTitle(nmodel.t.Group_Name );
        getSupportActionBar().setSubtitle("Non Cash Transactions");
        recyclerView = findViewById(R.id.Noncash);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        new getadapterdata().execute(nmodel.t.Transaction_No);
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.advances_menu, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:
                Non_Cash a = new Non_Cash();
                Date c = Calendar.getInstance().getTime();
//                271019235723
                SimpleDateFormat  df = new SimpleDateFormat("ddMMyyHHmmss");
                a.Auto = Long.valueOf(df.format(c));
                a.Transaction_Code = nmodel.t.Transaction_No;
                a.Member_No = "";
                a.Pawdep_No = "";
                a.Member_Name = "";
                a.Amount = 0;
                if (advances == null)
                    advances = new ArrayList<>();
                advances.add(a);

                if (adapter == null) {
                    adapter = new Non_Cash.adapter(getApplicationContext(), nmodel.t);
                    adapter.sett_line(advances);
                    recyclerView.setAdapter(adapter);
                }
                adapter.notifyItemInserted(advances.size() - 1);
                recyclerView.scrollToPosition(adapter.getItemCount() - 1);
                return true;

            case R.id.save:

                recyclerView.requestFocus();

                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<String, Void, List<Non_Cash>> {
        @Override
        protected List<Non_Cash> doInBackground(String... notes) {
            return   nmodel.Dao.getgrouptransaction(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Non_Cash> res) {
            if(res.size()>0) {
                Log.i("hapa","hapa");
                advances =res;
                adapter = new Non_Cash.adapter(Non_Cash_Tran.this, nmodel.t);
                adapter.sett_line(advances);
                recyclerView.setAdapter(adapter);
            }
        }
    }
}
