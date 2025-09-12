package com.openvalley.afrecash.activities;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.listeners.PINListener;
import com.openvalley.afrecash.uihelpers.ConfirmPINDialog;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RequestLoan extends AppCompatActivity {

    ResponseHandler responseHandler;
    EditText eAmount, eInterest, ePrincipal, eMonthPay, eFullPay;
    ProfileHolder profileHolder;
    Context context;
    Button btnRequest;
    boolean requestMade = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_loan);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("");

        context = this;
        profileHolder = new ProfileHolder(this);
        responseHandler = new ResponseHandler(this);

        eAmount = findViewById(R.id.amount);
        eInterest = findViewById(R.id.monthly_interest);
        ePrincipal = findViewById(R.id.monthly_principal);
        eMonthPay = findViewById(R.id.total_monthly_pay);
        eFullPay = findViewById(R.id.total_repay);
        btnRequest = findViewById(R.id.btnProceed);


        btnRequest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                try {
                    if (Utils.isEmpty(eAmount)) {
                        responseHandler.showToast("Please enter the amount you wish to request");
                        return;
                    }
                    if (Integer.parseInt(Utils.getText(eAmount)) < 1) {
                        responseHandler.showToast("Invalid amount");
                        return;
                    }

                    new ConfirmPINDialog(context, new PINListener() {
                        @Override
                        public void onPINSet(String PIN) {
                            if (!requestMade) {
                                if (PIN.equals(profileHolder.getPIN())) {
                                    requestLoan();
                                } else {
                                    responseHandler.showToast("Try again");
                                }
                            }
                        }

                        @Override
                        public void onPINCancelled() {

                        }
                    });
                } catch (Exception e) {
                    responseHandler.showToast("Invalid amount");
                }

            }
        });

    }


    void requestLoan() {
        final ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        //sdf.setTimeZone(TimeZone.getTimeZone("CET"));
        String dateText = sdf.format(date);

        Loan loan = new Loan();
        loan.setRequestedAmount(Double.parseDouble(Utils.getText(eAmount)));
        loan.setLoanType("L01");
        loan.setClientCode(profileHolder.getUserId());
        loan.setApplicationDate(dateText);

        startActivity(new Intent(this, VerifyLoan.class).putExtra("loan", loan));

    }

    @Override
    public void onBackPressed() {
        startActivity(new Intent(this, Home.class));
    }


}
