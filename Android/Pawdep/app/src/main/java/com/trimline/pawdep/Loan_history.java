package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;

import java.util.List;

public class Loan_history extends AppCompatActivity {
    RecyclerView recyclerView;
    Loan.dao dao ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loan_history);
        DB db = DB.getInstance(this);
        dao= db.loandao();

        Intent i = getIntent();
        Member m = (Member) i.getSerializableExtra("member");

        getSupportActionBar().setTitle(String.format("%s - %s(%s)",m.No, m.Name,m.GID ));
        getSupportActionBar().setSubtitle("Loan History");

        recyclerView = (RecyclerView)findViewById(R.id.loanhistory);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        new getadapterdata().execute(m.No);
    }

    private class getadapterdata extends AsyncTask<String, Void, List<Loan>> {
        @Override
        protected List<Loan> doInBackground(String... notes) {
            return dao.memberloans(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Loan> res) {
            if (res.size() > 0) {

             Loan.loanhistory   adapter = new Loan.loanhistory(getApplicationContext());
                adapter.sett_line(res);
                recyclerView.setAdapter(adapter);
            }
        }
    }
}
