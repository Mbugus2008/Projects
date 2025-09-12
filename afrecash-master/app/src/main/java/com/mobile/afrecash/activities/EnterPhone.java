package com.mobile.afrecash.activities;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.hbb20.CountryCodePicker;
import com.mobile.afrecash.R;
import com.mobile.afrecash.datasets.GetMember;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.listeners.PINListener;
import com.mobile.afrecash.network.APIService;
import com.mobile.afrecash.network.Connect;
import com.mobile.afrecash.network.RetrofitClientInstance;
import com.mobile.afrecash.uihelpers.SetPINDialog;
import com.mobile.afrecash.utils.ResponseHandler;

import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class EnterPhone extends AppCompatActivity {

    EditText ePhone;
    ResponseHandler responseHandler;
    Context context;
    ProfileHolder profileHolder;
    String phoneNumber;
    CountryCodePicker cpp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enter_phone);
//        Toolbar toolbar = findViewById(R.id.toolbar);
//        setSupportActionBar(toolbar);

        context = this;
        profileHolder = new ProfileHolder(this);
        responseHandler = new ResponseHandler(this);
        ePhone = findViewById(R.id.phone);
        cpp = findViewById(R.id.cpp);

        cpp.registerCarrierNumberEditText(ePhone);
        ePhone.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                if (s.toString().length() > 8) {
                    if(cpp.isValidFullNumber()){
                        phoneNumber = cpp.getSelectedCountryCode() + s.toString().replace(" ","");
                    }else{
                        phoneNumber = "";
                    }
                } else {
                    phoneNumber = "";
                }
            }
        });

        findViewById(R.id.btnProceed).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (phoneNumber.isEmpty()) {
                    responseHandler.showToast("Enter a valid phone number");
                    return;
                }

                logIn(phoneNumber);

            }
        });

    }

    void logIn(String phone) {

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.login(new GetMember(phone,Connect.getDeviceModelName()));

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
                        new SetPINDialog(context, new PINListener() {
                            @Override
                            public void onPINSet(String PIN) {
                                try {
                                    if (PIN.equals(userString.getString("Password"))) {
                                        profileHolder.setUserLoggedIn(true);
                                        startActivity(new Intent(EnterPhone.this, Home.class));
                                    } else {
                                        responseHandler.showToast("Wrong PIN");
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                    responseHandler.showToast("Wrong PIN");
                                }
                            }

                            @Override
                            public void onPINCancelled() {

                            }
                        }, "Enter Your PIN", false);
                    }

                } catch (Exception e) {
                    startActivity(new Intent(EnterPhone.this, EnterName.class).putExtra("phone", phoneNumber));
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
