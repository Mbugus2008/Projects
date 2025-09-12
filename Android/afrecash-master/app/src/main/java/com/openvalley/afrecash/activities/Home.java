package com.openvalley.afrecash.activities;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;
import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.datasets.User;
import com.openvalley.afrecash.fragments.HomeFragment;
import com.openvalley.afrecash.fragments.ProfileFragment;
import com.openvalley.afrecash.fragments.StatementFragment;
import com.openvalley.afrecash.listeners.PINListener;
import com.openvalley.afrecash.network.APIService;
import com.openvalley.afrecash.network.Connect;
import com.openvalley.afrecash.network.RetrofitClientInstance;
import com.openvalley.afrecash.uihelpers.ConfirmPINDialog;
import com.openvalley.afrecash.uihelpers.SetPINDialog;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;
import com.pathwaysinternational.pscorelib.PScore;
import org.json.JSONObject;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Home extends AppCompatActivity {

    private SectionsPagerAdapter mSectionsPagerAdapter;
    private ViewPager mViewPager;
    private ProfileHolder profileHolder;
    private ResponseHandler responseHandler;
    private static final int READ_CALL_LOG = 100;
    private static final int READ_SMS = 101;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Utils.boldToolBar(this);
        // Create the adapter that will return a fragment for each of the three
        // primary sections of the activity.
        profileHolder = new ProfileHolder(this);
        responseHandler = new ResponseHandler(this);
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        TabLayout tabLayout = findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(mViewPager);
        tabLayout.setTabMode(TabLayout.MODE_FIXED);
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);

        tabLayout.getTabAt(0).setIcon(R.drawable.ic_action_home);
        tabLayout.getTabAt(2).setIcon(R.drawable.ic_action_profile);
        responseHandler.showToast(profileHolder.getPhone());
        checkPermission(Manifest.permission.READ_SMS,READ_SMS);
       checkPermission(Manifest.permission.READ_CALL_LOG,READ_CALL_LOG);

    }

    public void checkPermission(String permission, int requestCode)
    {
        if (ContextCompat.checkSelfPermission(Home.this, permission) == PackageManager.PERMISSION_DENIED) {

            // Requesting the permission
            ActivityCompat.requestPermissions(Home.this, new String[] { permission }, requestCode);
        }
        else {
            //Toast.makeText(Home.this, "Permission already granted", Toast.LENGTH_SHORT).show();
            try {
                profileHolder = new ProfileHolder(this);
                PScore pScore = new PScore(Home.this,String.format("+%s", profileHolder.getPhone())){
                    @Override
                    protected void onPostExecute(Integer apiresponsecode){

                        responseHandler.showToast(String.valueOf(apiresponsecode));
                    }

                };
                pScore.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            }
            catch (Exception ex){ex.printStackTrace(); }

        }
    }
    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           @NonNull String[] permissions,
                                           @NonNull int[] grantResults)
    {
        super.onRequestPermissionsResult(requestCode,
                permissions,
                grantResults);

        if (requestCode == READ_CALL_LOG) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(Home.this, "Read call logs Permission Granted", Toast.LENGTH_SHORT) .show();
                try {
                    profileHolder = new ProfileHolder(this);
                    PScore pScore = new PScore(Home.this, String.format("+%s", profileHolder.getPhone())) {
                        @Override
                        protected void onPostExecute(Integer apiresponsecode) {

                            responseHandler.showToast(String.valueOf(apiresponsecode));
                        }

                    };
                    pScore.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                }catch (Exception ex){ex.printStackTrace();}
            }
            else {
                Toast.makeText(Home.this, "Read call logs Permission Denied", Toast.LENGTH_SHORT) .show();
            }
        }
        else if (requestCode == READ_SMS) {
            if (grantResults.length > 0
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(Home.this, "Storage Permission Granted", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(Home.this, "Storage Permission Denied", Toast.LENGTH_SHORT).show();
            }
        }
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_home, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            ProfileHolder profileHolder = new ProfileHolder(Home.this);
            profileHolder.logOut();
            return true;
        }

        if (id == R.id.action_password) {
            changePassword();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }


    private void changePassword() {
        new ConfirmPINDialog(this, new PINListener() {
            @Override
            public void onPINSet(String PIN) {
                if (PIN.equals(profileHolder.getPIN())) {
                    inititateChangePassword();
                } else {
                    responseHandler.showToast("Try again");
                }
            }

            @Override
            public void onPINCancelled() {

            }
        });
    }

    private void inititateChangePassword() {
        new SetPINDialog(this, new PINListener() {
            @Override
            public void onPINSet(String PIN) {
                changePassword(PIN);
            }

            @Override
            public void onPINCancelled() {

            }
        }, "Set Your PIN", true);
    }

    void changePassword(String pin) {
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Please wait...");
        progressDialog.setCancelable(false);
        progressDialog.show();

        User user = new User();
        user.setIDNo(profileHolder.getIDNumber());
        user.setName(profileHolder.getFirstName());
        user.setPassword(pin);
        user.setRegion(profileHolder.getRegionName());
        user.setPhoneNo(profileHolder.getPhone());
        user.setDeviceID(Connect.getDeviceModelName());

        APIService apiService = RetrofitClientInstance.getRetrofitInstance().create(APIService.class);


        Call<ResponseBody> call1 = apiService.changePassword(user);

        call1.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressDialog.dismiss();
                try {
                    String res = response.body().string();

                    JSONObject jsonObject = new JSONObject(res);

                    if (jsonObject.getInt("Code") < 0) {
                        responseHandler.showDialog("Error", "We encountered an error. Please try again later");
                    }

                    if (jsonObject.getInt("Code") > 0) {
                        responseHandler.showDialog("Error", jsonObject.getString("Desc"));
                    }

                    if (jsonObject.getInt("Code") == 0) {
                      profileHolder.logOutSilently();
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                    responseHandler.showToast("Registration unsuccessful");
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                progressDialog.dismiss();
                responseHandler.showToast("Registration unsuccessful");
            }
        });

    }

    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            switch (position) {
                case 0:
                    return new HomeFragment();
                case 1:
                    return new StatementFragment();
                case 2:
                    return new ProfileFragment();
            }
            return null;
        }

        @Override
        public int getCount() {
            // Show 3 total pages.
            return 3;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            switch (position) {
                case 0:
                    return "";
                case 1:
                    return "HISTORY";
                case 2:
                    return "";
            }
            return null;
        }
    }


    @Override
    public void onBackPressed() {
        new AlertDialog.Builder(this)
                .setTitle("Exit app")
                .setMessage("Do you really want to exit AfriCash?")
                .setCancelable(true)
                .setNegativeButton("YES", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Intent startMain = new Intent(Intent.ACTION_MAIN);
                        startMain.addCategory(Intent.CATEGORY_HOME);
                        startMain.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        startActivity(startMain);
                    }
                })
                .setPositiveButton("NO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .show();
    }

}
