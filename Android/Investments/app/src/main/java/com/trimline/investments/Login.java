package com.trimline.investments;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.login.LoginException;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

public class Login extends AppCompatActivity {
    public static members member;
    EditText email, pass;
    TextView header,forgotpass,register;

    Button signin;
    user cuser = null;
    ProgressBar lp;
    members m;
    getlogin g ;
    getmember mm;
    ProgressDialog progressDialog ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        email = (EditText) findViewById(R.id.email);
        pass = (EditText) findViewById(R.id.password);
        signin = (Button) findViewById(R.id.signin);
        header = (TextView)findViewById(R.id.header);
        lp = (ProgressBar)findViewById(R.id.loginprogress);

        forgotpass= (TextView)findViewById(R.id.forgotpassword);
        forgotpass.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(email.getText().toString().equals(""))
                {
                    email.setError("Id Required");
                    email.requestFocus();
                    return;
                }
                progressDialog.setMessage("Checking Your details");
                progressDialog.show();

            new forgotpass(email.getText().toString()).execute();
            }
        });
        register =(TextView)findViewById(R.id.register);
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Login.this,Register.class));
            }
        });

        if (!checkPermission())
            requestPermissionAndContinue();
        progressDialog= new ProgressDialog(this );
        progressDialog.setMessage("Verifying credentials...please wait");

        signin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {

                            if (email.getText().toString().equals("")) {
                                email.setError("Please Enter your id");
                                email.requestFocus();
                                return;
                            }
                              if (pass.getText().toString().equals("")) {
                                pass.setError("Please Enter your password");
                                pass.requestFocus();
                                return;
                            }
                              progressDialog.show();
                    new getlogin(email.getText().toString()).execute();;
                }catch (Exception ex){ex.printStackTrace();}
            }
        });
    }

    private class forgotpass extends AsyncTask<Void, String, members> {
        private String idno;

        public forgotpass(String s) {
            idno = s;
        }

        @Override
        protected members doInBackground(Void... agents) {
            members p = null;
            try {
                getmembers m = new getmembers();
                m.idno = idno;
                m.Firsttime = true;

                String result = JsonParser.postjson("membersfirst", "email",new Gson().toJson(m));
                Type localType = new TypeToken<members>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(members p) {
            progressDialog.dismiss();
            if (p != null) {
                ConfirmationBox(p);
                Investments.member = p;
                Investments.member.member_type = members.Member_type.Member;
            } else {
                Noaccount();
            }
        }
    }
    public void Noaccount() {
        LayoutInflater li = LayoutInflater.from(Login.this);
        View promptsView = li.inflate(R.layout.noaccountonfirmation, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Login.this);
        alertDialogBuilder.setView(promptsView);
        final TextView noaccount = (TextView) promptsView
                .findViewById(R.id.noaccount);
        noaccount.setText("Sorry we could not find any account Details, would you like to register?");

        alertDialogBuilder
                .setCancelable(false)
                .setTitle("No Details found")
                .setPositiveButton("Register", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                    }
                })
        ;
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
               // rg.check(R.id.nonmember);
                adialog.dismiss();

            }
        });
        adialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                adialog.dismiss();
            }
        });

    }
    public void ConfirmationBox(final members t) {
        LayoutInflater li = LayoutInflater.from(Login.this);
        View promptsView = li.inflate(R.layout.registerconfirmation, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Login.this);
        alertDialogBuilder.setView(promptsView);
        final EditText otp = (EditText) promptsView.findViewById(R.id.otp);
        final EditText pass = (EditText) promptsView.findViewById(R.id.password);
        final EditText cpass = (EditText) promptsView.findViewById(R.id.confirm);


        alertDialogBuilder
                .setCancelable(false)
                .setTitle(String.format("Welcome %s ", t.Name))
                .setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {

                    }
                })

        ;
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (pass.getText().toString().equals("")) {
                    pass.setError("Password required"
                    );
                    pass.requestFocus();
                    return;
                }
                if (cpass.getText().toString().equals("")) {
                    cpass.setError("Password confirmation required"
                    );
                    cpass.requestFocus();
                    return;
                }

                if (!pass.getText().toString().equals(cpass.getText().toString())) {
                    pass.setError("Password does not match"
                    );
                    cpass.setError("Password does not match"
                    );
                    return;
                }
                if (otp.getText().toString().equals("")) {
                    otp.setError("otp required"
                    );
                    otp.requestFocus();
                    return;
                }
                if (!otp.getText().toString().equals(t.Otp)) {
                    otp.setError("Incorrect Otp"
                    );
                    otp.requestFocus();
                    return;
                }
                user u = new user();
                u.ID_No = t.National_ID_No;
                u.Name = t.Name;
                u.Password = pass.getText().toString();

                new createuser().execute(u);

                adialog.dismiss();
                Investments.member = t;
                startActivity(new Intent(Login.this, Home.class));
                //else dialog stays open. Make sure you have an obvious way to close the dialog especially if you set cancellable to false.
            }
        });
        adialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                adialog.dismiss();
            }
        });

    }

    private class createuser extends AsyncTask<user, String, user> {

        @Override
        protected user doInBackground(user... agents) {
            user p = null;
            try {
                String result = JsonParser.postjson("loginsadd", "data", new Gson().toJson(agents[0]));
                Type localType = new TypeToken<user>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }

        @Override
        protected void onPostExecute(user p) {
            if (p != null) {


            } else {

            }
        }
    }
    private class getlogin extends AsyncTask<Void, String, user> {
        private String idno;
        public getlogin(String s) {
            idno = s;
        }
        @Override
        protected user doInBackground(Void... agents) {
            user p = null;
            try {
                String result = JsonParser.postjson("logins", "id", idno);
                Type localType = new TypeToken<user>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(user p) {

            if (p != null) {
                if (!pass.getText().toString().equals(p.Password))
                {
                    Toast.makeText(Login.this, "Invalid username/Password", Toast.LENGTH_SHORT).show();
                    progressDialog.hide();
                    return ;
                }
                progressDialog.setMessage("Fetching you account Details");
              new getmember(idno).execute();

            } else {
                progressDialog.hide();
                email.setError("Invalid Credentials");
            }
        }
    }
    private class getmember extends AsyncTask<Void, String, members> {
        private String emails;
        public getmember(String s) {
            emails = s;
        }
        @Override
        protected members doInBackground(Void... agents) {
            members p = null;
            try {
                String result = JsonParser.postjson("members", "email", emails);
                Type localType = new TypeToken<members>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(members p) {

            if (p != null) {
                progressDialog.hide();
                    p.member_type = members.Member_type.Member;
                   Investments.member = p;

                   startActivity(new Intent(Login.this, Home.class));

            } else {
              new getcustomer(emails).execute();
            }
        }
    }
    private class getcustomer extends AsyncTask<Void, String, Contact> {
        private String emails;
        public getcustomer(String s) {
            emails = s;
        }
        @Override
        protected Contact doInBackground(Void... agents) {
            Contact p = null;
            try {
                String result = JsonParser.postjson("getcustomer", "email", emails);
                Type localType = new TypeToken<Contact>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(Contact c) {
            progressDialog.hide();
            if (c != null) {
                try {
                    members m = new members();
                    m.Name = c.First_Name + " "+ c.Last_Name;
                    m.Phone_No = c.Mobile_Phone_No;
                    m.E_Mail = c.E_Mail_Address;
                    m.member_type = members.Member_type.Customer;
                    m.National_ID_No = c.National_ID_No;
                    Investments.member = m;
                    startActivity(new Intent(Login.this, Home.class));
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            } else {
                email.setError("Account Not found");
                email.requestFocus();
                Toast.makeText(Login.this, "We could not find your account please register", Toast.LENGTH_SHORT).show();
            }
        }
    }
    private static final int PERMISSION_REQUEST_CODE = 200;
    private  boolean checkPermission() {

        return ContextCompat.checkSelfPermission(this, WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;


    }

    private void requestPermissionAndContinue() {


        if (ActivityCompat.shouldShowRequestPermissionRationale(this, WRITE_EXTERNAL_STORAGE))
        {
            AlertDialog.Builder alertBuilder = new AlertDialog.Builder(this);
            alertBuilder.setCancelable(true);
            alertBuilder.setTitle("Required Permission");
            alertBuilder.setMessage("Application requires access rights");
            alertBuilder.setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
                public void onClick(DialogInterface dialog, int which) {
                    ActivityCompat.requestPermissions(Login.this, new String[]{WRITE_EXTERNAL_STORAGE
                            ,READ_EXTERNAL_STORAGE}, PERMISSION_REQUEST_CODE);
                }
            });
            AlertDialog alert = alertBuilder.create();
            alert.show();
            Log.e("", "permission denied, show dialog");
        } else {
            ActivityCompat.requestPermissions(Login.this, new String[]{WRITE_EXTERNAL_STORAGE
                    ,READ_EXTERNAL_STORAGE} ,PERMISSION_REQUEST_CODE);
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


    private class accounttypes extends AsyncTask<Void, Void, List<Account_Types>> {
        @Override
        protected List<Account_Types> doInBackground(Void... agents) {
            List<Account_Types> p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("paymentmethods", null, null);
                Type localType = new TypeToken<List<Account_Types>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<Account_Types> p) {
            if (p != null) {
              Investments.account_types  = p;
            }
        }
    }
}
