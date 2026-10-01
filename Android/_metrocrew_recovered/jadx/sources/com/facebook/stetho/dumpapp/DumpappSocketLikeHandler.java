package com.facebook.stetho.dumpapp;

import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.server.SocketLike;
import com.facebook.stetho.server.SocketLikeHandler;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public class DumpappSocketLikeHandler implements SocketLikeHandler {
    public static final byte[] PROTOCOL_MAGIC = {68, 85, 77, 80};
    public static final int PROTOCOL_VERSION = 1;
    private final Dumper mDumper;

    public DumpappSocketLikeHandler(Dumper dumper) {
        this.mDumper = dumper;
    }

    @Override // com.facebook.stetho.server.SocketLikeHandler
    public void onAccepted(SocketLike socket) throws IOException {
        DataInputStream in = new DataInputStream(socket.getInput());
        establishConversation(in);
        Framer framer = new Framer(in, socket.getOutput());
        String[] args = readArgs(framer);
        dump(this.mDumper, framer, args);
    }

    static void dump(Dumper dumper, Framer framer, String[] args) throws IOException {
        try {
            int exitCode = dumper.dump(framer.getStdin(), framer.getStdout(), framer.getStderr(), args);
            framer.writeExitCode(exitCode);
        } catch (DumpappOutputBrokenException e) {
        }
    }

    private void establishConversation(DataInputStream in) throws IOException {
        byte[] magic = new byte[4];
        in.readFully(magic);
        if (!Arrays.equals(PROTOCOL_MAGIC, magic)) {
            throw logAndThrowProtocolException("Incompatible protocol, are you using an old dumpapp script?");
        }
        int version = in.readInt();
        if (version != 1) {
            throw logAndThrowProtocolException("Expected version=1; got=" + version);
        }
    }

    private static IOException logAndThrowProtocolException(String message) throws IOException {
        LogUtil.w(message);
        throw new IOException(message);
    }

    private String[] readArgs(Framer framer) throws IOException {
        String[] argv;
        synchronized (framer) {
            byte type = framer.readFrameType();
            switch (type) {
                case 33:
                    int argc = framer.readInt();
                    argv = new String[argc];
                    for (int i = 0; i < argc; i++) {
                        argv[i] = framer.readString();
                    }
                    break;
                default:
                    throw new DumpappFramingException("Expected enter frame, got: " + ((int) type));
            }
        }
        return argv;
    }
}
