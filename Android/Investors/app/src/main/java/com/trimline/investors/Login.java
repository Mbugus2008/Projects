package com.trimline.investors;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Member;
import java.lang.reflect.Type;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;
import static android.Manifest.permission.READ_PHONE_STATE;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

public class Login extends AppCompatActivity {
    public static Members member;
    EditText email, pass;
    Button signin,forgotpass;
    SharedPreferences preferences;
    TextView deviceid;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //SqlScoutServer.create(this, getPackageName());
        getSupportActionBar().hide();

        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        email = (EditText) findViewById(R.id.email);
        pass = (EditText) findViewById(R.id.password);

        signin = (Button) findViewById(R.id.signin);
        forgotpass = (Button) findViewById(R.id.forgotpass);



        String value = preferences.getString("User", "");
        if (value != null || value != "") {
            email.setText(value);
            email.setSelectAllOnFocus(true);
        }
        //email.setText("00301");
        //
        // pass.setText("12345");
        if (!checkPermission(READ_PHONE_STATE))
            requestPermissionAndContinue(READ_PHONE_STATE);
        if (!checkPermission(WRITE_EXTERNAL_STORAGE))
            requestPermissionAndContinue(WRITE_EXTERNAL_STORAGE);
        if (!checkPermission(READ_EXTERNAL_STORAGE))
            requestPermissionAndContinue(READ_EXTERNAL_STORAGE);


        signin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (email.getText().toString().equals("")) {
                    email.setError("Account Required");
                    email.requestFocus();
                    return;
                }
                if (pass.getText().toString().equals("")) {
                    pass.setError("Password Required");
                    pass.requestFocus();
                    return;
                }

                new getmember(email.getText().toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            }
        });
        forgotpass.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (email.getText().toString().equals("")) {
                    email.setError("Account Required");
                    email.requestFocus();
                    return;
                }


                new forgotpass(email.getText().toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            }
        });

    }

    private class getmember extends AsyncTask<Void, Members, Results> {
        String aa;
        public getmember(String a) {
            this.aa = a;
        }
        @Override
        protected Results doInBackground(Void... params) {
            // publishProgress("Getting Credits");
            Results results = null;
            String result = null;
            try {
                Gson g = new Gson();
                result = JsonParser.postjson("Querymember", "No", aa);
                Type localType = new TypeToken<Results>() {}.getType();

                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(Results res) {
            try {
              if (res.Code==0)
              {
                  //Type localType = new TypeToken<Members>() {}.getType();
                  member =(Members)res.content;
                    //member = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(res.content.toString(),new TypeToken<Members>(){}.getType());
                  if (member.Password_Changed == false){
                      if (!res.Desc.equals(""))
                          Toast.makeText(Login.this, res.Desc, Toast.LENGTH_SHORT).show();
                      ConfirmationBox(member);

                  }
                  else{
                      if(member.Password.equals(pass.getText().toString()))
                      {
                          SharedPreferences.Editor editor = preferences.edit();
                          editor.putString("User", member.No);
                          editor.commit();
                          startActivity(new Intent(Login.this,MainActivity.class));

                      }
                      else{
                          Toast.makeText(Login.this, "Invalid Password", Toast.LENGTH_SHORT).show();
                          pass.setError("Invalid Password");
                          pass.requestFocus();
                      }

              }}
              if (res.Code == -1)
                  Toast.makeText(Login.this, res.Desc, Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public void ConfirmationBox(Members t) {
        LayoutInflater li = LayoutInflater.from(Login.this);
        View promptsView = li.inflate(R.layout.activity_changepass, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Login.this);
        alertDialogBuilder.setView(promptsView);

        final TextView old = (TextView) promptsView.findViewById(R.id.oldpass);
        final TextView newpass = (TextView) promptsView.findViewById(R.id.newpass);
        final TextView confirm = (TextView) promptsView.findViewById(R.id.password);


        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setTitle("Change Password")
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                });
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (old.getText().toString().equals("")) {
                    old.setError("Old Password required");
                    old.requestFocus();
                    return;
                }

                if (newpass.getText().toString().equals("")) {
                    newpass.setError("New Password required");
                    newpass.requestFocus();
                    return;
                }
                if (confirm.getText().toString().equals("")) {
                    confirm.setError("confirm Password required");
                    confirm.requestFocus();
                    return;
                }

                if (!old.getText().toString().equals(t.Password)) {
                    old.setError("Invalid old Password");
                    old.requestFocus();
                    return;
                }
                if (!newpass.getText().toString().equals(confirm.getText().toString())) {
                    newpass.setError("Invalid Password Confirmation");
                    newpass.requestFocus();
                    return;
                }
                t.Password = newpass.getText().toString();
                new changepass(t).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                adialog.dismiss();

                //else dialog stays open. Make sure you have an obvious way to close the dialog especially if you set cancellable to false.
            }
        });


    }
    private class changepass extends AsyncTask<Void, Members, Results> {
        Members aa;
        public changepass(Members a) {
            this.aa = a;
        }
        @Override
        protected Results doInBackground(Void... params) {

            Results results = null;
            String result = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
                result = JsonParser.postjson("changepass", "No", g.toJson(aa));
                Type localType = new TypeToken<Results>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(Results res) {
            try {
                if (res.Code==0)
                {
                    member = (Members)res.content;
                    pass.setText(member.Password);
                    new getmember(member.Password).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                }
                if (res.Code == -1)
                    Toast.makeText(Login.this, res.Desc, Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private class forgotpass extends AsyncTask<Void, String, Results> {
        String aa;
        public forgotpass(String a) {
            this.aa = a;
        }
        @Override
        protected Results doInBackground(Void... params) {

            Results results = null;
            String result = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
                result = JsonParser.postjson("forgotpass", "No", aa);
                Type localType = new TypeToken<Results>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(Results res) {
            try {
                if (res.Code==0)
                {
                    member = (Members)res.content;
                    ConfirmationBox(member);
                }
                if (res.Code == -1)
                    Toast.makeText(Login.this, res.Desc, Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private static final int PERMISSION_REQUEST_CODE = 200;
    private  boolean checkPermission(String permission) {

        return ContextCompat.checkSelfPermission(this,permission) == PackageManager.PERMISSION_GRANTED;

    }

    private void requestPermissionAndContinue(String permission) {

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, permission))
                    {
                AlertDialog.Builder alertBuilder = new AlertDialog.Builder(this);
                alertBuilder.setCancelable(true);
                alertBuilder.setTitle("Required Permission");
                alertBuilder.setMessage("Application requires access rights");
                alertBuilder.setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
                    public void onClick(DialogInterface dialog, int which) {
                        ActivityCompat.requestPermissions(com.trimline.investors.Login.this, new String[]{permission
                                }, PERMISSION_REQUEST_CODE);
                    }
                });
                AlertDialog alert = alertBuilder.create();
                alert.show();
                Log.e("", "permission denied, show dialog");
            } else {
                ActivityCompat.requestPermissions(com.trimline.investors.Login.this, new String[]{permission} ,PERMISSION_REQUEST_CODE);
            }

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {

        if (requestCode == PERMISSION_REQUEST_CODE) {
            if (permissions.length > 0 && grantResults.length > 0) {

                boolean flag = true;
                for (int i = 0; i < grantResults.length; i++) {
                    if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                        flag = false;
                    }
                }

            } else {

            }
        } else {
            super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

}
