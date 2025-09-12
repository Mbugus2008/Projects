package com.trimline.investments;

import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Investments extends Application {
    public static  members member;
    public static long downloadID;
    public static List<Account_Types> account_types;
    public  static   List<Share_Setup> share_setups =new ArrayList<>();
    public static class MyAdapter extends FragmentPagerAdapter {
        private Context myContext;
        int totalTabs;

        public MyAdapter(Context context, FragmentManager fm, int totalTabs) {
            super(fm);
            myContext = context;
            this.totalTabs = totalTabs;
        }
        // this is for fragment tabs
        @Override
        public Fragment getItem(int position) {
            switch (position) {
                case 0:
                    Property propertyFragment = new Property();
                    return propertyFragment;
                case 1:
                    Shares_Trading homeFragment = new Shares_Trading();
                    return homeFragment;
                default:
                    return null;
            }
        }
        // this counts total number of tabs
        @Override
        public int getCount() {
            return totalTabs;
        }
    }


}
