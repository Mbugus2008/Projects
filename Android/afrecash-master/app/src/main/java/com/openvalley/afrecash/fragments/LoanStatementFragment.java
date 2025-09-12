package com.openvalley.afrecash.fragments;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.adapters.StatementAdapter;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.datasets.StatementHolder;
import com.openvalley.afrecash.utils.ResponseHandler;

import java.util.ArrayList;

/**
 * Created by @GeekNat on 3/30/17.
 */

public class LoanStatementFragment extends Fragment {

    Context context;
    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView recyclerView;
    ResponseHandler responseHandler;
    ProfileHolder profileHolder;
    LinearLayoutManager linearLayoutManager;
    Loan loanHolder;

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        this.context = context;
        responseHandler = new ResponseHandler(context);
        profileHolder = new ProfileHolder(context);
        loanHolder = (Loan) getArguments().getSerializable("loan");
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable final ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home, container, false);
        recyclerView = view.findViewById(R.id.activity_recycler_view);
        if (recyclerView.getLayoutManager() == null) {
            linearLayoutManager = new LinearLayoutManager(context);
        }
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        swipeRefreshLayout = view.findViewById(R.id.swipe_refresh_layout);
        swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                setUpHome();
            }
        });

        return view;
    }

    @Override
    public void onResume() {
        super.onResume();
        setUpHome();
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {

    }

    private void setUpHome() {
        recyclerView.setAdapter(new StatementAdapter(context,new ArrayList<StatementHolder>()));
    }


}
