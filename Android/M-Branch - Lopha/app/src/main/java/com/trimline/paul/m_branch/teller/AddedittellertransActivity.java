package com.trimline.paul.m_branch.teller;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;


import com.google.android.material.snackbar.Snackbar;
import com.trimline.paul.m_branch.R;


import com.trimline.paul.m_branch.enums.transaction_Type;

import java.util.Arrays;
import java.util.stream.Collectors;

public class AddedittellertransActivity extends AppCompatActivity {

    private com.trimline.paul.m_branch.databinding.Tellerbinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this,R.layout.addedittellertrans);
        Intent i = getIntent();
        Teller t = (Teller) i.getSerializableExtra("teller");



// Create an ArrayAdapter using the enum values
        ArrayAdapter<transaction_Type> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, Arrays.stream(transaction_Type.values()).filter(o-> o == transaction_Type.Return_To_Bank || o == transaction_Type.Inter_Teller_Transfers).collect(Collectors.toList()));

// Set the dropdown layout style
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

// Set the adapter to the Spinner
        binding.transtype.setAdapter(adapter);

        binding.setTeller(t);
    }


}