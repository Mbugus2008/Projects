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
import com.trimline.pawdep.databinding.Pwtrans;


import java.util.ArrayList;
import java.util.List;

public class PW_Trans extends AppCompatActivity {
    PW_Transactions.Model amodel;
    RecyclerView recyclerView;
    Member.Model mmodel;
    PW_Transactions.adapter adapter;
    List<PW_Transactions> advances;
    Pwtrans b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pw__trans);

        amodel = ViewModelProviders.of(this)
                .get(PW_Transactions.Model.class);
        Intent i = getIntent();
        amodel.t = (Transaction) i.getSerializableExtra("list");
        b = DataBindingUtil.setContentView(this, R.layout.activity_pw__trans);
        getSupportActionBar().setTitle(amodel.t.Group_Name );
        getSupportActionBar().setSubtitle("Other Transactions");
        recyclerView = findViewById(R.id.pwtrans);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        new getadapterdata().execute(amodel.t.Transaction_No);
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
                PW_Transactions a = new PW_Transactions();
                a.No = Pawdep.Uid();
                a.Transaction_No = amodel.t.Transaction_No;

                a.Group_Code = amodel.t.Group_Code;
                a.Branch_Code = amodel.t.Branch_Code;

                if (advances == null)
                    advances = new ArrayList<>();
                advances.add(a);


                if (adapter == null) {
                    adapter = new PW_Transactions.adapter(getApplicationContext(), amodel.t);
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
    private class getadapterdata extends AsyncTask<String, Void, List<PW_Transactions>> {
        @Override
        protected List<PW_Transactions> doInBackground(String... notes) {
            return   amodel.Dao.getgrouptransaction(notes[0]);
        }
        @Override
        protected void onPostExecute(List<PW_Transactions> res) {
            if(res.size()>0) {
                advances =res;
                adapter = new PW_Transactions.adapter(getApplicationContext(), amodel.t);
                adapter.sett_line(advances);
                recyclerView.setAdapter(adapter);
            }
        }
    }


}
