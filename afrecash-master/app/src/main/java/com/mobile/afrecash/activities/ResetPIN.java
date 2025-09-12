package com.mobile.afrecash.activities;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;
import androidx.appcompat.widget.Toolbar;

import com.mobile.afrecash.R;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.handlers.JSONHandler;
import com.mobile.afrecash.listeners.ConnectionListener;
import com.mobile.afrecash.listeners.PINListener;
import com.mobile.afrecash.network.Connect;
import com.mobile.afrecash.uihelpers.SetPINDialog;
import com.mobile.afrecash.utils.ResponseHandler;
import com.mobile.afrecash.utils.Utils;

import java.util.HashMap;
import java.util.Map;


public class ResetPIN extends AppCompatActivity {

    AppCompatButton btnLogin;
    ResponseHandler responseHandler;
    EditText eInput;
    ProfileHolder profileHolder;
    Context context;
    String pin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reset);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportActionBar().setTitle("Enter reset code");
        context = this;
        profileHolder = new ProfileHolder(this);

        responseHandler = new ResponseHandler(this);

        eInput = findViewById(R.id.code);

        btnLogin = findViewById(R.id.btnProceed);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (Utils.isEmpty(eInput)) {
                    responseHandler.showToast("Enter reset code");
                    return;
                }

                logIn(Utils.getText(eInput));
            }

        });

    }

    void logIn(String code) {
        Map<String, String> map = new HashMap<>();
        map.put("code", code);
        map.put("phone", profileHolder.getPhone());


        Connect.makeRequest(this, Connect.VERIFY_PIN, map, new ConnectionListener() {

            ProgressDialog progressDialog = new ProgressDialog(ResetPIN.this, ProgressDialog.THEME_DEVICE_DEFAULT_LIGHT);

            @Override
            public void onStart() {
                progressDialog.setMessage("Verifying...");
                progressDialog.setCancelable(false);
                progressDialog.show();
            }

            @Override
            public void onComplete() {
                progressDialog.dismiss();
            }

            @Override
            public void onSuccess(String result) {
                JSONHandler jsonHandler = new JSONHandler(ResetPIN.this);

                if (jsonHandler.isSuccess(result)) {
                    //ALLOW USER TO SET NEW PIN
                    new SetPINDialog(context, new PINListener() {
                        @Override
                        public void onPINSet(String PIN) {
                            pin = PIN;

                            changePIN();

                        }

                        @Override
                        public void onPINCancelled() {

                        }
                    }, "Set Your PIN", true);
                }

            }

            @Override
            public void onError(String error) {
                responseHandler.showToast(error);
            }
        });
    }


    @Override
    public void onBackPressed() {
        super.onBackPressed();
        startActivity(new Intent(this, EnterPhone.class));
    }


    void changePIN() {

        Map<String, String> map = new HashMap<>();
        map.put("pin", pin);


        Connect.makeRequest(this, Connect.CHANGE_PIN, map, new ConnectionListener() {

            ProgressDialog progressDialog = new ProgressDialog(context, ProgressDialog.THEME_DEVICE_DEFAULT_LIGHT);

            @Override
            public void onStart() {
                progressDialog.setMessage("Resetting your PIN...");
                progressDialog.setCancelable(false);
                progressDialog.show();
            }

            @Override
            public void onComplete() {
                progressDialog.dismiss();
            }

            @Override
            public void onSuccess(String result) {
                JSONHandler jsonHandler = new JSONHandler(context);
                jsonHandler.login(result, false);
            }

            @Override
            public void onError(String error) {
                responseHandler.showToast(error);
            }

        });
    }
}

