package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Fundedit;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


public class addeditfund extends AppCompatActivity {
    Fundedit fund;
    RealEstate.Model model;
    ProgressDialog progressDialog ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent i = getIntent();
        RealEstate t = (RealEstate) i.getSerializableExtra("list");
Log.i("list",new Gson().toJson(t));
        fund = DataBindingUtil.setContentView(this, R.layout.addeditfund);
        fund.setFund(t);
        progressDialog= new ProgressDialog(this );
        progressDialog.setMessage("Saving");

        model = ViewModelProviders.of(this)
                .get(RealEstate.Model.class);
        new getfdtypes().execute();
        fund.maturityaction.setAdapter(new ArrayAdapter<RealEstate.Maturity_Actions>(this, android.R.layout.simple_spinner_item, RealEstate.Maturity_Actions.values()));

        fund.fdtype.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                FDTyes fd = (FDTyes) adapterView.getItemAtPosition(i);
                if (fd != null && fund.getFund()!=null)
                    fund.getFund().FD_Type = fd.FD_Type;
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        fund.maturityaction.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                RealEstate.Maturity_Actions ma = RealEstate.Maturity_Actions.values()[i];
                RealEstate r = fund.getFund();
                if (ma != null && r!=null) {
                    r.Maturity_Action = i;
                }
                fund.setFund(r);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        fund.Save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                RealEstate r = fund.getFund();
                Log.i("Save fund", new Gson().toJson(r));
                progressDialog.show();
new savefund().execute(r);

            }
        });
    }

    private class savefund extends AsyncTask<RealEstate, Void, RealEstate> {
        @Override
        protected RealEstate doInBackground(RealEstate... agents) {
            RealEstate p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("newfund", "data", new Gson().toJson(agents[0]));
                Type localType = new TypeToken<RealEstate>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(RealEstate p) {
            progressDialog.dismiss();
            if (p == null)
                Toast.makeText(addeditfund.this, "We could not save you application please try again Later", Toast.LENGTH_SHORT).show();
            else {
                Toast.makeText(addeditfund.this, "Application Saved", Toast.LENGTH_SHORT).show();
            finish();
                // startActivity(new Intent(addeditfund.this,Home.class));
            }

        }
    }
    private class getfdtypes extends AsyncTask<Void, Void, List<FDTyes>> {
        @Override
        protected List<FDTyes> doInBackground(Void... agents) {
            List<FDTyes> p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("Fdtypes", null, null);
                Type localType = new TypeToken<List<FDTyes>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<FDTyes> p) {
            if (p != null) {

                fund.fdtype.setAdapter(new ArrayAdapter<>(addeditfund.this,R.layout.simple_spinner,p));
            }
        }
    }
}
