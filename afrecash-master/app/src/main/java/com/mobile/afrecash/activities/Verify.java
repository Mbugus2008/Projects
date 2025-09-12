package com.mobile.afrecash.activities;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.mobile.afrecash.R;
import com.mobile.afrecash.datasets.GetMember;
import com.mobile.afrecash.datasets.OTP;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.datasets.User;
import com.mobile.afrecash.network.APIService;
import com.mobile.afrecash.network.Connect;
import com.mobile.afrecash.network.RetrofitClientInstance;
import com.mobile.afrecash.utils.ResponseHandler;
import com.mobile.afrecash.utils.Utils;

import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class Verify extends AppCompatActivity {

    Button btnLogin;
    ResponseHandler responseHandler;
    EditText eInput;
    ProfileHolder profileHolder;
    String code;
    User user;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verify);

        user = (User) getIntent().getSerializableExtra("user");
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
                    register();
                } else {
                    responseHandler.showToast("Invalid code");
                }

            }

        });

        sendVerificationCode();
    }

    @Override
    public void onBackPressed() {
        startActivity(new Intent(this, EnterPhone.class));
    }

    void sendVerificationCode() {
        String message = "Welcome " + user.getName() + ", Your registration otp is " + code;

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Sending code...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.sendOTP(new OTP(user.getPhoneNo(), message));

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();
                    Log.v("VERIFY", res);

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

    void register() {
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);


        Call<ResponseBody> call1 = apiService.register(user);

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);

                    if (jsonObject.getInt("Code") < 0) {
                        responseHandler.showDialog("Error", "We encountered an error. Please try again later");
                    }

                    if (jsonObject.getInt("Code") > 0) {
                        responseHandler.showDialog("Error", jsonObject.getString("Desc"));
                    }

                    if (jsonObject.getInt("Code") == 0) {
                        final JSONObject userString = jsonObject.getJSONObject("content");

                        Log.v("Registration==> 1", res);
                        Log.v("Registration==> 2", userString.getString("Key"));
                        if (!userString.getString("Key").equals("")) {
                            logIn(user.getPhoneNo());
                        } else {
                            responseHandler.showToast("Registration unsuccessful");
                        }
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                    responseHandler.showToast("Registration unsuccessful");
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                progressDialog.dismiss();
                responseHandler.showToast("Registration unsuccessful");
            }
        });

    }

    void logIn(String phone) {

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Logging you in...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.login(new GetMember(phone, Connect.getDeviceModelName()));

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);
                    final JSONObject userString = jsonObject.getJSONObject("content");

                    Log.v("Registration==> 1", res);
                    Log.v("Registration==> 2", userString.getString("Key"));
                    if (!userString.getString("Key").equals("")) {
                        profileHolder.setFirstName(userString.getString("Name"));
                        profileHolder.setPhone(userString.getString("Phone_No"));
                        profileHolder.setIDNumber(userString.getString("ID_No"));
                        profileHolder.setAddress(userString.getString("Address"));
                        profileHolder.setRegionName(userString.getString("Region"));
                        profileHolder.setPIN(userString.getString("Password"));
                        profileHolder.setUserId(userString.getString("No"));
                        profileHolder.setUserLoggedIn(true);
                        startActivity(new Intent(Verify.this, Home.class));
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

}

