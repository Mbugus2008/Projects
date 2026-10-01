package com.facebook.stetho.websocket;

/* JADX INFO: loaded from: classes.dex */
public interface SimpleSession {
    void close(int i, String str);

    boolean isOpen();

    void sendBinary(byte[] bArr);

    void sendText(String str);
}
