package com.trimline.metrocrew;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.metrocrew.databinding.Members;
import java.lang.reflect.Type;

/* JADX INFO: loaded from: classes5.dex */
public class add_edit_member extends AppCompatActivity {
    Members members;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.members = (Members) DataBindingUtil.setContentView(this, R.layout.activity_add_edit_member);
        Intent i = getIntent();
        Member t = (Member) i.getSerializableExtra("member");
        this.members.setD(t);
        this.members.save.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.add_edit_member.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Member m = add_edit_member.this.members.getD();
                if (m.Name.equalsIgnoreCase("")) {
                    add_edit_member.this.members.Nameedit.setError("Name Required");
                    add_edit_member.this.members.Nameedit.requestFocus();
                } else if (m.Phone_No.equalsIgnoreCase("")) {
                    add_edit_member.this.members.phoneedit.setError("Phone Required");
                    add_edit_member.this.members.phoneedit.requestFocus();
                } else if (m.ID_No.equalsIgnoreCase("")) {
                    add_edit_member.this.members.idedit.setError("Id Required");
                    add_edit_member.this.members.idedit.requestFocus();
                } else {
                    add_edit_member.this.new savemember(m).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                }
            }
        });
    }

    private class savemember extends AsyncTask<Void, Member, Member> {
        Member aa;
        private ProgressDialog dialog;

        public savemember(Member a) {
            this.dialog = new ProgressDialog(add_edit_member.this);
            this.aa = a;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            this.dialog.setMessage("Creating account for " + this.aa.Name + ", please wait.");
            this.dialog.show();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Member doInBackground(Void... params) throws Throwable {
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("newmember", "data", g.toJson(this.aa));
                Type localType = new TypeToken<Member>() { // from class: com.trimline.metrocrew.add_edit_member.savemember.1
                }.getType();
                Member results = (Member) new Gson().fromJson(result, localType);
                return results;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Member res) {
            if (this.dialog.isShowing()) {
                this.dialog.dismiss();
            }
            if (res != null) {
                try {
                    Intent returnIntent = new Intent();
                    returnIntent.putExtra("member", res);
                    add_edit_member.this.setResult(-1, returnIntent);
                    add_edit_member.this.finish();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
