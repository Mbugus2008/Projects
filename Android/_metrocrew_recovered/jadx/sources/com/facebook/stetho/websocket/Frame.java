package com.facebook.stetho.websocket;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import kotlin.UByte;
import kotlin.jvm.internal.ByteCompanionObject;

/* JADX INFO: loaded from: classes.dex */
class Frame {
    public static final byte OPCODE_BINARY_FRAME = 2;
    public static final byte OPCODE_CONNECTION_CLOSE = 8;
    public static final byte OPCODE_CONNECTION_PING = 9;
    public static final byte OPCODE_CONNECTION_PONG = 10;
    public static final byte OPCODE_TEXT_FRAME = 1;
    public boolean fin;
    public boolean hasMask;
    public byte[] maskingKey;
    public byte opcode;
    public byte[] payloadData;
    public long payloadLen;
    public boolean rsv1;
    public boolean rsv2;
    public boolean rsv3;

    Frame() {
    }

    public void readFrom(BufferedInputStream input) throws IOException {
        decodeFirstByte(readByteOrThrow(input));
        byte maskAndFirstLengthBits = readByteOrThrow(input);
        this.hasMask = (maskAndFirstLengthBits & ByteCompanionObject.MIN_VALUE) != 0;
        this.payloadLen = decodeLength((byte) (maskAndFirstLengthBits & ByteCompanionObject.MAX_VALUE), input);
        this.maskingKey = this.hasMask ? decodeMaskingKey(input) : null;
        this.payloadData = new byte[(int) this.payloadLen];
        readBytesOrThrow(input, this.payloadData, 0, (int) this.payloadLen);
        MaskingHelper.unmask(this.maskingKey, this.payloadData, 0, (int) this.payloadLen);
    }

    public void writeTo(BufferedOutputStream output) throws IOException {
        output.write(encodeFirstByte());
        byte[] lengthAndMaskBit = encodeLength(this.payloadLen);
        if (this.hasMask) {
            lengthAndMaskBit[0] = (byte) (lengthAndMaskBit[0] | ByteCompanionObject.MIN_VALUE);
        }
        output.write(lengthAndMaskBit, 0, lengthAndMaskBit.length);
        if (this.hasMask) {
            throw new UnsupportedOperationException("Writing masked data not implemented");
        }
        output.write(this.payloadData, 0, (int) this.payloadLen);
    }

    private void decodeFirstByte(byte b) {
        this.fin = (b & ByteCompanionObject.MIN_VALUE) != 0;
        this.rsv1 = (b & 64) != 0;
        this.rsv2 = (b & 32) != 0;
        this.rsv3 = (b & 16) != 0;
        this.opcode = (byte) (b & 15);
    }

    private byte encodeFirstByte() {
        byte b = 0;
        if (this.fin) {
            b = (byte) (0 | 128);
        }
        if (this.rsv1) {
            b = (byte) (b | 64);
        }
        if (this.rsv2) {
            b = (byte) (b | 32);
        }
        if (this.rsv3) {
            b = (byte) (b | 16);
        }
        return (byte) ((this.opcode & 15) | b);
    }

    private long decodeLength(byte firstLenByte, InputStream in) throws IOException {
        if (firstLenByte <= 125) {
            return firstLenByte;
        }
        if (firstLenByte == 126) {
            return ((readByteOrThrow(in) & UByte.MAX_VALUE) << 8) | (readByteOrThrow(in) & UByte.MAX_VALUE);
        }
        if (firstLenByte == 127) {
            long len = 0;
            for (int i = 0; i < 8; i++) {
                len = (len << 8) | ((long) (readByteOrThrow(in) & UByte.MAX_VALUE));
            }
            return len;
        }
        throw new IOException("Unexpected length byte: " + ((int) firstLenByte));
    }

    private static byte[] encodeLength(long len) {
        if (len <= 125) {
            return new byte[]{(byte) len};
        }
        return len <= 65535 ? new byte[]{126, (byte) ((len >> 8) & 255), (byte) (len & 255)} : new byte[]{ByteCompanionObject.MAX_VALUE, (byte) ((len >> 56) & 255), (byte) ((len >> 48) & 255), (byte) ((len >> 40) & 255), (byte) ((len >> 32) & 255), (byte) ((len >> 24) & 255), (byte) ((len >> 16) & 255), (byte) ((len >> 8) & 255), (byte) (255 & len)};
    }

    private static byte[] decodeMaskingKey(InputStream in) throws IOException {
        byte[] key = new byte[4];
        readBytesOrThrow(in, key, 0, key.length);
        return key;
    }

    private static void readBytesOrThrow(InputStream in, byte[] buf, int offset, int count) throws IOException {
        while (count > 0) {
            int n = in.read(buf, offset, count);
            if (n == -1) {
                throw new EOFException();
            }
            count -= n;
            offset += n;
        }
    }

    private static byte readByteOrThrow(InputStream in) throws IOException {
        int b = in.read();
        if (b == -1) {
            throw new EOFException();
        }
        return (byte) b;
    }
}
