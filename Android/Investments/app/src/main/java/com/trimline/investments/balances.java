package com.trimline.investments;

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
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class balances extends AppCompatActivity {
RecyclerView mRecyclerView ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_balances);
        mRecyclerView = (RecyclerView) findViewById(R.id.shares);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        List<members.Member_Accounts_Listpart> ma = new ArrayList<>();
        for (members.Member_Accounts_Listpart a: Investments.member.Member_Accounts
             ) {
            if (a.Integration_Account==false)
                ma.add(a);
        }
         Adapter mAdapter = new Adapter(ma, this);
        mRecyclerView.setAdapter(mAdapter);


    }
    public static class Adapter extends RecyclerView.Adapter<Adapter.SharesViewHolder>{
        private List<members.Member_Accounts_Listpart> sales;
        Context context;

        public Adapter(List<members.Member_Accounts_Listpart> grocderyItemList, Context context) {
            this.sales = grocderyItemList;
            this.context = context;
        }

        @Override
        public SharesViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflate the layout file
            View groceryProductView = LayoutInflater.from(parent.getContext()).inflate(R.layout.balances, parent, false);
            SharesViewHolder gvh = new SharesViewHolder(groceryProductView);
            return gvh;
        }

        private class buyshares extends AsyncTask<Shares.Share_Floating_Lines, Void, Shares.Share_Floating_Lines> {
            @Override
            protected Shares.Share_Floating_Lines doInBackground(Shares.Share_Floating_Lines... agents) {
                Shares.Share_Floating_Lines p = null;
                try {
                    Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                    String result = JsonParser.postjson("buyshares", "data", g.toJson(agents[0],Shares.Share_Floating_Lines.class));
                    Type localType = new TypeToken<Shares.Share_Floating_Lines>() {
                    }.getType();

                    p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

                } catch (Exception e) {

                    e.printStackTrace();
                }
                return p;
            }
            @Override
            protected void onPostExecute(Shares.Share_Floating_Lines p) {
                if(p!=null)
                    if(!p.Key.equals(""))
                        Toast.makeText(context,"Shares successful",Toast.LENGTH_LONG).show();

            }}
        @Override
        public void onBindViewHolder(final SharesViewHolder holder, final int position) {
            //holder.imageProductImage.setImageResource(sales.get(position).getProductImage());
            System.out.println(new Gson().toJson(sales.get(position)));
            holder.doc.setText(sales.get(position).No);
            holder.type.setText(sales.get(position).Name);
            holder.shares.setText(Html.fromHtml(String.format("KES. <b>%,.2f</b>", sales.get(position).Balance)));
            if (sales.get(position).Share_Capital_Account == true)
                holder.buy.setVisibility(View.VISIBLE);
            else
                holder.buy.setVisibility(View.GONE);

            // holder.size.setText(String.valueOf(sales.get(position).Total_Plots));
            holder.buy.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                   context. startActivity(new Intent(context, float_shares.class));
                }
            });
        }

        @Override
        public int getItemCount() {
            return sales.size();
        }

        public class SharesViewHolder extends RecyclerView.ViewHolder {
            TextView doc;
            TextView type;
            TextView shares;

            Button buy;

            public SharesViewHolder(View view) {
                super(view);
                doc=view.findViewById(R.id.documetno);
                type=view.findViewById(R.id.Accounttype);
                shares = view.findViewById(R.id.balance);
                 buy=(Button)view.findViewById(R.id.buy);
            }
        }
    }
}
