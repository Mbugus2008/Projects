package com.facebook.stetho.inspector;

import android.content.Context;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.server.SocketLike;
import com.facebook.stetho.server.SocketLikeHandler;
import com.facebook.stetho.server.http.ExactPathMatcher;
import com.facebook.stetho.server.http.HandlerRegistry;
import com.facebook.stetho.server.http.LightHttpServer;
import com.facebook.stetho.websocket.WebSocketHandler;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class DevtoolsSocketHandler implements SocketLikeHandler {
    private final Context mContext;
    private final Iterable<ChromeDevtoolsDomain> mModules;
    private final LightHttpServer mServer = createServer();

    public DevtoolsSocketHandler(Context context, Iterable<ChromeDevtoolsDomain> modules) {
        this.mContext = context;
        this.mModules = modules;
    }

    private LightHttpServer createServer() {
        HandlerRegistry registry = new HandlerRegistry();
        ChromeDiscoveryHandler discoveryHandler = new ChromeDiscoveryHandler(this.mContext, ChromeDevtoolsServer.PATH);
        discoveryHandler.register(registry);
        registry.register(new ExactPathMatcher(ChromeDevtoolsServer.PATH), new WebSocketHandler(new ChromeDevtoolsServer(this.mModules)));
        return new LightHttpServer(registry);
    }

    @Override // com.facebook.stetho.server.SocketLikeHandler
    public void onAccepted(SocketLike socket) throws IOException {
        this.mServer.serve(socket);
    }
}
