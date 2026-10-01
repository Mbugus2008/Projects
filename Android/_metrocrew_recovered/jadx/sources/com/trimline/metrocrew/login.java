package com.trimline.metrocrew;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProviders;
import com.facebook.stetho.Stetho;
import com.google.android.material.textfield.TextInputLayout;

/* JADX INFO: loaded from: classes5.dex */
public class login extends AppCompatActivity {
    Button Login;
    DB db;
    agent.Model model;
    EditText pass;
    SharedPreferences preferences;
    EditText username;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        Stetho.initializeWithDefaults(this);
        Stetho.initializeWithDefaults(this);
        this.preferences = getSharedPreferences("Settings", 0);
        JsonParser.preferences = this.preferences;
        this.model = (agent.Model) ViewModelProviders.of(this).get(agent.Model.class);
        TextInputLayout usernameWrapper = (TextInputLayout) findViewById(R.id.input_layout_username);
        TextInputLayout passwordWrapper = (TextInputLayout) findViewById(R.id.input_layout_password);
        usernameWrapper.setHint("User Name");
        passwordWrapper.setHint("Pin");
        startwork();
        this.username = (EditText) findViewById(R.id.username);
        this.pass = (EditText) findViewById(R.id.password);
        this.pass.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.trimline.metrocrew.login.1
            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if ((event != null && event.getKeyCode() == 66) || actionId == 6) {
                    login.this.Login.performClick();
                    return false;
                }
                return false;
            }
        });
        String us = getpreferences("User");
        if (!us.equals("")) {
            this.username.setText(getpreferences("User"));
            this.pass.requestFocus();
        }
        this.Login = (Button) findViewById(R.id.login);
        this.Login.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.login.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                login.this.username.setError(null);
                login.this.pass.setError(null);
                if (login.this.username.getText().toString().equalsIgnoreCase("")) {
                    login.this.username.setError("username required");
                    login.this.username.requestFocus();
                } else if (login.this.pass.getText().toString().equalsIgnoreCase("")) {
                    login.this.pass.setError("Password required");
                    login.this.pass.requestFocus();
                } else {
                    agent a = new agent();
                    a.Password = login.this.pass.getText().toString();
                    a.Agent_Code = login.this.username.getText().toString();
                    login.this.new LoginTask(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new agent[0]);
                }
            }
        });
    }

    void startwork() {
        new worker(this).doWork();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void savePreferences(String key, String value) {
        SharedPreferences.Editor editor = this.preferences.edit();
        editor.putString(key, value);
        editor.commit();
    }

    private String getpreferences(String key) {
        String value = this.preferences.getString(key, "");
        if (value == null && value == "") {
            return "";
        }
        return value;
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }

    private class LoginTask extends AsyncTask<agent, Void, agent> {
        agent aa;

        public LoginTask(agent aaa) {
            this.aa = aaa;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public agent doInBackground(agent... agents) {
            agent a = login.this.model.agent(this.aa);
            return a;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(agent res) {
            if (res == null) {
                Toast.makeText(login.this.getApplicationContext(), "Invalid username or password", 1).show();
                return;
            }
            agent.Model model = login.this.model;
            agent.Model.CurrentAgent = res;
            login.this.savePreferences("User", res.Agent_Code);
            login.this.startActivity(new Intent(login.this, (Class<?>) MainActivity.class));
            Toast.makeText(login.this.getApplicationContext(), "Login successfull", 1).show();
        }
    }
}
