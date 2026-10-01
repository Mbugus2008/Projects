package com.facebook.stetho.server;

import com.facebook.stetho.common.ProcessUtil;

/* JADX INFO: loaded from: classes.dex */
public class AddressNameHelper {
    private static final String PREFIX = "stetho_";

    public static String createCustomAddress(String suffix) {
        return PREFIX + ProcessUtil.getProcessName() + suffix;
    }
}
