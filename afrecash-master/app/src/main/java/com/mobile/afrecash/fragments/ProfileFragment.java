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

import com.mobile.afrecash.R;
import com.mobile.afrecash.adapters.ProfileAdapter;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.utils.ResponseHandler;

/**
 * Created by @GeekNat on 3/30/17.
 */

public class ProfileFragment extends Fragment {

    Context context;
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
        View view = inflater.inflate(R.layout.fragment_profile_list, container, false);
        recyclerView = view.findViewById(R.id.activity_recycler_view);
        if (recyclerView.getLayoutManager() == null) {
            linearLayoutManager = new LinearLayoutManager(context);
        }
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(new ProfileAdapter(context));
        return view;
    }

    @Override
    public void onResume() {
        super.onResume();
    }


}
