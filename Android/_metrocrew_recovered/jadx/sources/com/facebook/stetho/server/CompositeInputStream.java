package com.facebook.stetho.server;

import com.facebook.stetho.common.LogUtil;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class CompositeInputStream extends InputStream {
    private int mCurrentIndex;
    private final InputStream[] mStreams;

    public CompositeInputStream(InputStream[] streams) {
        if (streams == null || streams.length < 2) {
            throw new IllegalArgumentException("Streams must be non-null and have more than 1 entry");
        }
        this.mStreams = streams;
        this.mCurrentIndex = 0;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.mStreams[this.mCurrentIndex].available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        closeAll(this.mCurrentIndex);
    }

    private void closeAll(int mostImportantIndex) throws IOException {
        IOException exceptionToThrow = null;
        for (int i = 0; i < this.mStreams.length; i++) {
            try {
                this.mStreams[i].close();
            } catch (IOException e) {
                IOException previousException = exceptionToThrow;
                if (i == mostImportantIndex || exceptionToThrow == null) {
                    exceptionToThrow = e;
                }
                if (previousException != null && previousException != exceptionToThrow) {
                    LogUtil.w(previousException, "Suppressing exception");
                }
            }
        }
    }

    @Override // java.io.InputStream
    public void mark(int readlimit) {
        throw new UnsupportedOperationException();
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        throw new UnsupportedOperationException();
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        int n;
        do {
            n = this.mStreams[this.mCurrentIndex].read(buffer, byteOffset, byteCount);
            if (n != -1) {
                break;
            }
        } while (tryMoveToNextStream());
        return n;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int b;
        do {
            b = this.mStreams[this.mCurrentIndex].read();
            if (b != -1) {
                break;
            }
        } while (tryMoveToNextStream());
        return b;
    }

    private boolean tryMoveToNextStream() {
        if (this.mCurrentIndex + 1 < this.mStreams.length) {
            this.mCurrentIndex++;
            return true;
        }
        return false;
    }

    @Override // java.io.InputStream
    public long skip(long byteCount) throws IOException {
        byte[] buf = new byte[(int) byteCount];
        int n = read(buf);
        if (n >= 0) {
            return n;
        }
        return -1L;
    }
}
