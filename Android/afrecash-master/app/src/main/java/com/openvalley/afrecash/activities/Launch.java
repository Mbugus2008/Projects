package com.openvalley.afrecash.activities;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.utils.ResponseHandler;

public class Launch extends AppCompatActivity {

    ResponseHandler responseHandler;
    ProfileHolder profileHolder;

    @Override
    protected void onResume() {
        super.onResume();
        responseHandler = new ResponseHandler(this);
        profileHolder = new ProfileHolder(this);
        if (profileHolder.userHasLoggedIn()) {
            startActivity(new Intent(Launch.this, Home.class));
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_launch);

        findViewById(R.id.btnProceed).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Launch.this, EnterPhone.class));
            }
        });
    }

}
