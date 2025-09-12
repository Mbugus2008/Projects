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

import com.trimline.pawdep.databinding.Group_Loanissue;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Group_loan_issue extends AppCompatActivity {
    Group_Loan.Model gmodel;
    RecyclerView recyclerView;
    Group_Loanissue g;
    Group_Loan.adapter adapter;
    List<Group_Loan> group_loans;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_group_loan_issue);

        gmodel = ViewModelProviders.of(this)
                .get(Group_Loan.Model.class);
        Intent i = getIntent();
        gmodel.t= (Transaction) i.getSerializableExtra("list");
        g= DataBindingUtil.setContentView(this, R.layout.activity_group_loan_issue);
        getSupportActionBar().setTitle(gmodel.t.Group_Name );
        getSupportActionBar().setSubtitle("Group Loan issue");
        recyclerView = findViewById(R.id.grouploan);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        new getadapterdata().execute(gmodel.t.Transaction_No);
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
        menuInflater.inflate(R.menu.grouploan_menu, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:
                Group_Loan a = new Group_Loan();
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                a.No = Long.valueOf(df.format(c));
                a.Transaction_No = gmodel.t.Transaction_No;
                a.Group_Name = gmodel.t.Group_Name;
                a.Group_Code = gmodel.t.Group_Code;
                a.Branch_Code = gmodel.t.Branch_Code;
                if (group_loans == null)
                    group_loans = new ArrayList<>();

                group_loans.add(a);
                if (adapter == null) {
                    adapter = new Group_Loan.adapter(getApplicationContext(), gmodel.t);
                    adapter.sett_line(group_loans);
                    recyclerView.setAdapter(adapter);
                }
                adapter.notifyItemInserted(group_loans.size() - 1);
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
    private class getadapterdata extends AsyncTask<String, Void, List<Group_Loan>> {

        @Override
        protected List<Group_Loan> doInBackground(String... notes) {

            return   gmodel.Dao.Grouploans(notes[0]);
        }
        @Override
        protected void onPostExecute(List<Group_Loan> res) {
            if(res.size()>0) {
                group_loans =res;
                adapter = new Group_Loan.adapter (getApplicationContext(), gmodel.t);
                adapter.sett_line(group_loans);
                recyclerView.setAdapter(adapter);
            }

        }
    }
}
