package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.databinding.DataBindingUtil;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Contactitem;

import java.lang.reflect.Type;
import java.util.concurrent.ExecutionException;

public class Register extends AppCompatActivity {
    Contactitem contactitem;
    Button register;
    members m;
    Contact c;
    RadioGroup rg;
    LinearLayout ll;
    RadioButton member, nonmember;

    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_register);
        contactitem = DataBindingUtil.setContentView(this, R.layout.activity_register);
        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Registering...please wait");
        //  progressDialog.setCancelable(true);
        contactitem.setContacts(new Contact());
        ll = (LinearLayout) findViewById(R.id.nonmemberlayout);
        ll.setVisibility(View.GONE);
        rg = (RadioGroup) findViewById(R.id.type);
        member = (RadioButton) findViewById(R.id.member);
        nonmember = (RadioButton) findViewById(R.id.nonmember);

        rg.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                switch (i) {
                    case R.id.member:
                        ll.setVisibility(View.GONE);
                        break;

                    case R.id.nonmember:
                        ll.setVisibility(View.VISIBLE);
                }
            }
        });

        register = (Button) findViewById(R.id.register);
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                c = contactitem.getContacts();
                switch (rg.getCheckedRadioButtonId()) {
                    case R.id.member:
                        if (c.National_ID_No == null || c.National_ID_No.contentEquals("")) {
                            contactitem.IdentityNo.setError("Please enter your Id No/ passport no");
                            contactitem.IdentityNo.requestFocus();
                            return;
                        }

                        new getlogin(c.National_ID_No).execute();
                        progressDialog.show();

                        break;
                    case R.id.nonmember:

                        if (c != null) {
                            if (c.First_Name == null || c.First_Name.contentEquals("")) {
                                contactitem.Name.setError("Input Required");
                                contactitem.Name.requestFocus();
                                return;
                            }
                            if (c.Mobile_Phone_No == null || c.Mobile_Phone_No.contentEquals("")) {
                                contactitem.PhoneNo.setError("Input Required");
                                contactitem.PhoneNo.requestFocus();
                                return;
                            }
                            if (c.National_ID_No == null || c.National_ID_No.contentEquals("")) {
                                contactitem.IdentityNo.setError("Input Required");
                                contactitem.IdentityNo.requestFocus();
                                return;
                            }
                            if (c.E_Mail_Address == null || c.E_Mail_Address.contentEquals("")) {
                                contactitem.EMail.setError("Input Required");
                                contactitem.EMail.requestFocus();
                                return;
                            }
                            if (c.Pass == null || c.Pass.contentEquals("")
                            ) {
                                contactitem.Pass.setError("Input Required");
                                contactitem.Pass.requestFocus();
                                return;
                            }
                            if (c.Confirm_Pass == null || c.Confirm_Pass.contentEquals("")
                            ) {
                                contactitem.confirmpassword.setError("Input Required");
                                contactitem.confirmpassword.requestFocus();
                                return;
                            }
                            if (!c.Pass.contentEquals(c.Confirm_Pass)) {
                                contactitem.Pass.setError("Password does not match");
                                contactitem.Pass.requestFocus();
                                return;
                            }
                            progressDialog.show();
                            new checkmember(c).execute();
                        } else {
                            contactitem.Name.setError("Input Required");
                            contactitem.Name.requestFocus();
                            return;
                        }
                        break;
                }
            }
        });
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
                progressDialog.hide();
                accountfound(p);
            } else {
                new getmember(idno,true).execute();
            }
        }
    }

    private class getmember extends AsyncTask<Void, String, members> {
        private String emails;
        private boolean ft;

        public getmember(String s,boolean firsttime) {
            emails = s;
            ft = firsttime;
        }

        @Override
        protected members doInBackground(Void... agents) {
            members p = null;
            try {
                getmembers m = new getmembers();
                m.idno = emails;
                m.Firsttime = ft;

                String result ;
                if (m.Firsttime)
                    result= JsonParser.postjson("membersfirst", "email",new Gson().toJson(m));
                else
                    result= JsonParser.postjson("members", "email", emails);
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
            progressDialog.hide();
            if (p == null)
                Noaccount();
            else {
                ConfirmationBox(p);
                Investments.member = p;
                Investments.member.member_type = members.Member_type.Member;
            }
            // startActivity(new Intent(Register.this,Home.class));
        }
    }

    private class checkmember extends AsyncTask<Void, String, members> {
        private Contact emails;

        public checkmember(Contact s) {
            emails = s;
        }

        @Override
        protected members doInBackground(Void... agents) {
            members p = null;
            try {
                String result = JsonParser.postjson("members", "email", emails.National_ID_No);
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
            progressDialog.hide();
            if (p == null) {
                m = new members();
                m.Name = c.Last_Name;
                m.Phone_No = c.Mobile_Phone_No;
                m.E_Mail = c.E_Mail_Address;
                m.member_type = members.Member_type.Customer;
                m.National_ID_No = c.National_ID_No;
                Investments.member = m;
                user u = new user();
                u.ID_No = m.National_ID_No;
                u.Name = m.Name;
                u.Password = c.Pass;
                new createuser().execute(u);
                new createcontact().execute(c);
                startActivity(new Intent(Register.this, Home.class));
            } else {
                Toast.makeText(Register.this, "ID already exists, Please login as a member.", Toast.LENGTH_SHORT).show();
            }
            // startActivity(new Intent(Register.this,Home.class));
        }
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

    public void accountfound(final user t) {
        LayoutInflater li = LayoutInflater.from(Register.this);
        View promptsView = li.inflate(R.layout.loginfound, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Register.this);
        alertDialogBuilder.setView(promptsView);
        final TextView text1 = (TextView) promptsView.findViewById(R.id.accountiko);
        text1.setText("You are already registered, would like to Login or change your password");
        alertDialogBuilder
                .setCancelable(false)
                .setTitle(String.format("Welcome %s ", t.Name))
                .setPositiveButton("Login", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                })
                .setNegativeButton("Forgot Password", new DialogInterface.OnClickListener() {
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


                adialog.dismiss();

                startActivity(new Intent(Register.this, Login.class));
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

    public void ConfirmationBox(final members t) {
        LayoutInflater li = LayoutInflater.from(Register.this);
        View promptsView = li.inflate(R.layout.registerconfirmation, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Register.this);
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
                startActivity(new Intent(Register.this, Home.class));
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

    public void Noaccount() {
        LayoutInflater li = LayoutInflater.from(Register.this);
        View promptsView = li.inflate(R.layout.noaccountonfirmation, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                Register.this);
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

                rg.check(R.id.nonmember);
                adialog.dismiss();
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

    private class createcontact extends AsyncTask<Contact, String, Contact> {

        @Override
        protected Contact doInBackground(Contact... c) {
            Contact p = null;
            try {
                String result = JsonParser.postjson("contact", "contact", new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(c[0]));
                Type localType = new TypeToken<Contact>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }

        @Override
        protected void onPostExecute(Contact p) {
            Toast.makeText(getApplicationContext(), "Contact created successfully", Toast.LENGTH_LONG).show();
        }
    }
}
