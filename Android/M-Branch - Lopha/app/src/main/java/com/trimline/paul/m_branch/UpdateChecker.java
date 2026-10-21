package com.trimline.paul.m_branch;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import androidx.core.content.FileProvider;

import com.google.gson.Gson;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Silent self-update for sideloaded installs.
 *
 * Fetches a manifest, compares versionCode, downloads the APK to app storage
 * and hands it to the system package installer. Failures are ignored.
 *
 * Manifest shape:
 * {
 *   "versionCode": 2,
 *   "versionName": "1.3",
 *   "apkUrl": "http://matatu.trimline.co.ke/Lopha/App/Lopha-1.3.apk",
 *   "changelog": "What changed",
 *   "minVersionCode": 0
 * }
 * If minVersionCode is greater than the installed versionCode the update is
 * mandatory (no cancel).
 */
public class UpdateChecker {

    private static final String TAG = "UpdateChecker";

    /** Public manifest location (no auth). */
    public static final String VERSION_URL = "http://matatu.trimline.co.ke/Lopha/appversion.json";

    private static volatile boolean checking = false;
    private static volatile boolean prompted = false;
    private static volatile boolean pendingInstall = false;
    private static volatile boolean forced = false;
    private static volatile File downloadedApk;
    private static volatile UpdateInfo readyInfo;

    public static class UpdateInfo {
        public int versionCode;
        public String versionName;
        public String apkUrl;
        public String changelog;
        public int minVersionCode;
    }

    /** Call from an activity's onCreate; safe to call repeatedly. */
    public static void checkForUpdate(final Activity activity) {
        if (activity == null || prompted || checking) return;
        if (downloadedApk != null && downloadedApk.exists()) {
            showPrompt(activity, readyInfo);
            return;
        }
        checking = true;
        new CheckTask(activity).execute();
    }

    /** Call from an activity's onResume to resume a pending install. */
    public static void onResume(Activity activity) {
        if (activity == null) return;
        if (pendingInstall) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O
                    || activity.getPackageManager().canRequestPackageInstalls()) {
                pendingInstall = false;
                install(activity);
            } else if (forced) {
                showPrompt(activity, readyInfo);
            }
            return;
        }
        if (downloadedApk != null && downloadedApk.exists() && (forced || !prompted)) {
            showPrompt(activity, readyInfo);
        }
    }

    private static class CheckTask extends AsyncTask<Void, Void, UpdateInfo> {
        private final Activity activity;
        private int installed;
        private Exception error;

        CheckTask(Activity activity) {
            this.activity = activity;
        }

        @Override
        protected UpdateInfo doInBackground(Void... params) {
            HttpURLConnection connection = null;
            try {
                installed = getInstalledVersionCode(activity);
                URL url = new URL(VERSION_URL + "?ts=" + System.currentTimeMillis());
                connection = (HttpURLConnection) url.openConnection();
                connection.setConnectTimeout(15000);
                connection.setReadTimeout(30000);
                connection.setRequestProperty("Cache-Control", "no-cache");
                if (connection.getResponseCode() != 200) {
                    Log.i(TAG, "No update manifest (HTTP " + connection.getResponseCode() + ")");
                    return null;
                }
                InputStream in = connection.getInputStream();
                StringBuilder body = new StringBuilder();
                byte[] buffer = new byte[4096];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    body.append(new String(buffer, 0, read, "UTF-8"));
                }
                in.close();
                UpdateInfo info = new Gson().fromJson(body.toString(), UpdateInfo.class);
                if (info == null || info.apkUrl == null || info.apkUrl.trim().isEmpty()) return null;
                if (info.versionCode <= installed) {
                    Log.i(TAG, "App is up to date (installed " + installed + ")");
                    return null;
                }
                return info;
            } catch (Exception e) {
                error = e;
                Log.i(TAG, "Update check skipped: " + e.getMessage());
                return null;
            } finally {
                if (connection != null) connection.disconnect();
            }
        }

        @Override
        protected void onPostExecute(UpdateInfo info) {
            if (info == null) {
                checking = false;
                return;
            }
            forced = info.minVersionCode > 0 && installed < info.minVersionCode;
            Log.i(TAG, "Update available: v" + info.versionName + " (" + info.versionCode + ")"
                    + (forced ? " [REQUIRED]" : ""));
            new DownloadTask(activity, info).execute();
        }
    }

    private static class DownloadTask extends AsyncTask<Void, Void, File> {
        private final Activity activity;
        private final UpdateInfo info;

        DownloadTask(Activity activity, UpdateInfo info) {
            this.activity = activity;
            this.info = info;
        }

        @Override
        protected File doInBackground(Void... params) {
            HttpURLConnection connection = null;
            FileOutputStream out = null;
            InputStream in = null;
            try {
                File dir = new File(activity.getCacheDir(), "updates");
                if (!dir.exists()) dir.mkdirs();
                File target = new File(dir, "update-" + info.versionCode + ".apk");
                File part = new File(dir, "update-" + info.versionCode + ".part");
                if (target.exists() && target.length() > 0) return target;

                Log.i(TAG, "Downloading v" + info.versionName + " silently…");
                URL url = new URL(info.apkUrl);
                connection = (HttpURLConnection) url.openConnection();
                connection.setConnectTimeout(20000);
                connection.setReadTimeout(120000);
                if (connection.getResponseCode() != 200) {
                    Log.i(TAG, "APK download failed: HTTP " + connection.getResponseCode());
                    return null;
                }
                in = connection.getInputStream();
                out = new FileOutputStream(part);
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
                out.flush();
                out.close();
                out = null;
                in.close();
                in = null;
                if (!part.renameTo(target)) {
                    Log.i(TAG, "APK download failed: rename failed");
                    return null;
                }
                Log.i(TAG, "APK ready: " + target.getName() + " (" + target.length() + " bytes)");
                return target;
            } catch (Exception e) {
                Log.i(TAG, "APK download failed: " + e.getMessage());
                return null;
            } finally {
                try {
                    if (out != null) out.close();
                } catch (Exception ignored) {
                }
                try {
                    if (in != null) in.close();
                } catch (Exception ignored) {
                }
                if (connection != null) connection.disconnect();
            }
        }

        @Override
        protected void onPostExecute(File file) {
            checking = false;
            if (file != null && file.exists()) {
                downloadedApk = file;
                readyInfo = info;
                showPrompt(activity, info);
            }
        }
    }

    private static void showPrompt(final Activity activity, final UpdateInfo info) {
        if (activity == null || info == null || activity.isFinishing()) return;
        prompted = true;
        String message = "Version " + (info.versionName == null ? "" : info.versionName)
                + (info.changelog == null || info.changelog.trim().isEmpty() ? "" : "\n\n" + info.changelog);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(forced ? "Update required" : "Update available")
                .setMessage(message)
                .setCancelable(!forced)
                .setPositiveButton("Install", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        install(activity);
                    }
                })
                .create();
        if (!forced) {
            dialog.setButton(DialogInterface.BUTTON_NEGATIVE, "Later", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            });
        }
        dialog.show();
    }

    private static void install(Activity activity) {
        if (downloadedApk == null || !downloadedApk.exists()) return;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                && !activity.getPackageManager().canRequestPackageInstalls()) {
            pendingInstall = true;
            try {
                Intent settings = new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                        Uri.parse("package:" + activity.getPackageName()));
                activity.startActivity(settings);
                Toast.makeText(activity, "Allow installing updates, then return to the app", Toast.LENGTH_LONG).show();
            } catch (Exception e) {
                Log.i(TAG, "Cannot open install permission settings: " + e.getMessage());
            }
            return;
        }
        pendingInstall = false;
        try {
            Uri uri = FileProvider.getUriForFile(activity,
                    activity.getPackageName() + ".fileprovider", downloadedApk);
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setDataAndType(uri, "application/vnd.android.package-archive");
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
        } catch (Exception e) {
            Log.i(TAG, "Cannot launch installer: " + e.getMessage());
            Toast.makeText(activity, "Could not start the installer", Toast.LENGTH_LONG).show();
        }
    }

    private static int getInstalledVersionCode(Activity activity) {
        try {
            PackageInfo info = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
            return info.versionCode;
        } catch (Exception e) {
            return 0;
        }
    }
}