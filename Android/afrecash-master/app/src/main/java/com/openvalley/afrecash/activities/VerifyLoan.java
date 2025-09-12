package com.openvalley.afrecash.activities;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.OTP;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.network.APIService;
import com.openvalley.afrecash.network.RetrofitClientInstance;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class VerifyLoan extends AppCompatActivity {

    Button btnLogin;
    ResponseHandler responseHandler;
    EditText eInput;
    ProfileHolder profileHolder;
    String code;
    Loan loan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verify);

        loan = (Loan) getIntent().getSerializableExtra("loan");
        code = Utils.getRandomInt().toString();

        profileHolder = new ProfileHolder(this);

        responseHandler = new ResponseHandler(this);

        eInput = findViewById(R.id.code);

        btnLogin = findViewById(R.id.btnProceed);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (Utils.isEmpty(eInput)) {
                    responseHandler.showToast("Enter verification code");
                    return;
                }

                if (Utils.getText(eInput).equals(code)) {
                    requestLoan();
                } else {
                    responseHandler.showToast("Invalid code");
                }

            }

        });

        sendVerificationCode();
    }

    void sendVerificationCode() {
        String message = "Dear " + profileHolder.getFirstName() + ", Your loan application otp is " + code;

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Sending code...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.sendOTP(new OTP(profileHolder.getPhone(), message));

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);

                    if (jsonObject.getInt("Code") == 0) {
                        responseHandler.showToast("Sent");
                    }

                    if (jsonObject.getInt("Code") > 0) {
                        responseHandler.showDialog("Error", jsonObject.getString("Desc"));
                    }

                    if (jsonObject.getInt("Code") < 0) {
                        responseHandler.showDialog("Error", "Could not send verification at this time");
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                progressDialog.dismiss();
                responseHandler.showToast("Login unsuccessful");
            }
        });
    }

    @Override
    public void onBackPressed() {
        startActivity(new Intent(this, RequestLoan.class));
    }

    void requestLoan() {
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);
        Call<ResponseBody> call1 = apiService.requestLoan(loan);

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();
                    JSONObject jsonObject = new JSONObject(res);
                    Log.v("Request loan==> 1", res);

                    if (jsonObject.getInt("Code") < 0) {
                        responseHandler.showDialog("Error", "We encountered an error. Please try again later");
                        return;
                    }

                    if (jsonObject.getInt("Code") > 0) {
                        responseHandler.showDialog("Error", jsonObject.getString("Desc"));
                        return;
                    }

                    if (jsonObject.getInt("Code") == 0) {
                        if (jsonObject.getString("Desc").equals("Successfull")) {
                            new AlertDialog.Builder(VerifyLoan.this)
                                    .setTitle("Loan applied")
                                    .setMessage("Your loan application has been received and is being processed. You will be notified once the loan is approved.")
                                    .setCancelable(false)
                                    .setNegativeButton("OKAY", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.dismiss();
                                            startActivity(new Intent(VerifyLoan.this, Home.class));
                                        }
                                    })
                                    .show();
                        } else {
                            responseHandler.showDialog("Error", "Your loan application could not be processed at this time. Please try again later");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    responseHandler.showDialog("Error", "Your loan application could not be processed at this time. Please try again later");
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                progressDialog.dismiss();
                responseHandler.showToast("Request unsuccessful. Please try again later");
            }
        });

    }

}

