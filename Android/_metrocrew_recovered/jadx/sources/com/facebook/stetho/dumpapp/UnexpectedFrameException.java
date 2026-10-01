package com.facebook.stetho.dumpapp;

/* JADX INFO: loaded from: classes.dex */
class UnexpectedFrameException extends DumpappFramingException {
    public UnexpectedFrameException(byte expected, byte got) {
        super("Expected '" + ((int) expected) + "', got: '" + ((int) got) + "'");
    }
}
