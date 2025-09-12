package com.trimline.investments;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.animation.Animator;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.navigation.NavigationView;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.material.tabs.TabLayout;
import com.google.gson.Gson;
import com.trimline.investments.databinding.Trans;

import androidx.databinding.DataBindingUtil;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.viewpager.widget.ViewPager;

import java.util.ArrayList;
import java.util.Arrays;

public class Home extends  AppCompatActivity  {
    private GoogleMap mMap;


    Boolean propertyselected = false;
    private DrawerLayout dl;
    private ActionBarDrawerToggle t;
    private NavigationView nv;
ImageView photo;
    TabLayout tabLayout;
    ViewPager viewPager;

    FloatingActionButton fab, fab1, fab2, fab3;
    ExtendedFloatingActionButton tr;
    LinearLayout fabLayout1, fabLayout2, fabLayout3;
    View fabBGLayout;
    boolean isFABOpen = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_nav);
        Toolbar toolbar = findViewById(R.id.toolbar);
        toolbar.setTitle("KENYA POLICE");
        toolbar.setSubtitle("INVESTMENT COPERATIVE SOCIETY");

        toolbar.setNavigationIcon(R.drawable.investment_logo_small);
        setSupportActionBar(toolbar);

        dl = (DrawerLayout) findViewById(R.id.activity_main);
        t = new ActionBarDrawerToggle(this, dl, R.string.Open, R.string.Close);
        dl.addDrawerListener(t);
        t.syncState();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        nv = (NavigationView) findViewById(R.id.nv);
        loadmember();
        nv.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                int id = item.getItemId();
                switch (id) {
                    case R.id.Balance:
                        if (Investments.member.Member_Accounts == null) {
                            Toast.makeText(Home.this, "No Accounts Available", Toast.LENGTH_SHORT).show();
                            return true;
                        }
                        startActivity(new Intent(Home.this, balances.class));

                        break;
                    case R.id.Statement:
                        if (Investments.member.Member_Accounts == null) {
                            Toast.makeText(Home.this, "No Accounts Available", Toast.LENGTH_SHORT).show();
                            return true;
                        }
                        startActivity(new Intent(Home.this, mini.class));
                        break;
                    case R.id.mybooking:
                        startActivity(new Intent(Home.this, My_booking.class));
                        break;
                        case R.id.prop:
                        startActivity(new Intent(Home.this, My_Properties.class));
                        break;
                    case R.id.applications:
                        startActivity(new Intent(Home.this,Realestatefund.class));
                        break;
                    case R.id.Runnning:
                        startActivity(new Intent(Home.this,activefunds.class));
                        break;
                    default:
                        Toast.makeText(Home.this, item.getTitle().toString(), Toast.LENGTH_SHORT).show();
                        return true;
                }
                return true;
            }
        });

        tabLayout=(TabLayout)findViewById(R.id.tabLayout1);
        viewPager=(ViewPager)findViewById(R.id.viewPager);
        tabLayout.addTab(tabLayout.newTab().setText("Properties"));
        if (Investments.member == null)
        {

            startActivity(new Intent(Home.this, Login.class));
            return;
        }
        if (Investments.member.member_type == members.Member_type.Member)
        tabLayout.addTab(tabLayout.newTab().setText("Shares Trading"));
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);
        final Investments. MyAdapter adapter = new Investments.MyAdapter(this,getSupportFragmentManager(), tabLayout.getTabCount());
        viewPager.setAdapter(adapter);
        viewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                viewPager.setCurrentItem(tab.getPosition());
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        }
        );

        //menu
        fabLayout1 = (LinearLayout) findViewById(R.id.fabLayout1);
        fabLayout2 = (LinearLayout) findViewById(R.id.fabLayout2);
        fabLayout3 = (LinearLayout) findViewById(R.id.fabLayout3);
        tr = (ExtendedFloatingActionButton) findViewById(R.id.fab);
        tr.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Home.this, transfer.class));
            }
        });
        fab1 = (FloatingActionButton) findViewById(R.id.fab1);
        fab1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Home.this, transfer.class));
                closeFABMenu();
            }
        });
        fab2 = (FloatingActionButton) findViewById(R.id.fab2);
        fab2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });
        fab3 = (FloatingActionButton) findViewById(R.id.fab3);
        fabBGLayout = findViewById(R.id.fabBGLayout);
//
//        fab.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                if (!isFABOpen) {
//                    showFABMenu();
//                } else {
//                    closeFABMenu();
//                }
//            }
//        });

        fabBGLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                closeFABMenu();
            }
        });

    }
    public void Transfer()
    {


    }

    private void showFABMenu() {
        isFABOpen = true;
        fabLayout1.setVisibility(View.VISIBLE);
        //fabLayout2.setVisibility(View.VISIBLE);
        //fabLayout3.setVisibility(View.VISIBLE);
        fabBGLayout.setVisibility(View.VISIBLE);
        fab.animate().rotationBy(180);
        fabLayout1.animate().translationY(-getResources().getDimension(R.dimen.standard_55));
        //fabLayout2.animate().translationY(-getResources().getDimension(R.dimen.standard_100));
        //fabLayout3.animate().translationY(-getResources().getDimension(R.dimen.standard_145));
    }

    private void closeFABMenu() {
        isFABOpen = false;
        fabBGLayout.setVisibility(View.GONE);
        fab.animate().rotation(0);
        fabLayout1.animate().translationY(0);
        //fabLayout2.animate().translationY(0);
        //fabLayout3.animate().translationY(0);
        fabLayout1.animate().translationY(0).setListener(new Animator.AnimatorListener() {
            @Override
            public void onAnimationStart(Animator animator) {

            }

            @Override
            public void onAnimationEnd(Animator animator) {
                if (!isFABOpen) {
                    fabLayout1.setVisibility(View.GONE);
                    //fabLayout2.setVisibility(View.GONE);
                    //fabLayout3.setVisibility(View.GONE);
                }
            }

            @Override
            public void onAnimationCancel(Animator animator) {

            }

            @Override
            public void onAnimationRepeat(Animator animator) {

            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //getMenuInflater().inflate(R.menu.menu, menu);
        //super.onCreateOptionsMenu(menu);
        return true;
    }
    @Override
    public void onBackPressed() {
        if (isFABOpen) {
            closeFABMenu();
        } else {
            super.onBackPressed();
        }
    }
    @Override
    public void onResume() {
        super.onResume();  // Always call the superclass method first
    }
    private void loadmember() {
        TextView cust = (TextView) nv.getHeaderView(0). findViewById(R.id.customername);
        TextView balances = (TextView)nv.getHeaderView(0). findViewById(R.id.customerbalances);
        photo = (ImageView) nv.getHeaderView(0).findViewById(R.id.photo);
        if (cust != null) {
            StringBuilder s = new StringBuilder();
            if (Investments.member !=null){
            s.append(String.format("Name:       <b>%s</b><br/>", Investments.member.Name));
            s.append(String.format("Id No:      <b>%s</b><br/>", Investments.member.National_ID_No));
            s.append(String.format("Phone no:   <b>%s</b><br/>", Investments.member.Phone_No));
            s.append(String.format("E mail:     <b>%s</b><br/>", Investments.member.E_Mail));
            s.append(String.format("Category:     <b>%s</b><br/>", Investments.member.Member_Category));
            cust.setText(Html.fromHtml(s.toString()));}
//            StringBuilder b = new StringBuilder();
//            b.append(String.format("<b>ACCOUNT BALANCES</b><br/>"));
//            if (Investments.member.Member_Accounts !=null)
//            for (members.Member_Accounts_Listpart m : Investments.member.Member_Accounts
//            ) {
//                b.append(String.format("%s      KES. <b>%,.2f</b><br/>", m.Name, m.Balance));
//            }
//            balances.setText(Html.fromHtml(b.toString()));
            if (Investments.member!=null)
            if (Investments.member.Photo_url!=null)
            photo.setImageURI(Uri.parse(Investments.member.Photo_url));
        }
//s.append(String.format("KES. %,d",Math.round(sales.get(position).Minimum_Selling_Price * 100) / 100)))
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            case R.id.register:
                startActivity(new Intent(Home.this, Register.class));
                return true;
                case R.id.signin:
                startActivity(new Intent(Home.this, Login.class));

                return true;
            default:
                if(t.onOptionsItemSelected(item))
                    return true;
                return super.onOptionsItemSelected(item);
        }
    }
}
