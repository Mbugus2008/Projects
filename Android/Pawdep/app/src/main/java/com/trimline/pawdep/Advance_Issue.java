package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.trimline.pawdep.databinding.Advanceissue;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Advance_Issue extends AppCompatActivity {
Advance.Model amodel;
RecyclerView recyclerView;
Member.Model mmodel;
     Advance.adapter adapter;
     List<Advance> advances;
    Advanceissue b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_advance__issue);

        amodel = ViewModelProviders.of(this)
                .get(Advance.Model.class);


        Intent i = getIntent();
       amodel.t= (Transaction) i.getSerializableExtra("list");
        b= DataBindingUtil.setContentView(this, R.layout.activity_advance__issue);
        getSupportActionBar().setTitle(amodel.t.Group_Name );
        getSupportActionBar().setSubtitle("Advance issue");
        recyclerView = findViewById(R.id.Advanceissue);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        new getadapterdata().execute(amodel.t.Transaction_No);
    }
    @Override
    public void onBackPressed() {
      recyclerView.requestFocus();
        finish();
        return;
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
                Advance a = new Advance();
                a.Transaction_No = amodel.t.Transaction_No;
                a.Group_Name = amodel.t.Group_Name;
                a.Group_Code = amodel.t.Group_Code;
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                a.Adv_Loan_No  = df.format(c);

                a.Instalments = 1;
                a.Advance_Fees = 50;
                a.Member_No = "";
                a.Pawdep_No = "";
                a.Member_Name = "";
                a.Amount = 0;
                if (advances == null)
                    advances = new ArrayList<>();

                advances.add(a);
                if (adapter == null) {
                    adapter = new Advance.adapter(getApplicationContext(), amodel.t);
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
    private class getadapterdata extends AsyncTask<String, Void, List<Advance>> {

        @Override
        protected List<Advance> doInBackground(String... notes) {

            return   amodel.Dao.Groupadvances(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Advance> res) {
            if(res.size()>0) {
                advances =res;
                adapter = new Advance.adapter(getApplicationContext(), amodel.t);
                adapter.sett_line(advances);
                recyclerView.setAdapter(adapter);
            }

        }
    }
}
