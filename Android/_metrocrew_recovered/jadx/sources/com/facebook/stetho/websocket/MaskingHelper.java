package com.facebook.stetho.websocket;

/* JADX INFO: loaded from: classes.dex */
class MaskingHelper {
    MaskingHelper() {
    }

    public static void unmask(byte[] key, byte[] data, int offset, int offset2) {
        int index = 0;
        while (true) {
            int count = offset2 - 1;
            if (offset2 > 0) {
                data[offset] = (byte) (key[index % key.length] ^ data[offset]);
                offset++;
                offset2 = count;
                index++;
            } else {
                return;
            }
        }
    }
}
