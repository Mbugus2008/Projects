package com.openvalley.afrecash.utils;

import android.app.AlertDialog;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import androidx.core.app.NotificationCompat;
import android.widget.Toast;

import com.openvalley.afrecash.R;


/**
 * Created by Geek Nat on 5/9/2016.
 */
public class ResponseHandler {
    Context context;

    public ResponseHandler(Context context) {
        this.context = context;
    }

    public void showToast(String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }


    public static void showNotification(Context context, String title, String message, PendingIntent pendingIntent, Boolean setOngoing, Boolean setAutoCancel, int notifcationId) {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context);
        builder.setOngoing(setOngoing);
        builder.setAutoCancel(setAutoCancel);
        builder.setContentTitle(title);
        builder.setContentText(message);
        builder.setSmallIcon(R.mipmap.ic_launcher);
        builder.setTicker(message);
        builder.setStyle(new NotificationCompat.BigTextStyle().bigText(message));
        builder.setContentIntent(pendingIntent);
        NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        notificationManager.notify(notifcationId, builder.build());
    }

    public void showDialog(String title, String message) {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(context, AlertDialog.THEME_DEVICE_DEFAULT_LIGHT);
        alertDialog.setTitle(title);
        alertDialog.setMessage(message);
        alertDialog.setPositiveButton("OKAY", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alertDialog.show();
    }

//    public static void buildDialog(Context context, String title, String message, String positiveText, String negativeText, final dialogListener dialogListener) {
//        final Dialog dialog = new Dialog(context);
//        dialog.setContentView(R.layout.dialog_app);
//        dialog.setCancelable(false);
//        dialog.show();
//
//        ((TextView) dialog.findViewById(R.id.title)).setText(title);
//        ((TextView) dialog.findViewById(R.id.message)).setText(message);
//
//        if (title == null || title.equals("")) {
//            dialog.findViewById(R.id.title).setVisibility(View.GONE);
//        }
//
//        ((Button) dialog.findViewById(R.id.btnPositive)).setText(positiveText);
//        ((Button) dialog.findViewById(R.id.btnNegative)).setText(negativeText);
//
//        dialog.findViewById(R.id.btnPositive).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                dialogListener.onPositiveClick(dialog);
//            }
//        });
//        dialog.findViewById(R.id.btnNegative).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                dialogListener.onNegativeClick(dialog);
//            }
//        });

  //  }


//    public interface dialogListener {
//        void onPositiveClick(Dialog dialog);
//
//        void onNegativeClick(Dialog dialog);
//    }

}
