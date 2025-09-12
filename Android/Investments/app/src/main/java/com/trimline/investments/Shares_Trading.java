package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class Shares_Trading extends Fragment {
    RecyclerView shares;
    List<Shares> sharesList;
    Button floats;
    RecyclerView mRecyclerView;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.activity_shares__trading, container, false);
        mRecyclerView = (RecyclerView) view.findViewById(R.id.shares);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        floats = (Button) view.findViewById(R.id.floatmyshares);
        floats.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(getContext(), float_shares.class);
                startActivity(i);
            }
        });
        new getshares().execute();
        new sharessetup().execute();
        return view;
    }




    private class getshares extends AsyncTask<Void, Void, List<Shares>> {
        @Override
        protected List<Shares> doInBackground(Void... agents) {
            List<Shares> p = null;
            try {
                String result = JsonParser.postjson("Shares", null, null);
                Type localType = new TypeToken<List<Shares>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<Shares> p) {
            sharesList = p;
            try {
                if (sharesList == null)
                    Toast.makeText(getContext(), "No Shares found", Toast.LENGTH_LONG).show();
                else {
                    Shares.Adapter mAdapter = new Shares.Adapter(p, getContext());
                    mRecyclerView.setAdapter(mAdapter);
                }
            } catch (Exception ex) {
                ex.printStackTrace();

            }
        }
    }
    private class sharessetup extends AsyncTask<Void, Void, List<Share_Setup>> {
        @Override
        protected List<Share_Setup> doInBackground(Void... agents) {
            List<Share_Setup> p = null;
            try {
                String result = JsonParser.postjson("SharesSetup", null, null);
                Type localType = new TypeToken<List<Share_Setup>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<Share_Setup> p) {
            try {
                if (p!=null)
                {
                    Investments.share_setups = new ArrayList<>();
                for (Share_Setup s : p
                ) {
                    if (s.Start_Date.getTime() < System.currentTimeMillis() && s.End_Date.getTime() > System.currentTimeMillis()) {
                      Investments .  share_setups.add(s);
                    }
                }
                if (    Investments . share_setups.size() > 0)
                    floats.setVisibility(View.VISIBLE);
                else
                    floats.setVisibility(View.GONE);
            }}
            catch (Exception ex) {
                ex.printStackTrace();

            }
        }
    }
}
