package com.facebook.stetho.common;

import java.io.FileInputStream;
import java.io.IOException;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class ProcessUtil {
    private static final int CMDLINE_BUFFER_SIZE = 64;
    private static String sProcessName;
    private static boolean sProcessNameRead;

    @Nullable
    public static synchronized String getProcessName() {
        if (!sProcessNameRead) {
            sProcessNameRead = true;
            try {
                sProcessName = readProcessName();
            } catch (IOException e) {
            }
        }
        return sProcessName;
    }

    private static String readProcessName() throws IOException {
        byte[] cmdlineBuffer = new byte[64];
        FileInputStream stream = new FileInputStream("/proc/self/cmdline");
        boolean success = false;
        try {
            int n = stream.read(cmdlineBuffer);
            success = true;
            int endIndex = indexOf(cmdlineBuffer, 0, n, (byte) 0);
            return new String(cmdlineBuffer, 0, endIndex > 0 ? endIndex : n);
        } finally {
            Util.close(stream, !success);
        }
    }

    private static int indexOf(byte[] haystack, int offset, int length, byte needle) {
        for (int i = 0; i < haystack.length; i++) {
            if (haystack[i] == needle) {
                return i;
            }
        }
        return -1;
    }
}
