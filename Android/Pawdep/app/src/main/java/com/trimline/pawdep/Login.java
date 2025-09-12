package com.trimline.pawdep;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;


import com.facebook.stetho.Stetho;

import java.util.List;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;
import static android.Manifest.permission.READ_PHONE_STATE;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

public class Login extends AppCompatActivity {
    public static Agent agent;
    EditText email, pass;
    Button signin;
    Agent.dao dao;
    Devices.dao ddao;
    List<Devices> devices = null;
    Boolean Deviceallowed = false;
    SharedPreferences preferences;
    TextView deviceid;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        Stetho.initializeWithDefaults(this);
        //SqlScoutServer.create(this, getPackageName());
        getSupportActionBar().hide();
        startwork();
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        email = (EditText) findViewById(R.id.email);
        pass = (EditText) findViewById(R.id.password);
        signin = (Button) findViewById(R.id.signin);


        DB db = DB.getInstance(getApplicationContext());
        dao = db.agentdao();
        ddao = db.ddao();
        String value = preferences.getString("User", "");
        if (value != null || value != "") {
            email.setText(value);
            email.setSelectAllOnFocus(true);
        }

        if (!checkPermission(READ_PHONE_STATE))
            requestPermissionAndContinue(READ_PHONE_STATE);
        if (!checkPermission(WRITE_EXTERNAL_STORAGE))
            requestPermissionAndContinue(WRITE_EXTERNAL_STORAGE);
        if (!checkPermission(READ_EXTERNAL_STORAGE))
            requestPermissionAndContinue(READ_EXTERNAL_STORAGE);


        deviceid = (TextView)findViewById(R.id.deviceids);
        deviceid.setText(getUniqueID());
        signin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (email.getText().toString().equals("")) {
                    email.setError("User Name Required");
                    email.requestFocus();
                    return;
                }
                if (pass.getText().toString().equals("")) {
                    pass.setError("Password Required");
                    pass.requestFocus();
                    return;
                }
                new getdevices().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                new getmember(email.getText().toString()).execute();
            }
        });
    }

    void startwork() {

        new worker(Login.this).doWork();
//        PeriodicWorkRequest.Builder b = new PeriodicWorkRequest.Builder(worker.class, 2, TimeUnit.MINUTES);
//        PeriodicWorkRequest myWork = b.build();
//
//        WorkManager.getInstance().enqueueUniquePeriodicWork("updates", ExistingPeriodicWorkPolicy.REPLACE, myWork);

    }

    private class getmember extends AsyncTask<Void, String, Agent> {
        private String code;

        public getmember(String s) {
            code = s;
        }

        @Override
        protected Agent doInBackground(Void... agents) {
            Agent p = null;
            try {
                p = dao.getagents(code.toUpperCase());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }


        @Override
        protected void onPostExecute(Agent p) {
            if (p != null) {
                if (p.Active)
                    if (p.Password.contentEquals(pass.getText())) {

                        TelephonyManager mngr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                        String iidd = getUniqueID().toUpperCase();// mngr.getDeviceId();
                        Log.i("Device ids", iidd);
                        if (devices != null)
                            if (devices.stream().filter(o -> o.Device_id.contentEquals(iidd) && o.Active == true).count() != 0) {
                                Pawdep.Agent = p;
                                SharedPreferences.Editor editor = preferences.edit();
                                editor.putString("User", p.Code);
                                editor.commit();

                                startActivity(new Intent(Login.this, Allocations.class));
                            } else
                                Toast.makeText(Login.this, "Device Not allowed", Toast.LENGTH_SHORT).show();
                    } else {
                        email.setError("Invalid login detail");
                        email.requestFocus();
                    }
                else
                    Toast.makeText(Login.this, "Account not active", Toast.LENGTH_SHORT).show();
            } else {
                email.setError("Invalid login details");
                email.requestFocus();
            }
        }

    }

    public String getUniqueID() {
        String myAndroidDeviceId = "";
        TelephonyManager mTelephony = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {

        }
        if (mTelephony.getDeviceId() != null) {
            myAndroidDeviceId = mTelephony.getDeviceId();
        } else {
            myAndroidDeviceId = Settings.Secure.getString(getApplicationContext().getContentResolver(), Settings.Secure.ANDROID_ID);
        }
        return myAndroidDeviceId;
    }
    private class getdevices extends AsyncTask<Void, String, List<Devices>> {

        @Override
        protected List<Devices> doInBackground(Void... agents) {
            List<Devices> p = null;
            try {
                return ddao.getAll();

            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }

        @Override
        protected void onPostExecute(List<Devices> p) {
          devices = p;
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
                        ActivityCompat.requestPermissions(Login.this, new String[]{permission
                                }, PERMISSION_REQUEST_CODE);
                    }
                });
                AlertDialog alert = alertBuilder.create();
                alert.show();
                Log.e("", "permission denied, show dialog");
            } else {
                ActivityCompat.requestPermissions(Login.this, new String[]{permission} ,PERMISSION_REQUEST_CODE);
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
