package com.facebook.stetho.websocket;

import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
interface WriteCallback {
    void onFailure(IOException iOException);

    void onSuccess();
}
