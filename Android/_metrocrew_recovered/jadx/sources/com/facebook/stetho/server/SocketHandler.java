package com.facebook.stetho.server;

import android.net.LocalSocket;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public interface SocketHandler {
    void onAccepted(LocalSocket localSocket) throws IOException;
}
