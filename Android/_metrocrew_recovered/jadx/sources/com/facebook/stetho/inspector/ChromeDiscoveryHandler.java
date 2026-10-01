package com.facebook.stetho.inspector;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import androidx.savedstate.serialization.ClassDiscriminatorModeKt;
import com.facebook.stetho.common.ProcessUtil;
import com.facebook.stetho.server.SocketLike;
import com.facebook.stetho.server.http.ExactPathMatcher;
import com.facebook.stetho.server.http.HandlerRegistry;
import com.facebook.stetho.server.http.HttpHandler;
import com.facebook.stetho.server.http.HttpStatus;
import com.facebook.stetho.server.http.LightHttpBody;
import com.facebook.stetho.server.http.LightHttpRequest;
import com.facebook.stetho.server.http.LightHttpResponse;
import javax.annotation.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ChromeDiscoveryHandler implements HttpHandler {
    private static final String PAGE_ID = "1";
    private static final String PATH_ACTIVATE = "/json/activate/1";
    private static final String PATH_PAGE_LIST = "/json";
    private static final String PATH_VERSION = "/json/version";
    private static final String PROTOCOL_VERSION = "1.1";
    private static final String USER_AGENT = "Stetho";
    private static final String WEBKIT_REV = "@188492";
    private static final String WEBKIT_VERSION = "537.36 (@188492)";
    private final Context mContext;
    private final String mInspectorPath;

    @Nullable
    private LightHttpBody mPageListResponse;

    @Nullable
    private LightHttpBody mVersionResponse;

    public ChromeDiscoveryHandler(Context context, String inspectorPath) {
        this.mContext = context;
        this.mInspectorPath = inspectorPath;
    }

    public void register(HandlerRegistry registry) {
        registry.register(new ExactPathMatcher(PATH_PAGE_LIST), this);
        registry.register(new ExactPathMatcher(PATH_VERSION), this);
        registry.register(new ExactPathMatcher(PATH_ACTIVATE), this);
    }

    @Override // com.facebook.stetho.server.http.HttpHandler
    public boolean handleRequest(SocketLike socket, LightHttpRequest request, LightHttpResponse response) {
        String path = request.uri.getPath();
        try {
            if (PATH_VERSION.equals(path)) {
                handleVersion(response);
            } else if (PATH_PAGE_LIST.equals(path)) {
                handlePageList(response);
            } else if (PATH_ACTIVATE.equals(path)) {
                handleActivate(response);
            } else {
                response.code = 501;
                response.reasonPhrase = "Not implemented";
                response.body = LightHttpBody.create("No support for " + path + "\n", "text/plain");
            }
            return true;
        } catch (JSONException e) {
            response.code = HttpStatus.HTTP_INTERNAL_SERVER_ERROR;
            response.reasonPhrase = "Internal server error";
            response.body = LightHttpBody.create(e.toString() + "\n", "text/plain");
            return true;
        }
    }

    private void handleVersion(LightHttpResponse response) throws JSONException {
        if (this.mVersionResponse == null) {
            JSONObject reply = new JSONObject();
            reply.put("WebKit-Version", WEBKIT_VERSION);
            reply.put("User-Agent", USER_AGENT);
            reply.put("Protocol-Version", PROTOCOL_VERSION);
            reply.put("Browser", getAppLabelAndVersion());
            reply.put("Android-Package", this.mContext.getPackageName());
            this.mVersionResponse = LightHttpBody.create(reply.toString(), "application/json");
        }
        setSuccessfulResponse(response, this.mVersionResponse);
    }

    private void handlePageList(LightHttpResponse response) throws JSONException {
        if (this.mPageListResponse == null) {
            JSONArray reply = new JSONArray();
            JSONObject page = new JSONObject();
            page.put(ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY, "app");
            page.put("title", makeTitle());
            page.put("id", PAGE_ID);
            page.put("description", "");
            page.put("webSocketDebuggerUrl", "ws://" + this.mInspectorPath);
            Uri chromeFrontendUrl = new Uri.Builder().scheme("http").authority("chrome-devtools-frontend.appspot.com").appendEncodedPath("serve_rev").appendEncodedPath(WEBKIT_REV).appendEncodedPath("devtools.html").appendQueryParameter("ws", this.mInspectorPath).build();
            page.put("devtoolsFrontendUrl", chromeFrontendUrl.toString());
            reply.put(page);
            this.mPageListResponse = LightHttpBody.create(reply.toString(), "application/json");
        }
        setSuccessfulResponse(response, this.mPageListResponse);
    }

    private String makeTitle() {
        StringBuilder b = new StringBuilder();
        b.append(getAppLabel());
        b.append(" (powered by Stetho)");
        String processName = ProcessUtil.getProcessName();
        int colonIndex = processName.indexOf(58);
        if (colonIndex >= 0) {
            String nonDefaultProcessName = processName.substring(colonIndex);
            b.append(nonDefaultProcessName);
        }
        String nonDefaultProcessName2 = b.toString();
        return nonDefaultProcessName2;
    }

    private void handleActivate(LightHttpResponse response) {
        setSuccessfulResponse(response, LightHttpBody.create("Target activation ignored\n", "text/plain"));
    }

    private static void setSuccessfulResponse(LightHttpResponse response, LightHttpBody body) {
        response.code = 200;
        response.reasonPhrase = "OK";
        response.body = body;
    }

    private String getAppLabelAndVersion() {
        StringBuilder b = new StringBuilder();
        PackageManager pm = this.mContext.getPackageManager();
        b.append(getAppLabel());
        b.append('/');
        try {
            PackageInfo info = pm.getPackageInfo(this.mContext.getPackageName(), 0);
            b.append(info.versionName);
            return b.toString();
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private CharSequence getAppLabel() {
        PackageManager pm = this.mContext.getPackageManager();
        return pm.getApplicationLabel(this.mContext.getApplicationInfo());
    }
}
