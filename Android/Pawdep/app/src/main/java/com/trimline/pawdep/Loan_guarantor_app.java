package com.trimline.pawdep;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.pawdep.databinding.Loanrequest;

import java.util.ArrayList;
import java.util.List;

public class Loan_guarantor_app extends AppCompatActivity {
    Loan_guarantors.Model amodel;
    RecyclerView recyclerView;
    Member.Model mmodel;
    Loan_guarantors. adapter adapter;
    List<Loan_guarantors> advances;
    Loanrequest b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loan_guarantors_app);
        amodel = ViewModelProviders.of(this)
                .get(Loan_guarantors.Model.class);
        Intent i = getIntent();
        amodel.t= (Loan_Request) i.getSerializableExtra("list");
        b= DataBindingUtil.setContentView(this, R.layout.loan_guarantors_app);
        getSupportActionBar().setTitle(amodel.t.Loan_No );
        getSupportActionBar().setSubtitle("Loan Guarantors");
        recyclerView = findViewById(R.id.loan_guarantors_list);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        new getadapterdata().execute(amodel.t.Request_No);
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
                Loan_guarantors a = new Loan_guarantors();
                a.Loan_No = amodel.t.Request_No;

                if (advances == null)
                    advances = new ArrayList<>();

                advances.add(a);
                if (adapter == null) {
                    adapter = new Loan_guarantors.adapter(getApplicationContext());
                    adapter.setrequest(amodel.t);
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
    private class getadapterdata extends AsyncTask<String, Void, List<Loan_guarantors>> {

        @Override
        protected List<Loan_guarantors> doInBackground(String... notes) {

            return   amodel.Dao.Getloanguarantors(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Loan_guarantors> res) {
            if(res.size()>0) {
                advances =res;
                adapter = new Loan_guarantors.adapter(getApplicationContext());
                adapter.setrequest(amodel.t);
                adapter.sett_line(advances);
                recyclerView.setAdapter(adapter);
            }

        }
    }
}
