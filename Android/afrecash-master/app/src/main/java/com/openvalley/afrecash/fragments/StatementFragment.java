package com.openvalley.afrecash.fragments;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.adapters.LoanAdapter;
import com.openvalley.afrecash.datasets.GetMember;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.handlers.JSONHandler;
import com.openvalley.afrecash.network.APIService;
import com.openvalley.afrecash.network.Connect;
import com.openvalley.afrecash.network.RetrofitClientInstance;
import com.openvalley.afrecash.utils.ResponseHandler;

import java.util.ArrayList;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by @GeekNat on 3/30/17.
 */

public class StatementFragment extends Fragment {

    Context context;
    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView recyclerView;
    ResponseHandler responseHandler;
    ProfileHolder profileHolder;
    LinearLayoutManager linearLayoutManager;
    ArrayList<Loan> originalList, currentList;
    Spinner sStatuses;
    String status = "-1";

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        this.context = context;
        responseHandler = new ResponseHandler(context);
        profileHolder = new ProfileHolder(context);
        originalList = new ArrayList<>();
        currentList = new ArrayList<>();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable final ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_loans, container, false);
        recyclerView = view.findViewById(R.id.activity_recycler_view);
        sStatuses = view.findViewById(R.id.sStatus);
        if (recyclerView.getLayoutManager() == null) {
            linearLayoutManager = new LinearLayoutManager(context);
        }
        sStatuses.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                status = parent.getItemAtPosition(position).toString();
                setData();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
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
        swipeRefreshLayout.setRefreshing(true);
        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.login(new GetMember(profileHolder.getPhone(),Connect.getDeviceModelName()));
        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                swipeRefreshLayout.setRefreshing(false);
                try {
                    String res = response.body().string();
                    Log.v("Loans",res);
                    JSONHandler jsonHandler = new JSONHandler(context);
                    originalList = jsonHandler.getLoans(res);
                    setData();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                swipeRefreshLayout.setRefreshing(false);
            }
        });
    }

    private void setData() {

        currentList = new ArrayList<>();
        Log.v("Loans",status);

        if (status.equals("Any Status")) {
            currentList = originalList;
        }

        if (status.equals("Application")) {
            for (Loan l : originalList) {
                if (l.getStatus() == 0) currentList.add(l);
            }
        }

        if (status.equals("Appraisal")) {
            for (Loan l : originalList) {
                if (l.getStatus() == 1) currentList.add(l);
            }
        }

        if (status.equals("Rejected")) {
            for (Loan l : originalList) {
                if (l.getStatus() == 2) currentList.add(l);
            }
        }

        if (status.equals("Approved")) {
            for (Loan l : originalList) {
                if (l.getStatus() == 3) currentList.add(l);
            }
        }

        if (status.equals("Issued")) {
            for (Loan l : originalList) {
                if (l.getStatus() == 4) currentList.add(l);
            }
        }

        recyclerView.setAdapter(new LoanAdapter(context, currentList));
    }

}
