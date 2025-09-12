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
import android.view.View;
import android.widget.ProgressBar;
import android.widget.Toast;


import com.trimline.pawdep.databinding.Tline;

import java.util.List;

public class transline extends AppCompatActivity {
    T_line.Model tmodel;
    RecyclerView recyclerView;
    ProgressBar p;

    //  TlineTotals ttotal;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_transline);

        tmodel = ViewModelProviders.of(this)
                .get(T_line.Model.class);
        Intent i = getIntent();
        Transaction t = (Transaction) i.getSerializableExtra("list");
        Tline b = DataBindingUtil.setContentView(this, R.layout.activity_transline);
        //  ttotal = DataBindingUtil.setContentView(this,R.layout.activity_transline);
        getSupportActionBar().setTitle(t.Group_Name);
        getSupportActionBar().setSubtitle("Transaction Line");
        recyclerView = findViewById(R.id.transline);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        p = (ProgressBar) findViewById(R.id.loaddata);
        new getadapterdata().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, t.Transaction_No);
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
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<String, Void, List<T_line>> {
        @Override
        protected List<T_line> doInBackground(String... notes) {

            return tmodel.Dao.Transctionline(notes[0]);
        }
        @Override
        protected void onPostExecute(List<T_line> res) {
            if (res.size() > 0) {
                final T_line.adapter adapter = new T_line.adapter(transline.this);
                adapter.sett_line(res);
                recyclerView.setAdapter(adapter);
                p.setVisibility(View.GONE);
            } else {
                Toast.makeText(getApplicationContext(), "No Members found", Toast.LENGTH_LONG).show();
                p.setVisibility(View.GONE);
            }
        }
    }
}
