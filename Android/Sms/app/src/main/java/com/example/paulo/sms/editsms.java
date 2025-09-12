package com.example.paulo.sms;

import android.os.AsyncTask;
import android.os.Bundle;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.textfield.TextInputEditText;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.view.View;
import android.widget.Toast;

import com.google.gson.Gson;

public class editsms extends AppCompatActivity {
TextInputEditText count;
    String client="";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editsms);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        Bundle b = new Bundle();
        b = getIntent().getExtras();

      client = b.getString(trans.client);


count = (TextInputEditText)findViewById(R.id.count);
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
            if(count.getText().toString().equals("")){
                count.setError("Enter no of Sms");
                return;
            }
            if(client.equals("")) {
            Toast.makeText(getApplicationContext(),"No Client set",Toast.LENGTH_LONG).show();
                return;

            }
Sms s = new Sms();
                s.balance = Integer.valueOf(count.getText().toString());
                s.client = client;

new balanceupdate(s).execute();
            }
        });
    }
    private class balanceupdate extends AsyncTask<Sms, String, String> {
       Sms ss ;
        balanceupdate(Sms sss){ss= sss;}

        @Override
        protected void onPreExecute() {

        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected String doInBackground(Sms... params) {
            //publishProgress("Getting logins");
            String results = "";
            String result = null;
            try {
                Gson g = new Gson();
                result = g.toJson(ss);
                result = JsonParser.postjson("addsms", "data",result);

                results = result;

            } catch (Exception e) {
                publishProgress("Unable to add sms");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(String res) {
            try {

                    Toast.makeText(getApplicationContext(), res, Toast.LENGTH_LONG).show();

                finish();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
