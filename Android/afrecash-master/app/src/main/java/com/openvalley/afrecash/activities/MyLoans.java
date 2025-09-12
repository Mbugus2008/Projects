package com.openvalley.afrecash.activities;

import android.content.Context;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.adapters.LoanAdapter;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

import java.util.ArrayList;

public class MyLoans extends AppCompatActivity {

    Context context;
    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView recyclerView;
    ResponseHandler responseHandler;
    ProfileHolder profileHolder;
    LinearLayoutManager linearLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_loans);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        context = this;
        responseHandler = new ResponseHandler(this);
        profileHolder = new ProfileHolder(this);

        recyclerView = findViewById(R.id.activity_recycler_view);
        if (recyclerView.getLayoutManager() == null) {
            linearLayoutManager = new LinearLayoutManager(context);
        }
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        swipeRefreshLayout = findViewById(R.id.swipe_refresh_layout);
        swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                load();
            }
        });

        Utils.boldToolBar(this);

        load();

    }

    void load() {

        ArrayList<Loan> loanHolders = new ArrayList<>();

        loanHolders.add(new Loan());

        recyclerView.setAdapter(new LoanAdapter(context, loanHolders));

    }

}
