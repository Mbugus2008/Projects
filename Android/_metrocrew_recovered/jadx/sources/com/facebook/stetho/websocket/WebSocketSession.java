package com.facebook.stetho.websocket;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.UByte;

/* JADX INFO: loaded from: classes.dex */
class WebSocketSession implements SimpleSession {
    private final SimpleEndpoint mEndpoint;
    private final ReadHandler mReadHandler;
    private volatile boolean mSentClose;
    private final WriteHandler mWriteHandler;
    private AtomicBoolean mIsOpen = new AtomicBoolean(false);
    private final ReadCallback mReadCallback = new ReadCallback() { // from class: com.facebook.stetho.websocket.WebSocketSession.1
        @Override // com.facebook.stetho.websocket.ReadCallback
        public void onCompleteFrame(byte opcode, byte[] payload, int payloadLen) {
            switch (opcode) {
                case 1:
                    handleTextFrame(payload, payloadLen);
                    break;
                case 2:
                    handleBinaryFrame(payload, payloadLen);
                    break;
                case 8:
                    handleClose(payload, payloadLen);
                    break;
                case 9:
                    handlePing(payload, payloadLen);
                    break;
                case 10:
                    handlePong(payload, payloadLen);
                    break;
                default:
                    WebSocketSession.this.signalError(new IOException("Unsupported frame opcode=" + ((int) opcode)));
                    break;
            }
        }

        private void handleClose(byte[] payload, int payloadLen) {
            int closeCode;
            String closeReasonPhrase;
            if (payloadLen >= 2) {
                closeCode = ((payload[0] & UByte.MAX_VALUE) << 8) | (payload[1] & UByte.MAX_VALUE);
                closeReasonPhrase = payloadLen > 2 ? new String(payload, 2, payloadLen - 2) : null;
            } else {
                closeCode = 1006;
                closeReasonPhrase = "Unparseable close frame";
            }
            if (!WebSocketSession.this.mSentClose) {
                WebSocketSession.this.sendClose(1000, "Received close frame");
            }
            WebSocketSession.this.markAndSignalClosed(closeCode, closeReasonPhrase);
        }

        private void handlePing(byte[] payload, int payloadLen) {
            WebSocketSession.this.doWrite(FrameHelper.createPongFrame(payload, payloadLen));
        }

        private void handlePong(byte[] payload, int payloadLen) {
        }

        private void handleTextFrame(byte[] payload, int payloadLen) {
            WebSocketSession.this.mEndpoint.onMessage(WebSocketSession.this, new String(payload, 0, payloadLen));
        }

        private void handleBinaryFrame(byte[] payload, int payloadLen) {
            WebSocketSession.this.mEndpoint.onMessage(WebSocketSession.this, payload, payloadLen);
        }
    };
    private final WriteCallback mErrorForwardingWriteCallback = new WriteCallback() { // from class: com.facebook.stetho.websocket.WebSocketSession.2
        @Override // com.facebook.stetho.websocket.WriteCallback
        public void onFailure(IOException e) {
            WebSocketSession.this.signalError(e);
        }

        @Override // com.facebook.stetho.websocket.WriteCallback
        public void onSuccess() {
        }
    };

    public WebSocketSession(InputStream rawSocketInput, OutputStream rawSocketOutput, SimpleEndpoint endpoint) {
        this.mReadHandler = new ReadHandler(rawSocketInput, endpoint);
        this.mWriteHandler = new WriteHandler(rawSocketOutput);
        this.mEndpoint = endpoint;
    }

    public void handle() throws IOException {
        markAndSignalOpen();
        try {
            this.mReadHandler.readLoop(this.mReadCallback);
        } catch (EOFException e) {
            markAndSignalClosed(1011, "EOF while reading");
        } catch (IOException e2) {
            markAndSignalClosed(1006, null);
            throw e2;
        }
    }

    @Override // com.facebook.stetho.websocket.SimpleSession
    public void sendText(String payload) {
        doWrite(FrameHelper.createTextFrame(payload));
    }

    @Override // com.facebook.stetho.websocket.SimpleSession
    public void sendBinary(byte[] payload) {
        doWrite(FrameHelper.createBinaryFrame(payload));
    }

    @Override // com.facebook.stetho.websocket.SimpleSession
    public void close(int closeReason, String reasonPhrase) {
        sendClose(closeReason, reasonPhrase);
        markAndSignalClosed(closeReason, reasonPhrase);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendClose(int closeReason, String reasonPhrase) {
        doWrite(FrameHelper.createCloseFrame(closeReason, reasonPhrase));
        markSentClose();
    }

    void markSentClose() {
        this.mSentClose = true;
    }

    void markAndSignalOpen() {
        if (!this.mIsOpen.getAndSet(true)) {
            this.mEndpoint.onOpen(this);
        }
    }

    void markAndSignalClosed(int closeReason, String reasonPhrase) {
        if (this.mIsOpen.getAndSet(false)) {
            this.mEndpoint.onClose(this, closeReason, reasonPhrase);
        }
    }

    @Override // com.facebook.stetho.websocket.SimpleSession
    public boolean isOpen() {
        return this.mIsOpen.get();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doWrite(Frame frame) {
        if (signalErrorIfNotOpen()) {
            return;
        }
        this.mWriteHandler.write(frame, this.mErrorForwardingWriteCallback);
    }

    private boolean signalErrorIfNotOpen() {
        if (!isOpen()) {
            signalError(new IOException("Session is closed"));
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void signalError(IOException e) {
        this.mEndpoint.onError(this, e);
    }
}
