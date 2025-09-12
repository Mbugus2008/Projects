package com.trimline.investments;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class mini extends AppCompatActivity {
RecyclerView mRecyclerView;
Spinner accounts;
ProgressDialog progressDialog;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_mini);
        progressDialog= new ProgressDialog(this );
        progressDialog.setMessage("Please wait");
        accounts    = (Spinner)findViewById(R.id.account);
        List<members.Member_Accounts_Listpart> ma = new ArrayList<>();
        for (members.Member_Accounts_Listpart a: Investments.member.Member_Accounts
        ) {
            if (a.Integration_Account==false)
                ma.add(a);
        }
        ArrayAdapter<members.Member_Accounts_Listpart> m = new ArrayAdapter<members.Member_Accounts_Listpart>(getApplicationContext(),R.layout.simple_spinner,ma);
        accounts.setAdapter(m);


        accounts.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                members.Member_Accounts_Listpart m = (members.Member_Accounts_Listpart)adapterView.getItemAtPosition(i);
                if (m!=null)
                {
                    progressDialog.show();
                    mRecyclerView.setAdapter(null);
                new getdetails(m.No).execute();
            }}

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });


        mRecyclerView = (RecyclerView) findViewById(R.id.mini);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));



    }
    private class getdetails extends AsyncTask<Void, String, List<Account_details>> {
        private String account;
        public getdetails(String s) {
            account = s;
        }
        @Override
        protected List<Account_details> doInBackground(Void... agents) {
            List<Account_details> p = null;
            try {
                String result = JsonParser.postjson("Vendor_Details", "account", account);
                Type localType = new TypeToken<List<Account_details>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<Account_details> p) {
            progressDialog.hide();
            if (p != null) {
                System.out.println(new Gson().toJson(p));
                Adapter mAdapter = new Adapter(p, mini.this);
                mRecyclerView.setAdapter(mAdapter);
            }
            else
                Toast.makeText(mini.this, "Unable to get statement", Toast.LENGTH_SHORT).show();
        }
    }
    public static class Adapter extends RecyclerView.Adapter<Adapter.SharesViewHolder>{
        private List<Account_details> sales;
        Context context;

        public Adapter(List<Account_details> grocderyItemList, Context context) {
            this.sales = grocderyItemList;
            this.context = context;
        }

        @Override
        public SharesViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflate the layout file
            View groceryProductView = LayoutInflater.from(parent.getContext()).inflate(R.layout.mini, parent, false);
            SharesViewHolder gvh = new SharesViewHolder(groceryProductView);
            return gvh;
        }


        @Override
        public void onBindViewHolder(final SharesViewHolder holder, final int position) {
            //holder.imageProductImage.setImageResource(sales.get(position).getProductImage());
            System.out.println(new Gson().toJson(sales.get(position)));
            Date c = sales.get(position).Posting_Date;
//                271019235723
            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyy");
            holder.Postingdate.setText(df.format(c));
            holder.documentno.setText(sales.get(position).Document_No);
           String t =(Account_details.Transaction_Types.values()[sales.get(position).Transaction_Type]).toString();
            holder.ttpe.setText(t.replace("_"," "));
            holder.balance.setText(Html.fromHtml(String.format("%s. <b>%,.2f</b>",(sales.get(position).Credit_Amount>0?"CR":"DR"), Math.abs( sales.get(position).Amount))));

        }

        @Override
        public int getItemCount() {
            return sales.size();
        }

        public class SharesViewHolder extends RecyclerView.ViewHolder {
            TextView Postingdate;
            TextView documentno;
            TextView ttpe;
            TextView balance;


            public SharesViewHolder(View view) {
                super(view);
                Postingdate=view.findViewById(R.id.Postingdate);
                documentno=view.findViewById(R.id.Documentno);
                ttpe=view.findViewById(R.id.ttype);
                balance = view.findViewById(R.id.balance);

            }
        }
    }
}
