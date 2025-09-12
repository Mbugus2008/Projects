package com.trimline.m_branch.Utilities;

import android.app.Application;

import com.trimline.m_branch.agent;

import java.util.ArrayList;

public class Mbranch extends Application {
    public agent CurrentAgent;
    public ArrayList<String> vehs;
    public Printer printer;

    @Override
    public void onCreate() {
        super.onCreate();

        // Perform any initialization or setup tasks here.
        // This method is called when the application is first created.
    }
}

