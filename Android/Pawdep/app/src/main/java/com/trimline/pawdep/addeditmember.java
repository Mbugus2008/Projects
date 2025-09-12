package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.trimline.pawdep.databinding.Memberbinding;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class addeditmember extends AppCompatActivity {
    Memberbinding member;
    Member.Model model;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.addeditmember);
        member = DataBindingUtil.setContentView(this, R.layout.addeditmember);
        model = ViewModelProviders.of(this).get(Member.Model.class);
        Intent i = getIntent();
        Member m = (Member) i.getSerializableExtra("member");
        member.setMember(m);
        Pawdep.bind(member.gender, Member.gender.class, addeditmember.this, true);

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.member, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.save:
                Member m = member.getMember();
                if (m.Name.equals("")) {
                    member.name.setError("Required");
                    member.name.requestFocus();
                    return true;
                }
                if (m.Phone_No.equals("")) {
                    member.phone.setError("Required");
                    member.phone.requestFocus();
                    return true;
                }
                if (m.ID_No.equals("")) {
                    member.idno.setError("Required");
                    member.idno.requestFocus();
                    return true;
                }
                if (m.Genderr.equals("")) {
                    member.gender.setError("Required");
                    member.gender.requestFocus();
                    return true;
                }

                model.insert(member.getMember());
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
