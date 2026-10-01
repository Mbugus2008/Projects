package com.trimline.paul.metro;

import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.textfield.TextInputLayout;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class Changepassword extends AppCompatActivity {
    EditText oldpin, newpin, confirmpin;
    TextInputLayout oldWrapper, newWrapper, confirmWrapper;
    Button change;
    ProgressBar progress;
    DB db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_changepassword);
        db = new DB(this);
        oldWrapper = findViewById(R.id.input_layout_oldpin);
        newWrapper = findViewById(R.id.input_layout_newpin);
        confirmWrapper = findViewById(R.id.input_layout_confirmpin);
        oldpin = findViewById(R.id.oldpin);
        newpin = findViewById(R.id.newpin);
        confirmpin = findViewById(R.id.confirmpin);
        progress = findViewById(R.id.progress);
        change = findViewById(R.id.changepin);
        change.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                oldWrapper.setError(null);
                newWrapper.setError(null);
                confirmWrapper.setError(null);
                if (Myvariables.CurrentAgent == null) {
                    Toast.makeText(getApplicationContext(), "Not logged in", Toast.LENGTH_LONG).show();
                    return;
                }
                String current = oldpin.getText().toString().trim();
                String np = newpin.getText().toString().trim();
                String cp = confirmpin.getText().toString().trim();
                if (current.isEmpty()) {
                    oldWrapper.setError("Enter your current PIN");
                    return;
                }
                if (!current.equals(Myvariables.CurrentAgent.Password)) {
                    oldWrapper.setError("Current PIN is incorrect");
                    return;
                }
                if (np.length() < 4) {
                    newWrapper.setError("New PIN must be at least 4 digits");
                    return;
                }
                if (np.equals(current)) {
                    newWrapper.setError("New PIN must be different from the current one");
                    return;
                }
                if (!np.equals(cp)) {
                    confirmWrapper.setError("PINs do not match");
                    return;
                }
                new Changepin().execute(np);
            }
        });
    }

    private class Changepin extends AsyncTask<String, Void, String> {
        private String pin;

        @Override
        protected void onPreExecute() {
            change.setEnabled(false);
            progress.setVisibility(View.VISIBLE);
        }

        @Override
        protected String doInBackground(String... params) {
            pin = params[0];
            try {
                Map<String, String> payload = new HashMap<String, String>();
                payload.put("Agent_Code", Myvariables.CurrentAgent.Agent_Code);
                payload.put("Password", pin);
                String json = new Gson().toJson(payload);
                return JsonParser.postjson("changepass", "No", json);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        @Override
        protected void onPostExecute(String res) {
            change.setEnabled(true);
            progress.setVisibility(View.GONE);
            if (res != null && res.contains("\"Desc\":\"OK\"")) {
                // keep the local copy in sync so login works even before the next sync
                Myvariables.CurrentAgent.Password = pin;
                if (login.CurrentAgent != null)
                    login.CurrentAgent.Password = pin;
                db.updateagent(Myvariables.CurrentAgent);
                Toast.makeText(getApplicationContext(), "PIN changed successfully", Toast.LENGTH_LONG).show();
                finish();
            } else {
                Toast.makeText(getApplicationContext(), "Could not change PIN - check your connection and try again", Toast.LENGTH_LONG).show();
            }
        }
    }
}
