package androidx.wear.provider;

import android.content.IntentFilter;
import android.content.UriMatcher;
import android.net.Uri;

/* JADX INFO: loaded from: classes.dex */
public class WearableCalendarContract {
    private static final String AUTHORITY = "com.google.android.wearable.provider.calendar";
    public static final Uri CONTENT_URI = Uri.parse("content://com.google.android.wearable.provider.calendar");

    public static void addCalendarAuthorityUri(UriMatcher uriMatcher, String path, int code) {
        uriMatcher.addURI(AUTHORITY, path, code);
    }

    public static void addCalendarDataAuthority(IntentFilter intentFilter, String port) {
        intentFilter.addDataAuthority(AUTHORITY, port);
    }

    public static final class Instances {
        public static final Uri CONTENT_URI = Uri.withAppendedPath(WearableCalendarContract.CONTENT_URI, "instances/when");

        private Instances() {
        }
    }

    public static final class Attendees {
        public static final Uri CONTENT_URI = Uri.withAppendedPath(WearableCalendarContract.CONTENT_URI, "attendees");

        private Attendees() {
        }
    }

    public static final class Reminders {
        public static final Uri CONTENT_URI = Uri.withAppendedPath(WearableCalendarContract.CONTENT_URI, "reminders");

        private Reminders() {
        }
    }

    private WearableCalendarContract() {
    }
}
