package com.trimline.pawdep;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Loan_app_list extends AppCompatActivity {
Loan.Model model;
RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loan_app_list);
        model = ViewModelProviders.of(this)
                .get(Loan.Model.class);

        getSupportActionBar().setTitle("Loan Application");
        final   Loan.adapter adapter = new Loan.adapter(Loan_app_list.this);

        recyclerView = (RecyclerView)findViewById(R.id.loan_list);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        recyclerView.setAdapter(adapter);

        model.getAllloans().observe(this, new Observer<List<Loan>>() {
            @Override
            public void onChanged(@Nullable List<Loan> notes) {
                adapter.sett_line(notes);
            }
        });
        adapter.setOnItemClickListener(new Loan.adapter.OnItemClickListener() {
            @Override
            public void onItemClick(Loan note) {

                Intent intent = new Intent(getApplicationContext(), Loan_app.class);
                intent.putExtra("list", note);
                startActivity(intent);
            }
        });
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.loan_app, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:
                Loan a = new Loan();
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                a.Loan_No  = df.format(c);
                a.Loan_Status =1;
                a.Client_Category = 2;
               // a.Group_Name = model.t.Group_Name;
                Intent loans = new Intent(Loan_app_list.this, Loan_app.class);
                loans.putExtra("list", a);
                loans.putExtra("trans",model.t);
                startActivityForResult(loans, 0);
                return true;
            case R.id.save:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
