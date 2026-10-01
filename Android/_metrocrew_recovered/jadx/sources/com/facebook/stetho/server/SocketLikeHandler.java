package com.facebook.stetho.server;

import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public interface SocketLikeHandler {
    void onAccepted(SocketLike socketLike) throws IOException;
}
