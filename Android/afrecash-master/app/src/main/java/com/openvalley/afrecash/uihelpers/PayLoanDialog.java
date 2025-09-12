package com.openvalley.afrecash.uihelpers;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.activities.Home;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.Repayment;
import com.openvalley.afrecash.network.APIService;
import com.openvalley.afrecash.network.RetrofitClientInstance;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by @GeekNat on 4/18/17.
 */

public class PayLoanDialog extends Dialog {

    private RecyclerView recyclerView;
    private Context context;
    boolean hasSent = false;
    final ResponseHandler responseHandler;
    Loan loanHolder;

    public PayLoanDialog(Context context, Loan loanHolder) {
        super(context, R.style.AppThemeWhite_Light);
        this.context = context;
        this.loanHolder = loanHolder;
        responseHandler = new ResponseHandler(context);
        show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_make_payment);

        findViewById(R.id.btnCancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dismiss();
            }
        });

        final Spinner sType = findViewById(R.id.method);
        final TextView tDes = findViewById(R.id.des);
        final EditText eAmount = findViewById(R.id.amount);
        final Button btnMakePayment = findViewById(R.id.btnProceed);

        final TextView tInstructAmount = findViewById(R.id.instructAmount);
        final TextView tInstructLoanNo = findViewById(R.id.instructLoanNo);

        tInstructLoanNo.setText("5. Enter your " + loanHolder.getLoanNo() + " as the account number");
        final double balance = loanHolder.getOutstandingBalance() + loanHolder.getOutstandingInterest();

        sType.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String type = adapterView.getItemAtPosition(i).toString();

                if (type.equals("Partial Payment")) {
                    eAmount.setText("");
                    eAmount.setEnabled(true);
                    tInstructAmount.setText("6. Enter your payment amount " + balance);
                } else {
                    eAmount.setText(String.valueOf(balance));
                    eAmount.setEnabled(false);
                    tInstructAmount.setText("6. Enter your payment amount " + balance);
                }
                tDes.setText("");
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });

        eAmount.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                if (s.toString().isEmpty()) {
                    tInstructAmount.setText("6. Enter your payment amount " + balance);
                } else {
                    tInstructAmount.setText("6. Enter your payment amount " + s.toString());
                }
            }
        });

        btnMakePayment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final ProgressDialog progressDialog = new ProgressDialog(context);
                progressDialog.setMessage("Please wait...");
                progressDialog.setCancelable(false);
                progressDialog.show();

                Repayment repayment = new Repayment();
                repayment.setAmountToPay(Double.parseDouble(Utils.getText(eAmount)));
                repayment.setSource(0);
                repayment.setLoan(loanHolder);

                APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);
                Call<ResponseBody> call1 = apiService.payLoan(repayment);

                call1.enqueue(new Callback<ResponseBody>() {
                    @Override
                    public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                        progressDialog.dismiss();
                        try {
                            String res = response.body().string();
                            JSONObject jsonObject = new JSONObject(res);

                            dismiss();

                            if (jsonObject.getInt("Code") < 0) {
                                responseHandler.showDialog("Error", "Your request could not be processed at this time. Please try again later");
                            } else {
                                if (jsonObject.getString("Desc").equals("Successfull")) {
                                    new AlertDialog.Builder(context)
                                            .setTitle("Loan repayment")
                                            .setMessage("Your repayment request has been received and is being processed.")
                                            .setCancelable(false)
                                            .setNegativeButton("OKAY", new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface dialog, int which) {
                                                    dismiss();
                                                    context.startActivity(new Intent(context, Home.class));
                                                }
                                            })
                                            .show();
                                } else {
                                    responseHandler.showDialog("Error", "Your request could not be processed at this time. Please try again later");
                                }
                            }

                            Log.v("Repay loan==> 1", res);
                        } catch (Exception e) {
                            e.printStackTrace();
                            responseHandler.showToast("Request unsuccessful.");
                        }
                    }

                    @Override
                    public void onFailure(Call<ResponseBody> call, Throwable t) {
                        progressDialog.dismiss();
                        responseHandler.showToast("Request unsuccessful. Please try again later");
                    }
                });


            }
        });

    }


}
