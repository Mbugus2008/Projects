package com.facebook.stetho.server.http;

import com.facebook.stetho.server.SocketLike;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public interface HttpHandler {
    boolean handleRequest(SocketLike socketLike, LightHttpRequest lightHttpRequest, LightHttpResponse lightHttpResponse) throws IOException;
}
