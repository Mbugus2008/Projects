package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Trans;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class transfer extends AppCompatActivity {
    Trans trans;
    ProgressDialog wait;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.transfer);

        trans = DataBindingUtil.setContentView(this, R.layout.transfer);
      String  p = getIntent().getStringExtra("depositto");

        wait = new ProgressDialog(this);
        trans.Ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("res", new Gson().toJson(trans.getD()));
            }
        });
        Transactions.SpinAdapter adapter = new Transactions.SpinAdapter(com.trimline.investments.transfer.this, android.R.layout.simple_spinner_item, new ArrayList<>(Arrays.asList(Investments.member.getMember_Deposits_Accounts())));
        trans.fromtxt.setAdapter(adapter);

//to
        Transactions.DeposittoAdapter adapterto = new Transactions.DeposittoAdapter(com.trimline.investments.transfer.this, android.R.layout.simple_spinner_item, new ArrayList<>(Arrays.asList(Investments.member.getDeposits_Accounts())));
        trans.totxt.setAdapter(adapterto);
        final Transactions t = new Transactions();
        t.Member_No = Investments.member.No;
        t.Reference = t.Member_No + System.currentTimeMillis();
        t.Document_No = t.Reference;
        t.Transaction_Type = 0;
        t.Telephone_Number = Investments.member.Phone_No;
if (p!=null)
        if( !p.equals(""))
            t.Account_2 = p;
        trans.setD(t);

        //from


        trans.Ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Transactions t = trans.getD();
                Log.i("update", new Gson().toJson(t));
                if (t.Account_No.equals("")) {
                    Toast.makeText(com.trimline.investments.transfer.this, "Please select From account", Toast.LENGTH_LONG).show();
                    trans.fromtxt.performClick();
                    return;
                }
                if (t.Account_2.equals("")) {
                    Toast.makeText(com.trimline.investments.transfer.this, "Please select To account", Toast.LENGTH_LONG).show();
                    trans.totxt.performClick();
                    return;
                }

                if (t.Amount == 0) {
                    if (Double.valueOf(trans.amounttxt.getText().toString()) == 0) {
                        Toast.makeText(com.trimline.investments.transfer.this, "Please Enter Amount to Transfer/Deposit", Toast.LENGTH_LONG).show();
                        trans.amount.requestFocus();
                        return;
                    }
                    t.Amount = Double.valueOf(trans.amounttxt.getText().toString());
                }

                if (!t.Account_No.toLowerCase().equals("mpesa"))
                    if (t.Amount > t.AccountNo.Balance) {
                        Toast.makeText(transfer.this, "Amount entered exceed Source account balance.", Toast.LENGTH_LONG).show();
                        trans.amount.requestFocus();
                        return;
                    }


                wait.setMessage("Transfer/Deposit...please wait");
                    wait.show();
                new transfersync().execute(t);


            }
        });

    }
    private class transfersync extends AsyncTask<Transactions, Void, Transactions> {
        @Override
        protected Transactions doInBackground(Transactions... agents) {
            Transactions p = null;
            try {
                System.out.println(new Gson().toJson(agents[0]));
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("transaction", "data", g.toJson(agents[0]));
                Type localType = new TypeToken<Transactions>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(Transactions p) {
            wait.hide();
            if (p != null) {
                if (p.Status== 2)
                    Toast.makeText(transfer.this, "Transaction Failed: "+ p.Comments, Toast.LENGTH_LONG).show();
                else{
                    Toast.makeText(transfer.this, "Transaction success, this will be processed shortly" ,Toast.LENGTH_LONG).show();
                finish();
               }}
            else
            {

                Toast.makeText(com.trimline.investments.transfer.this, "Transaction Failed, Please try again Later", Toast.LENGTH_LONG).show();

            }
        }
    }
}