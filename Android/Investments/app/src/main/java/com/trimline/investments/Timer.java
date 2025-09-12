package com.trimline.investments;

import android.app.Service;
import android.content.Intent;
import android.os.CountDownTimer;
import android.os.IBinder;
import android.util.Log;

public class Timer extends Service {

    @Override
    public IBinder onBind(Intent intent) {
//        // TODO Auto-generated method stub
//        timer = new CountDownTimer(5 *60 * 1000, 1000) {
//
//            public void onTick(long millisUntilFinished) {
//                //Some code
//                //inactivity = true;
//                timer.start();
//                Log.v("Timer::", "Started");
//            }
//
//            public void onFinish() {
//                //Logout
//                Intent intent = new Intent(LoginActivity.this,HomePageActivity.class);
//                startActivity(intent);
//                //inactivity = false;
//                timer.cancel();
//                Log.v("Timer::", "Stoped");
//            }
//        };
        return null;
    }

}
