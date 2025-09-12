package com.trimline.pawdep;

import androidx.databinding.DataBindingUtil;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.trimline.pawdep.databinding.Summary;

public class Membersummary extends Fragment {
    Summary s ;
    RecyclerView recyclerView;

    Transaction t ;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {

        Bundle bundle = this.getArguments();
        if (bundle != null)
            t = (Transaction) bundle.getSerializable("trans");
        View view = inflater.inflate(R.layout.activity_membersummary, parent, false);
        s = DataBindingUtil.setContentView(getActivity(), R.layout.activity_membersummary);
        return view;
    }
    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        // Setup any handles to view objects here
        // EditText etFoo = (EditText) view.findViewById(R.id.etFoo);



        recyclerView =view. findViewById(R.id.groupmembersummarylist);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setHasFixedSize(true);



//        adapter    = new adapter();
//        System.out.println(new Gson().toJson(t));
//        adapter.sett_line(Arrays.asList(t.members));
//        recyclerView.setAdapter(adapter);
    }


 }