package com.trimline.paul.metro;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import androidx.core.content.FileProvider;

import com.google.gson.Gson;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Silent self-update for sideloaded installs.
 *
 * Flow: fetch the version manifest in the background -> if the installed
 * versionCode is older, download the APK silently to app storage -> once the
 * download is complete, ask the user whether to install -> hand off to the
 * system package installer.
 *
 * Server side: upload the release APK plus a JSON manifest, e.g.
 *   https://services.trimline.co.ke/Metro/appversion.json
 *   {
 *     "versionCode": 2,
 *     "versionName": "1.1",
 *     "apkUrl": "https://services.trimline.co.ke/Metro/App/MetroTrans-1.1.apk",
 *     "changelog": "What changed in this release",
 *     "minVersionCode": 2
 *   }
 * If minVersionCode is present and higher than the installed versionCode, the
 * update is MANDATORY: a blocking dialog with no "Later" option is shown until
 * the new APK is installed. Omit it (or set 0) for a friendly optional update.
 * Remember to bump versionCode + versionName in app/build.gradle on every release,
 * otherwise no device will ever see an update.
 */
public class UpdateChecker {

    private static final String TAG = "UpdateChecker";

    /** Public manifest location (no auth). The check is silent - failures are ignored. */
    public static final String VERSION_URL = "https://services.trimline.co.ke/Metro/appversion.json";

    private static final OkHttpClient CLIENT = new OkHttpClient.Builder()
            .connectTimeout(20, TimeUnit.SECONDS)
            .readTimeout(120, TimeUnit.SECONDS)
            .build();

    private static volatile boolean checking = false;
    private static volatile boolean prompted = false;
    private static volatile boolean pendingInstall = false;
    private static volatile boolean forced = false;
    private static volatile AlertDialog currentDialog;
    private static volatile File downloadedApk;
    private static volatile UpdateInfo readyInfo;

    public static class UpdateInfo {
        public int versionCode;
        public String versionName;
        public String apkUrl;
        public String changelog;
        /** If > 0 and the installed versionCode is lower, the update is mandatory
         *  (blocking dialog, no way past it until installed). */
        public int minVersionCode;
    }

    /** Call from an activity's onCreate; safe to call repeatedly (runs once per process). */
    public static void checkForUpdate(final Activity activity) {
        if (activity == null || prompted) return;
        if (downloadedApk != null && downloadedApk.exists()) {
            showPrompt(activity, readyInfo);
            return;
        }
        if (checking) return;
        checking = true;

        Request request = new Request.Builder()
                .url(VERSION_URL + "?ts=" + System.currentTimeMillis())
                .header("Cache-Control", "no-cache")
                .build();

        CLIENT.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                checking = false;
                Log.i(TAG, "Update check skipped: " + e.getMessage());
            }

            @Override
            public void onResponse(Call call, Response response) {
                try (Response r = response) {
                    if (!r.isSuccessful() || r.body() == null) {
                        checking = false;
                        Log.i(TAG, "No update manifest (HTTP " + r.code() + ")");
                        return;
                    }
                    UpdateInfo info = new Gson().fromJson(r.body().string(), UpdateInfo.class);
                    if (info == null || info.apkUrl == null || info.apkUrl.isEmpty()) {
                        checking = false;
                        return;
                    }
                    int installed = getInstalledVersionCode(activity);
                    if (info.versionCode <= installed) {
                        checking = false;
                        forced = false;
                        Log.i(TAG, "App is up to date (installed " + installed + ")");
                        return;
                    }
                    forced = info.minVersionCode > 0 && installed < info.minVersionCode;
                    Log.i(TAG, "Update available: v" + info.versionName + " (" + info.versionCode + ")"
                            + (forced ? " [REQUIRED]" : ""));
                    if (forced && !(downloadedApk != null && downloadedApk.exists()))
                        showForcedDownloading(activity);
                    downloadApk(activity, info);
                } catch (Exception ex) {
                    checking = false;
                    Log.i(TAG, "Update check error: " + ex.getMessage());
                }
            }
        });
    }

    /** Call from an activity's onResume - shows a ready prompt or resumes a pending install. */
    public static void onResume(Activity activity) {
        if (activity == null) return;
        if (pendingInstall) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O
                    || activity.getPackageManager().canRequestPackageInstalls()) {
                pendingInstall = false;
                installApk(activity, downloadedApk);
            } else if (forced) {
                // still not permitted - keep the app blocked with the required-update dialog
                showPrompt(activity, readyInfo);
            }
            return;
        }
        if (downloadedApk != null && downloadedApk.exists() && (forced || !prompted)) {
            showPrompt(activity, readyInfo);
        }
    }

    private static void downloadApk(final Activity activity, final UpdateInfo info) {
        final File target = new File(getUpdateDir(activity), "update-" + info.versionCode + ".apk");
        if (target.exists() && target.length() > 0) {
            downloadedApk = target;
            readyInfo = info;
            checking = false;
            showPrompt(activity, info);
            return;
        }

        Request request = new Request.Builder().url(info.apkUrl).build();
        CLIENT.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                checking = false;
                Log.i(TAG, "APK download failed: " + e.getMessage());
            }

            @Override
            public void onResponse(Call call, Response response) {
                File part = new File(getUpdateDir(activity), "update-" + info.versionCode + ".part");
                try {
                    if (!response.isSuccessful() || response.body() == null) {
                        Log.i(TAG, "APK download failed: HTTP " + response.code());
                        response.close();
                        return;
                    }
                    InputStream in = response.body().byteStream();
                    FileOutputStream out = new FileOutputStream(part);
                    try {
                        byte[] buffer = new byte[8192];
                        int read;
                        while ((read = in.read(buffer)) != -1) {
                            out.write(buffer, 0, read);
                        }
                        out.flush();
                    } finally {
                        out.close();
                        in.close();
                        response.close();
                    }
                    if (part.renameTo(target)) {
                        downloadedApk = target;
                        readyInfo = info;
                        Log.i(TAG, "APK downloaded to " + target);
                        showPrompt(activity, info);
                    } else {
                        Log.i(TAG, "Could not finalize APK download");
                    }
                } catch (Exception ex) {
                    Log.i(TAG, "APK download error: " + ex.getMessage());
                    if (part.exists()) part.delete();
                } finally {
                    checking = false;
                }
            }
        });
    }

    private static void showPrompt(final Activity activity, final UpdateInfo info) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        if (info == null) return;
        if (!forced && prompted) return;
        activity.runOnUiThread(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            prompted = true;
            dismissCurrentDialog();
            String name = (info.versionName != null && !info.versionName.isEmpty())
                    ? info.versionName + " (" + info.versionCode + ")"
                    : String.valueOf(info.versionCode);
            String message;
            AlertDialog.Builder builder = new AlertDialog.Builder(activity).setCancelable(false);
            if (forced) {
                message = "This version is no longer supported.\n\nUpdate to version " + name
                        + " to continue using the app.";
                if (info.changelog != null && !info.changelog.trim().isEmpty()) {
                    message += "\n\nWhat's new: " + info.changelog.trim();
                }
                builder.setTitle("Update required")
                        .setMessage(message)
                        .setPositiveButton("Update now", (dialog, which) -> installApk(activity, downloadedApk));
            } else {
                message = "Version " + name + " has been downloaded and is ready to install.";
                if (info.changelog != null && !info.changelog.trim().isEmpty()) {
                    message += "\n\n" + info.changelog.trim();
                }
                builder.setTitle("Update available")
                        .setMessage(message)
                        .setPositiveButton("Install now", (dialog, which) -> installApk(activity, downloadedApk))
                        .setNegativeButton("Later", (dialog, which) -> dialog.dismiss());
            }
            currentDialog = builder.create();
            currentDialog.show();
        });
    }

    /** Blocking notice shown while a mandatory update is downloading. */
    private static void showForcedDownloading(final Activity activity) {
        activity.runOnUiThread(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            dismissCurrentDialog();
            currentDialog = new AlertDialog.Builder(activity)
                    .setTitle("Update required")
                    .setMessage("Downloading the required update, please wait...")
                    .setCancelable(false)
                    .create();
            currentDialog.show();
        });
    }

    private static void dismissCurrentDialog() {
        if (currentDialog != null) {
            try {
                currentDialog.dismiss();
            } catch (Exception ignored) {
            }
            currentDialog = null;
        }
    }

    private static void installApk(Activity activity, File apk) {
        if (apk == null || !apk.exists()) {
            Log.i(TAG, "No downloaded APK to install");
            return;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                && !activity.getPackageManager().canRequestPackageInstalls()) {
            pendingInstall = true;
            Toast.makeText(activity,
                    "Allow \"Install unknown apps\" for this app, then it will continue",
                    Toast.LENGTH_LONG).show();
            Intent settings = new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                    Uri.parse("package:" + activity.getPackageName()));
            try {
                activity.startActivity(settings);
            } catch (Exception ex) {
                Log.i(TAG, "Cannot open install-permission settings: " + ex.getMessage());
            }
            return;
        }
        try {
            Uri uri = FileProvider.getUriForFile(activity,
                    activity.getPackageName() + ".fileprovider", apk);
            Intent install = new Intent(Intent.ACTION_VIEW);
            install.setDataAndType(uri, "application/vnd.android.package-archive");
            install.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            activity.startActivity(install);
        } catch (Exception ex) {
            Log.i(TAG, "Cannot start package installer: " + ex.getMessage());
            Toast.makeText(activity, "Could not start the installer", Toast.LENGTH_LONG).show();
        }
    }

    private static File getUpdateDir(Activity activity) {
        File base = activity.getExternalFilesDir(null);
        if (base == null) base = activity.getCacheDir();
        File dir = new File(base, "updates");
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    public static int getInstalledVersionCode(Activity activity) {
        try {
            PackageInfo info = activity.getPackageManager()
                    .getPackageInfo(activity.getPackageName(), 0);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                return (int) info.getLongVersionCode();
            }
            return info.versionCode;
        } catch (Exception ex) {
            Log.i(TAG, "Cannot read installed version: " + ex.getMessage());
            return -1;
        }
    }
}
