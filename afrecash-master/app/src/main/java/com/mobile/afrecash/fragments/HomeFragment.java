package com.mobile.afrecash.fragments;

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

import com.mobile.afrecash.R;
import com.mobile.afrecash.adapters.HomeAdapter;
import com.mobile.afrecash.datasets.GetMember;
import com.mobile.afrecash.datasets.HomeHolder;
import com.mobile.afrecash.datasets.Loan;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.handlers.JSONHandler;
import com.mobile.afrecash.network.APIService;
import com.mobile.afrecash.network.Connect;
import com.mobile.afrecash.network.RetrofitClientInstance;
import com.mobile.afrecash.utils.ResponseHandler;
import com.mobile.afrecash.utils.Utils;

import org.json.JSONObject;

import java.util.ArrayList;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by @GeekNat on 3/30/17.
 */

public class HomeFragment extends Fragment {

    Context context;
    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView recyclerView;
    ResponseHandler responseHandler;
    ProfileHolder profileHolder;
    LinearLayoutManager linearLayoutManager;

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        this.context = context;
        responseHandler = new ResponseHandler(context);
        profileHolder = new ProfileHolder(context);
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
        swipeRefreshLayout.setRefreshing(true);
        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.login(new GetMember(profileHolder.getPhone(),Connect.getDeviceModelName()));
        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                swipeRefreshLayout.setRefreshing(false);
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);
                    final JSONObject userString = jsonObject.getJSONObject("content");

                    JSONHandler jsonHandler = new JSONHandler(context);
                    ArrayList<Loan> loanArrayList = jsonHandler.getLoans(res);
                    Loan loanToRepay = null;

                    double totalOutstandingAmount = 0.0;
                    String dueDate = "";

                    for (Loan loan : loanArrayList) {
                        if (loan.getOutstandingBalance() > 0) {
                            if (loanToRepay == null) {
                                loanToRepay = loan;
                            }
                            totalOutstandingAmount = totalOutstandingAmount + loan.getOutstandingBalance() + loan.getOutstandingInterest();
                            if (dueDate.equals("") && !loan.getDueDate().equals("")) {
                                dueDate = loan.getDueDate();
                            }
                        }
                    }

                    String[] splitDueDate = dueDate.split("T");

                    if (splitDueDate.length > 1) {
                        dueDate = splitDueDate[0];
                    }

                    int eligibleAmount = userString.getInt("Eligibility");
                    profileHolder.setEligibleAmount(eligibleAmount);

                    HomeHolder homeHolder = new HomeHolder();

                    if (totalOutstandingAmount == 0) {
                        homeHolder.setBtnText("Request for a loan");
                        homeHolder.setFooterText("To increase your limit, borrow and pay your loan in time. You can borrow to as much as your loan limit. Tap 'REQUEST FOR A LOAN' to get started.");
                        homeHolder.setHeaderAmount("KShs " + Utils.formatNumber(String.valueOf(eligibleAmount)));
                        homeHolder.setHeaderText(eligibleAmount > 0 ? "You are eligible to borrow." : "You are not eligible to borrow at this time.");
                    } else {
                        homeHolder.setBtnText("Make loan repayment");
                        homeHolder.setFooterText("You have an outstanding loan amount due on " + dueDate + ". Tap 'Make loan repayment' to repay");
                        homeHolder.setHeaderAmount("KShs " + Utils.formatNumber(String.valueOf(totalOutstandingAmount)));
                        homeHolder.setHeaderText("Loan Balance");
                        homeHolder.setLoanHolder(loanToRepay);
                    }

                    recyclerView.setAdapter(new HomeAdapter(context, homeHolder));

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


}
