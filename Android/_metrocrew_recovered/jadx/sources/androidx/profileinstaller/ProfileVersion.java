package androidx.profileinstaller;

import com.facebook.stetho.dumpapp.Framer;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public class ProfileVersion {
    public static final int MIN_SUPPORTED_SDK = 24;
    static final byte[] V015_S = {48, Framer.STDOUT_FRAME_PREFIX, 53, 0};
    static final byte[] V010_P = {48, Framer.STDOUT_FRAME_PREFIX, 48, 0};
    static final byte[] V009_O_MR1 = {48, 48, 57, 0};
    static final byte[] V005_O = {48, 48, 53, 0};
    static final byte[] V001_N = {48, 48, Framer.STDOUT_FRAME_PREFIX, 0};
    static final byte[] METADATA_V001_N = {48, 48, Framer.STDOUT_FRAME_PREFIX, 0};
    static final byte[] METADATA_V002 = {48, 48, Framer.STDERR_FRAME_PREFIX, 0};

    private ProfileVersion() {
    }

    static String dexKeySeparator(byte[] version) {
        return (Arrays.equals(version, V001_N) || Arrays.equals(version, V005_O)) ? ":" : "!";
    }
}
