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
import android.widget.Toast;


import com.trimline.pawdep.databinding.Advanceitems;

import java.util.List;

public class Advance_Repayment extends AppCompatActivity {
    Repayment.Model amodel;
    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_advances_repayment);

        amodel = ViewModelProviders.of(this)
                .get(Repayment.Model.class);
        Advanceitems b = DataBindingUtil.setContentView(this, R.layout.activity_advances_repayment);

        getSupportActionBar().setSubtitle("Advance Repayment");

        recyclerView = findViewById(R.id.loanrepay);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        Intent i = getIntent();
        Transaction t = (Transaction) i.getSerializableExtra("list");
        T_line tl = null;
        if (t == null) {
            tl = (T_line) i.getSerializableExtra("line");
            getSupportActionBar().setTitle(tl.Member_Name);
            new getadapterdata(tl.PAWDEP_No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, tl.Transaction_No);
        } else {
            getSupportActionBar().setTitle(t.Group_Name);
            new getadapterdata("").executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, t.Transaction_No);
        }


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.itemline, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.save:
                recyclerView.requestFocus();
                finish();
                return true;

            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private class getadapterdata extends AsyncTask<String, Void, List<Repayment>> {
        String Member = "";

        public getadapterdata(String Member) {
            this.Member = Member;

        }

        @Override
        protected List<Repayment> doInBackground(String... notes) {
            Log.i("agent no", notes[0]);
            if (Member.equals(""))
            return amodel.Dao.GroupLoans(notes[0]);
            else
                return  amodel.Dao.GroupLoans(notes[0],Member);
        }

        @Override
        protected void onPostExecute(List<Repayment> res) {
            if (res.size() > 0) {
                final Repayment.adapter adapter = new Repayment.adapter();
                adapter.sett_line(res);
                recyclerView.setAdapter(adapter);
            } else
                Toast.makeText(getApplicationContext(), "No loans found", Toast.LENGTH_LONG).show();
        }
    }
}
