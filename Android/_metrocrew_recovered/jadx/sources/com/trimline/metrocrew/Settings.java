package com.trimline.metrocrew;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import java.util.Map;

/* JADX INFO: loaded from: classes5.dex */
public class Settings extends Activity {
    EditText Scale;
    EditText copies;
    EditText ip;
    EditText printer;
    Button save;
    SharedPreferences sharedPreferences;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.settings);
        this.printer = (EditText) findViewById(R.id.setprinter);
        this.copies = (EditText) findViewById(R.id.copiestoprint);
        this.ip = (EditText) findViewById(R.id.setip);
        this.sharedPreferences = getSharedPreferences("Settings", 0);
        Map<String, ?> keys = this.sharedPreferences.getAll();
        for (Map.Entry<String, ?> entry : keys.entrySet()) {
            Log.d("map values", entry.getKey() + ": " + entry.getValue().toString());
        }
        this.save = (Button) findViewById(R.id.savesetttings);
        this.save.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.Settings.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Settings.this.savePreferences("IP", Settings.this.ip.getText().toString());
                Settings.this.savePreferences("PRINTER", Settings.this.printer.getText().toString());
                Settings.this.savePreferences("COPIES", Settings.this.copies.getText().toString());
                Toast.makeText(Settings.this.getApplicationContext(), "Settings saved successfully", 1).show();
                Settings.this.finish();
            }
        });
        this.printer.setText(getpreferences("PRINTER"));
        this.ip.setText(getpreferences("IP"));
        this.ip.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.trimline.metrocrew.Settings.2
            @Override // android.view.View.OnFocusChangeListener
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {
                    Settings.this.savePreferences("IP", Settings.this.ip.getText().toString());
                }
            }
        });
        this.printer.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.trimline.metrocrew.Settings.3
            @Override // android.view.View.OnFocusChangeListener
            public void onFocusChange(View v, boolean hasFocus) {
            }
        });
        this.printer.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.Settings.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Intent BT = new Intent(Settings.this, (Class<?>) DeviceListActivity.class);
                BT.putExtra("SP", "P");
                Settings.this.startActivityForResult(BT, DeviceListActivity.REQUEST_CONNECT_BT);
            }
        });
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case DeviceListActivity.REQUEST_CONNECT_BT /* 8960 */:
                if (resultCode == -1) {
                    try {
                        String sp = data.getExtras().get("SP").toString();
                        String extra = data.getExtras().get("device_address").toString();
                        if (sp.equals("S")) {
                            this.Scale.setText(extra);
                            savePreferences("SCALE", extra);
                        } else if (sp.equals("P")) {
                            this.printer.setText(extra);
                            savePreferences("PRINTER", extra);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        return;
                    }
                }
                break;
        }
    }

    private String getpreferences(String key) {
        String value = this.sharedPreferences.getString(key, "");
        if (value == null && value == "") {
            return "";
        }
        return value;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void savePreferences(String key, String value) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        editor.putString(key, value);
        editor.commit();
    }
}
