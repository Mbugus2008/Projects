package com.facebook.stetho.server.http;

import com.facebook.stetho.common.Utf8Charset;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* JADX INFO: loaded from: classes.dex */
public abstract class LightHttpBody {
    public abstract int contentLength();

    public abstract String contentType();

    public abstract void writeTo(OutputStream outputStream) throws IOException;

    public static LightHttpBody create(String body, String contentType) {
        try {
            return create(body.getBytes(Utf8Charset.NAME), contentType);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static LightHttpBody create(final byte[] body, final String contentType) {
        return new LightHttpBody() { // from class: com.facebook.stetho.server.http.LightHttpBody.1
            @Override // com.facebook.stetho.server.http.LightHttpBody
            public String contentType() {
                return contentType;
            }

            @Override // com.facebook.stetho.server.http.LightHttpBody
            public int contentLength() {
                return body.length;
            }

            @Override // com.facebook.stetho.server.http.LightHttpBody
            public void writeTo(OutputStream output) throws IOException {
                output.write(body);
            }
        };
    }
}
