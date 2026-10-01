package com.facebook.stetho.inspector.network;

import com.facebook.stetho.inspector.console.CLog;
import com.facebook.stetho.inspector.protocol.module.Console;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.InflaterOutputStream;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class DecompressionHelper {
    static final String DEFLATE_ENCODING = "deflate";
    static final String GZIP_ENCODING = "gzip";

    public static InputStream teeInputWithDecompression(NetworkPeerManager peerManager, String requestId, InputStream availableInputStream, OutputStream decompressedOutput, @Nullable String contentEncoding, ResponseHandler responseHandler) throws IOException {
        OutputStream output;
        CountingOutputStream decompressedCounter;
        if (contentEncoding != null) {
            boolean gzipEncoding = GZIP_ENCODING.equals(contentEncoding);
            boolean deflateEncoding = DEFLATE_ENCODING.equals(contentEncoding);
            if (!gzipEncoding && !deflateEncoding) {
                requestId = requestId;
                CLog.writeToConsole(peerManager, Console.MessageLevel.WARNING, Console.MessageSource.NETWORK, "Unsupported Content-Encoding in response for request #" + requestId + ": " + contentEncoding);
            } else {
                CountingOutputStream decompressedCounter2 = new CountingOutputStream(decompressedOutput);
                if (gzipEncoding) {
                    OutputStream output2 = GunzippingOutputStream.create(decompressedCounter2);
                    output = output2;
                    decompressedCounter = decompressedCounter2;
                } else if (!deflateEncoding) {
                    output = decompressedOutput;
                    decompressedCounter = decompressedCounter2;
                } else {
                    OutputStream output3 = new InflaterOutputStream(decompressedCounter2);
                    output = output3;
                    decompressedCounter = decompressedCounter2;
                }
                return new ResponseHandlingInputStream(availableInputStream, requestId, output, decompressedCounter, peerManager, responseHandler);
            }
        } else {
            requestId = requestId;
        }
        output = decompressedOutput;
        decompressedCounter = null;
        return new ResponseHandlingInputStream(availableInputStream, requestId, output, decompressedCounter, peerManager, responseHandler);
    }
}
