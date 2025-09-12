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
import android.widget.AdapterView;
import android.widget.Toast;

import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.pawdep.databinding.Loan_appsImpl;
import com.google.gson.Gson;

import java.lang.reflect.Type;
import java.util.List;

public class Loan_app extends AppCompatActivity {
    Loan_appsImpl loanapp;
    Loan.Model model;
    Loan l;
    Loan_Request.Model lrmodel;
    Loan_products.Model lpmodel;
    Member.Model mmodel;
    Loan_guarantors.Model lgmodel;
RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.loan_app);
        loanapp = DataBindingUtil.setContentView(this, R.layout.loan_app);
        model = ViewModelProviders.of(this)
                .get(Loan.Model.class);
        Intent i = getIntent();
        l = (Loan) i.getSerializableExtra("list");

        if (l != null) {
            loanapp.setLoan(l);
            model.t = (Transaction) i.getSerializableExtra("trans");
        }
        lrmodel = ViewModelProviders.of(this)
                .get(Loan_Request.Model.class);
        lpmodel = ViewModelProviders.of(this)
                .get(Loan_products.Model.class);
        mmodel = ViewModelProviders.of(this)
                .get(Member.Model.class);
        lgmodel = ViewModelProviders.of(this)
                .get(Loan_guarantors.Model.class);

        recyclerView = (RecyclerView) findViewById(R.id.guarantorslist);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);


        Pawdep.bind(loanapp.ClientCategoryText, Loan.Client_Categorys.class, this.getApplicationContext(), true);
        lgmodel.repository.bind(recyclerView, l);
        lrmodel.repository.bindautocomplete(loanapp.RequestNo, "");
        mmodel.repository.members(loanapp.MemberNoText, "");// model.t.Group_Name);
        lpmodel.repository.bindlist(loanapp.LoantypeText, true);
        loanapp.MemberNoText.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Member m = (Member) parent.getItemAtPosition(position);
                if (m != null) {
                    loanapp.MemberNameText.setText(m.Name);
                    lrmodel.repository.bindautocomplete(loanapp.RequestNo, m.No);
                    loanapp.RequestNo.showDropDown();
                }
            }
        });

        loanapp.RequestNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Loan_Request loan = (Loan_Request) parent.getItemAtPosition(position);
                if (loan != null) {
                    l.setLoan_Type(loan.Loan_Type);
                    l.setSector(loan.Sector);
                    l.setSub_Sector(loan.Sub_Sector);
                    l.setAmount_Applied(loan.Amount_Applied);
                    l.setMember_No(loan.Member_Code);
                    l.setMember_Name(loan.Member_Name);

                    lgmodel.repository.bind(recyclerView, l);
                }
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.loan, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
               case R.id.save:
                   Loan l= loanapp.getLoan();
                model.repository.insert(l);
                new postloanapp(l).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class postloanapp extends AsyncTask<Void, Void, Loan> {
Loan ll ;
        private postloanapp(Loan l){
            this.ll= l;
        }
        @Override
        protected Loan doInBackground(Void... notes) {

            Loan n = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String data = g.toJson(ll);
                String result = JsonParser.postjson("loanadd", "data", data);
                Type localType = new TypeToken<Loan>() {
                }.getType();
                n = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return n;
        }

        @Override
        protected void onPostExecute(Loan res) {
            if (res != null) {
                if (res.Key.equals("")) {
                    Toast.makeText(Loan_app.this, "Failed to post transaction, please try again", Toast.LENGTH_SHORT).show();


                } else {
                    res.Sent = true;
                    model.update(res);

                }


            }
            else
                Toast.makeText(Loan_app.this, "Failed to post transaction, please try again", Toast.LENGTH_SHORT).show();
        }
    }
}
