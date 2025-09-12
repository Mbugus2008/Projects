package com.openvalley.afrecash.activities;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.hbb20.CountryCodePicker;
import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.GetMember;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.datasets.User;
import com.openvalley.afrecash.listeners.PINListener;
import com.openvalley.afrecash.network.APIService;
import com.openvalley.afrecash.network.Connect;
import com.openvalley.afrecash.network.RetrofitClientInstance;
import com.openvalley.afrecash.uihelpers.ConfirmPINDialog;
import com.openvalley.afrecash.uihelpers.SetPINDialog;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class EnterPhone extends AppCompatActivity {

    EditText ePhone,idno;
    Button reset;
    ResponseHandler responseHandler;
    Context context;
    ProfileHolder profileHolder;
    String phoneNumber = "",Idno = "";
    CountryCodePicker cpp;
    String code ;

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
        idno = findViewById(R.id.id_number);
        cpp = findViewById(R.id.cpp);
        reset = findViewById(R.id.btnreset);

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
        findViewById(R.id.forgotpassword).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (phoneNumber.isEmpty()) {
                    responseHandler.showToast("Enter a valid phone number");
                    return;
                }
                reset.setVisibility(View.VISIBLE);
                idno.setVisibility(View.VISIBLE);
            }
        });
        reset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (idno.getText().toString().isEmpty()){
                    responseHandler.showToast("Enter a valid Id number");
                    return;
                }

                resetpass(phoneNumber);
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

                    if (jsonObject.getInt("Code")==0) {
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
                    }
                    if (jsonObject.getInt("Code")==1)
                    {responseHandler.showToast(jsonObject.getString("Desc")); }
                    if (jsonObject.getInt("Code")==-1)
                    {responseHandler.showToast("Unable to login, please try again later"); }
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
    void resetpass(String phone) {
        code = Utils.getRandomInt().toString();
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);

        Call<ResponseBody> call1 = apiService.resetpass(new GetMember(phone,Connect.getDeviceModelName(),idno.getText().toString(),code));

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);
                    if (jsonObject.getInt("Code") ==0 )
                    {
                    final JSONObject userString = jsonObject.getJSONObject("content");
                    if (jsonObject.getInt("Code") == 0) {



                    if (!userString.getString("Key").equals("")) {
                        profileHolder.setFirstName(userString.getString("Name"));
                        profileHolder.setPhone(userString.getString("Phone_No"));
                        profileHolder.setIDNumber(userString.getString("ID_No"));
                        profileHolder.setAddress(userString.getString("Address"));
                        profileHolder.setRegionName(userString.getString("Region"));
                        profileHolder.setPIN(userString.getString("Password"));
                        profileHolder.setUserId(userString.getString("No"));
                        profileHolder.setPasswordChanged(String.valueOf( userString.getBoolean("Pin_changed")));

changePassword();
                    }
                    }
                    }
                    if (jsonObject.getInt("Code") > 0) {
                        responseHandler.showDialog("Error", jsonObject.getString("Desc"));
                    }

                    if (jsonObject.getInt("Code") < 0) {
                        responseHandler.showDialog("Error", "Could not send verification at this time");
                    }

                } catch (Exception e) {
                    responseHandler.showToast("Unable to change your password");
                    //startActivity(new Intent(EnterPhone.this, EnterName.class).putExtra("phone", phoneNumber));
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
    private void changePassword() {
        new ConfirmPINDialog(this, new PINListener() {
            @Override
            public void onPINSet(String PIN) {
                if (PIN.equals(profileHolder.getPIN())) {
                    inititateChangePassword();
                } else {
                    responseHandler.showToast("Try again");
                }
            }
            @Override
            public void onPINCancelled() {

            }
        });
    }

    private void inititateChangePassword() {
        new SetPINDialog(this, new PINListener() {
            @Override
            public void onPINSet(String PIN) {
                changePassword(PIN);
            }

            @Override
            public void onPINCancelled() {

            }
        }, "Set Your PIN", true);
    }

    void changePassword(String pin) {
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        User user = new User();
        user.setIDNo(profileHolder.getIDNumber());
        user.setName(profileHolder.getFirstName());
        user.setPassword(pin);
        user.setRegion(profileHolder.getRegionName());
        user.setPhoneNo(profileHolder.getPhone());
        user.setDeviceID(Connect.getDeviceModelName());

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);


        Call<ResponseBody> call1 = apiService.changePassword(user);

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
                        profileHolder.logOutSilently();
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
}
