package com.facebook.stetho.server;

import android.net.LocalServerSocket;
import android.net.LocalSocket;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.BindException;
import java.net.SocketException;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;
import org.apache.commons.cli.HelpFormatter;

/* JADX INFO: loaded from: classes.dex */
public class LocalSocketServer {
    private static final int MAX_BIND_RETRIES = 2;
    private static final int TIME_BETWEEN_BIND_RETRIES_MS = 1000;
    private static final String WORKER_THREAD_NAME_PREFIX = "StethoWorker";
    private final String mAddress;
    private final String mFriendlyName;
    private Thread mListenerThread;
    private LocalServerSocket mServerSocket;
    private final SocketHandler mSocketHandler;
    private boolean mStopped;
    private final AtomicInteger mThreadId = new AtomicInteger();

    public LocalSocketServer(String friendlyName, String address, SocketHandler socketHandler) {
        this.mFriendlyName = (String) Util.throwIfNull(friendlyName);
        this.mAddress = (String) Util.throwIfNull(address);
        this.mSocketHandler = socketHandler;
    }

    public String getName() {
        return this.mFriendlyName;
    }

    public void run() throws IOException {
        synchronized (this) {
            if (this.mStopped) {
                return;
            }
            this.mListenerThread = Thread.currentThread();
            listenOnAddress(this.mAddress);
        }
    }

    private void listenOnAddress(String address) throws IOException {
        this.mServerSocket = bindToSocket(address);
        LogUtil.i("Listening on @" + address);
        while (!Thread.interrupted()) {
            try {
                LocalSocket socket = this.mServerSocket.accept();
                Thread t = new WorkerThread(socket, this.mSocketHandler);
                t.setName("StethoWorker-" + this.mFriendlyName + HelpFormatter.DEFAULT_OPT_PREFIX + this.mThreadId.incrementAndGet());
                t.setDaemon(true);
                t.start();
            } catch (InterruptedIOException e) {
            } catch (SocketException se) {
                if (!Thread.interrupted()) {
                    LogUtil.w(se, "I/O error");
                } else {
                    LogUtil.i("Server shutdown on @" + address);
                }
            } catch (IOException e2) {
                LogUtil.w(e2, "I/O error initialising connection thread");
            }
        }
        LogUtil.i("Server shutdown on @" + address);
    }

    public void stop() {
        synchronized (this) {
            this.mStopped = true;
            if (this.mListenerThread == null) {
                return;
            }
            this.mListenerThread.interrupt();
            try {
                if (this.mServerSocket != null) {
                    this.mServerSocket.close();
                }
            } catch (IOException e) {
            }
        }
    }

    @Nonnull
    private static LocalServerSocket bindToSocket(String address) throws IOException {
        int retries = 2;
        IOException firstException = null;
        while (true) {
            try {
                if (LogUtil.isLoggable(3)) {
                    LogUtil.d("Trying to bind to @" + address);
                }
                return new LocalServerSocket(address);
            } catch (BindException be) {
                LogUtil.w(be, "Binding error, sleep 1000 ms...");
                if (firstException == null) {
                    firstException = be;
                }
                Util.sleepUninterruptibly(1000L);
                int retries2 = retries - 1;
                if (retries <= 0) {
                    throw firstException;
                }
                retries = retries2;
            }
        }
    }

    private static class WorkerThread extends Thread {
        private final LocalSocket mSocket;
        private final SocketHandler mSocketHandler;

        public WorkerThread(LocalSocket socket, SocketHandler socketHandler) {
            this.mSocket = socket;
            this.mSocketHandler = socketHandler;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            LocalSocket localSocket;
            try {
                try {
                    try {
                        this.mSocketHandler.onAccepted(this.mSocket);
                        localSocket = this.mSocket;
                    } catch (IOException ex) {
                        LogUtil.w("I/O error: %s", ex);
                        localSocket = this.mSocket;
                    }
                    localSocket.close();
                } catch (IOException e) {
                }
            } catch (Throwable th) {
                try {
                    this.mSocket.close();
                } catch (IOException e2) {
                }
                throw th;
            }
        }
    }
}
