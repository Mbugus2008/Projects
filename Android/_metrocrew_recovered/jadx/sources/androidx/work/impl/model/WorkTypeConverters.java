package androidx.work.impl.model;

import android.net.NetworkRequest;
import android.net.Uri;
import android.os.Build;
import androidx.work.BackoffPolicy;
import androidx.work.Constraints;
import androidx.work.NetworkType;
import androidx.work.OutOfQuotaPolicy;
import androidx.work.WorkInfo;
import androidx.work.impl.utils.NetworkRequest28;
import androidx.work.impl.utils.NetworkRequestCompat;
import androidx.work.impl.utils.NetworkRequestCompatKt;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.debug.internal.DebugCoroutineInfoImplKt;

/* JADX INFO: compiled from: WorkTypeConverters.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\"#$%B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0016\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0015\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000eH\u0001¢\u0006\u0002\b\u000fJ\u0010\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u0004H\u0007J\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0011\u001a\u00020\u0004H\u0007J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u0004H\u0007J\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0011\u001a\u00020\u0004H\u0007J\u0010\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0019\u001a\u00020\u0013H\u0007J\u0010\u0010\u001a\u001a\u00020\u00042\u0006\u0010\u001b\u001a\u00020\u0015H\u0007J\u0016\u0010\u001c\u001a\u00020\u000b2\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\t0\bH\u0007J\u0010\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u001f\u001a\u00020\u0017H\u0007J\u0015\u0010 \u001a\u00020\u000e2\u0006\u0010\n\u001a\u00020\u000bH\u0001¢\u0006\u0002\b!¨\u0006&"}, d2 = {"Landroidx/work/impl/model/WorkTypeConverters;", "", "()V", "backoffPolicyToInt", "", "backoffPolicy", "Landroidx/work/BackoffPolicy;", "byteArrayToSetOfTriggers", "", "Landroidx/work/Constraints$ContentUriTrigger;", "bytes", "", "fromNetworkRequest", "requestCompat", "Landroidx/work/impl/utils/NetworkRequestCompat;", "fromNetworkRequest$work_runtime_release", "intToBackoffPolicy", "value", "intToNetworkType", "Landroidx/work/NetworkType;", "intToOutOfQuotaPolicy", "Landroidx/work/OutOfQuotaPolicy;", "intToState", "Landroidx/work/WorkInfo$State;", "networkTypeToInt", "networkType", "outOfQuotaPolicyToInt", "policy", "setOfTriggersToByteArray", "triggers", "stateToInt", "state", "toNetworkRequest", "toNetworkRequest$work_runtime_release", "BackoffPolicyIds", "NetworkTypeIds", "OutOfPolicyIds", "StateIds", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class WorkTypeConverters {
    public static final WorkTypeConverters INSTANCE = new WorkTypeConverters();

    /* JADX INFO: compiled from: WorkTypeConverters.kt */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;
        public static final /* synthetic */ int[] $EnumSwitchMapping$2;
        public static final /* synthetic */ int[] $EnumSwitchMapping$3;

        static {
            int[] iArr = new int[WorkInfo.State.values().length];
            try {
                iArr[WorkInfo.State.ENQUEUED.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[WorkInfo.State.RUNNING.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[WorkInfo.State.SUCCEEDED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[WorkInfo.State.FAILED.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[WorkInfo.State.BLOCKED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr[WorkInfo.State.CANCELLED.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[BackoffPolicy.values().length];
            try {
                iArr2[BackoffPolicy.EXPONENTIAL.ordinal()] = 1;
            } catch (NoSuchFieldError e7) {
            }
            try {
                iArr2[BackoffPolicy.LINEAR.ordinal()] = 2;
            } catch (NoSuchFieldError e8) {
            }
            $EnumSwitchMapping$1 = iArr2;
            int[] iArr3 = new int[NetworkType.values().length];
            try {
                iArr3[NetworkType.NOT_REQUIRED.ordinal()] = 1;
            } catch (NoSuchFieldError e9) {
            }
            try {
                iArr3[NetworkType.CONNECTED.ordinal()] = 2;
            } catch (NoSuchFieldError e10) {
            }
            try {
                iArr3[NetworkType.UNMETERED.ordinal()] = 3;
            } catch (NoSuchFieldError e11) {
            }
            try {
                iArr3[NetworkType.NOT_ROAMING.ordinal()] = 4;
            } catch (NoSuchFieldError e12) {
            }
            try {
                iArr3[NetworkType.METERED.ordinal()] = 5;
            } catch (NoSuchFieldError e13) {
            }
            $EnumSwitchMapping$2 = iArr3;
            int[] iArr4 = new int[OutOfQuotaPolicy.values().length];
            try {
                iArr4[OutOfQuotaPolicy.RUN_AS_NON_EXPEDITED_WORK_REQUEST.ordinal()] = 1;
            } catch (NoSuchFieldError e14) {
            }
            try {
                iArr4[OutOfQuotaPolicy.DROP_WORK_REQUEST.ordinal()] = 2;
            } catch (NoSuchFieldError e15) {
            }
            $EnumSwitchMapping$3 = iArr4;
        }
    }

    private WorkTypeConverters() {
    }

    /* JADX INFO: compiled from: WorkTypeConverters.kt */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Landroidx/work/impl/model/WorkTypeConverters$StateIds;", "", "()V", "BLOCKED", "", "CANCELLED", "COMPLETED_STATES", "", "ENQUEUED", "FAILED", DebugCoroutineInfoImplKt.RUNNING, "SUCCEEDED", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public static final class StateIds {
        public static final int BLOCKED = 4;
        public static final int CANCELLED = 5;
        public static final String COMPLETED_STATES = "(2, 3, 5)";
        public static final int ENQUEUED = 0;
        public static final int FAILED = 3;
        public static final StateIds INSTANCE = new StateIds();
        public static final int RUNNING = 1;
        public static final int SUCCEEDED = 2;

        private StateIds() {
        }
    }

    /* JADX INFO: compiled from: WorkTypeConverters.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\bÂ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/work/impl/model/WorkTypeConverters$BackoffPolicyIds;", "", "()V", "EXPONENTIAL", "", "LINEAR", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    private static final class BackoffPolicyIds {
        public static final int EXPONENTIAL = 0;
        public static final BackoffPolicyIds INSTANCE = new BackoffPolicyIds();
        public static final int LINEAR = 1;

        private BackoffPolicyIds() {
        }
    }

    /* JADX INFO: compiled from: WorkTypeConverters.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\bÂ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Landroidx/work/impl/model/WorkTypeConverters$NetworkTypeIds;", "", "()V", "CONNECTED", "", "METERED", "NOT_REQUIRED", "NOT_ROAMING", "TEMPORARILY_UNMETERED", "UNMETERED", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    private static final class NetworkTypeIds {
        public static final int CONNECTED = 1;
        public static final NetworkTypeIds INSTANCE = new NetworkTypeIds();
        public static final int METERED = 4;
        public static final int NOT_REQUIRED = 0;
        public static final int NOT_ROAMING = 3;
        public static final int TEMPORARILY_UNMETERED = 5;
        public static final int UNMETERED = 2;

        private NetworkTypeIds() {
        }
    }

    /* JADX INFO: compiled from: WorkTypeConverters.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\bÂ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/work/impl/model/WorkTypeConverters$OutOfPolicyIds;", "", "()V", "DROP_WORK_REQUEST", "", "RUN_AS_NON_EXPEDITED_WORK_REQUEST", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    private static final class OutOfPolicyIds {
        public static final int DROP_WORK_REQUEST = 1;
        public static final OutOfPolicyIds INSTANCE = new OutOfPolicyIds();
        public static final int RUN_AS_NON_EXPEDITED_WORK_REQUEST = 0;

        private OutOfPolicyIds() {
        }
    }

    @JvmStatic
    public static final int stateToInt(WorkInfo.State state) {
        Intrinsics.checkNotNullParameter(state, "state");
        switch (WhenMappings.$EnumSwitchMapping$0[state.ordinal()]) {
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 4;
            case 6:
                return 5;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @JvmStatic
    public static final WorkInfo.State intToState(int value) {
        switch (value) {
            case 0:
                return WorkInfo.State.ENQUEUED;
            case 1:
                return WorkInfo.State.RUNNING;
            case 2:
                return WorkInfo.State.SUCCEEDED;
            case 3:
                return WorkInfo.State.FAILED;
            case 4:
                return WorkInfo.State.BLOCKED;
            case 5:
                return WorkInfo.State.CANCELLED;
            default:
                throw new IllegalArgumentException("Could not convert " + value + " to State");
        }
    }

    @JvmStatic
    public static final int backoffPolicyToInt(BackoffPolicy backoffPolicy) {
        Intrinsics.checkNotNullParameter(backoffPolicy, "backoffPolicy");
        switch (WhenMappings.$EnumSwitchMapping$1[backoffPolicy.ordinal()]) {
            case 1:
                return 0;
            case 2:
                return 1;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @JvmStatic
    public static final BackoffPolicy intToBackoffPolicy(int value) {
        switch (value) {
            case 0:
                return BackoffPolicy.EXPONENTIAL;
            case 1:
                return BackoffPolicy.LINEAR;
            default:
                throw new IllegalArgumentException("Could not convert " + value + " to BackoffPolicy");
        }
    }

    @JvmStatic
    public static final int networkTypeToInt(NetworkType networkType) {
        Intrinsics.checkNotNullParameter(networkType, "networkType");
        switch (WhenMappings.$EnumSwitchMapping$2[networkType.ordinal()]) {
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 4;
            default:
                if (Build.VERSION.SDK_INT >= 30 && networkType == NetworkType.TEMPORARILY_UNMETERED) {
                    return 5;
                }
                throw new IllegalArgumentException("Could not convert " + networkType + " to int");
        }
    }

    @JvmStatic
    public static final NetworkType intToNetworkType(int value) {
        switch (value) {
            case 0:
                return NetworkType.NOT_REQUIRED;
            case 1:
                return NetworkType.CONNECTED;
            case 2:
                return NetworkType.UNMETERED;
            case 3:
                return NetworkType.NOT_ROAMING;
            case 4:
                return NetworkType.METERED;
            default:
                if (Build.VERSION.SDK_INT >= 30 && value == 5) {
                    return NetworkType.TEMPORARILY_UNMETERED;
                }
                throw new IllegalArgumentException("Could not convert " + value + " to NetworkType");
        }
    }

    @JvmStatic
    public static final int outOfQuotaPolicyToInt(OutOfQuotaPolicy policy) {
        Intrinsics.checkNotNullParameter(policy, "policy");
        switch (WhenMappings.$EnumSwitchMapping$3[policy.ordinal()]) {
            case 1:
                return 0;
            case 2:
                return 1;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @JvmStatic
    public static final OutOfQuotaPolicy intToOutOfQuotaPolicy(int value) {
        switch (value) {
            case 0:
                return OutOfQuotaPolicy.RUN_AS_NON_EXPEDITED_WORK_REQUEST;
            case 1:
                return OutOfQuotaPolicy.DROP_WORK_REQUEST;
            default:
                throw new IllegalArgumentException("Could not convert " + value + " to OutOfQuotaPolicy");
        }
    }

    @JvmStatic
    public static final byte[] setOfTriggersToByteArray(Set<Constraints.ContentUriTrigger> triggers) {
        Intrinsics.checkNotNullParameter(triggers, "triggers");
        if (triggers.isEmpty()) {
            return new byte[0];
        }
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ByteArrayOutputStream byteArrayOutputStream = outputStream;
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);
            try {
                ObjectOutputStream objectOutputStream2 = objectOutputStream;
                objectOutputStream2.writeInt(triggers.size());
                for (Constraints.ContentUriTrigger trigger : triggers) {
                    objectOutputStream2.writeUTF(trigger.getUri().toString());
                    objectOutputStream2.writeBoolean(trigger.getIsTriggeredForDescendants());
                }
                Unit unit = Unit.INSTANCE;
                CloseableKt.closeFinally(objectOutputStream, null);
                Unit unit2 = Unit.INSTANCE;
                CloseableKt.closeFinally(byteArrayOutputStream, null);
                byte[] byteArray = outputStream.toByteArray();
                Intrinsics.checkNotNullExpressionValue(byteArray, "outputStream.toByteArray()");
                return byteArray;
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    CloseableKt.closeFinally(objectOutputStream, th);
                    throw th2;
                }
            }
        } catch (Throwable th3) {
            try {
                throw th3;
            } catch (Throwable th4) {
                CloseableKt.closeFinally(byteArrayOutputStream, th3);
                throw th4;
            }
        }
    }

    @JvmStatic
    public static final Set<Constraints.ContentUriTrigger> byteArrayToSetOfTriggers(byte[] bytes) {
        Intrinsics.checkNotNullParameter(bytes, "bytes");
        Set triggers = new LinkedHashSet();
        int i = 0;
        if (bytes.length == 0) {
            return triggers;
        }
        ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
        ByteArrayInputStream byteArrayInputStream = inputStream;
        try {
            try {
                ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);
                try {
                    ObjectInputStream objectInputStream2 = objectInputStream;
                    int i2 = objectInputStream2.readInt();
                    while (i < i2) {
                        Uri uri = Uri.parse(objectInputStream2.readUTF());
                        boolean triggersForDescendants = objectInputStream2.readBoolean();
                        Intrinsics.checkNotNullExpressionValue(uri, "uri");
                        triggers.add(new Constraints.ContentUriTrigger(uri, triggersForDescendants));
                        i++;
                        objectInputStream2 = objectInputStream2;
                    }
                    Unit unit = Unit.INSTANCE;
                    CloseableKt.closeFinally(objectInputStream, null);
                    Unit unit2 = Unit.INSTANCE;
                    CloseableKt.closeFinally(byteArrayInputStream, null);
                    return triggers;
                } catch (Throwable th) {
                    try {
                        throw th;
                    } catch (Throwable th2) {
                        CloseableKt.closeFinally(objectInputStream, th);
                        throw th2;
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (Throwable th3) {
            try {
                throw th3;
            } catch (Throwable th4) {
                CloseableKt.closeFinally(byteArrayInputStream, th3);
                throw th4;
            }
        }
    }

    @JvmStatic
    public static final NetworkRequestCompat toNetworkRequest$work_runtime_release(byte[] bytes) {
        Intrinsics.checkNotNullParameter(bytes, "bytes");
        if (Build.VERSION.SDK_INT >= 28) {
            if (!(bytes.length == 0)) {
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
                try {
                    ByteArrayInputStream it = byteArrayInputStream;
                    ObjectInputStream objectInputStream = new ObjectInputStream(it);
                    try {
                        ObjectInputStream inputStream = objectInputStream;
                        int[] transports = new int[inputStream.readInt()];
                        int length = transports.length;
                        for (int i = 0; i < length; i++) {
                            int i2 = i;
                            transports[i2] = inputStream.readInt();
                        }
                        int[] capabilities = new int[inputStream.readInt()];
                        int length2 = capabilities.length;
                        for (int i3 = 0; i3 < length2; i3++) {
                            int i4 = i3;
                            capabilities[i4] = inputStream.readInt();
                        }
                        NetworkRequestCompat networkRequestCompatCreateNetworkRequestCompat$work_runtime_release = NetworkRequest28.INSTANCE.createNetworkRequestCompat$work_runtime_release(capabilities, transports);
                        CloseableKt.closeFinally(objectInputStream, null);
                        CloseableKt.closeFinally(byteArrayInputStream, null);
                        return networkRequestCompatCreateNetworkRequestCompat$work_runtime_release;
                    } catch (Throwable th) {
                        try {
                            throw th;
                        } catch (Throwable th2) {
                            CloseableKt.closeFinally(objectInputStream, th);
                            throw th2;
                        }
                    }
                } catch (Throwable th3) {
                    try {
                        throw th3;
                    } catch (Throwable th4) {
                        CloseableKt.closeFinally(byteArrayInputStream, th3);
                        throw th4;
                    }
                }
            }
        }
        return new NetworkRequestCompat(null);
    }

    @JvmStatic
    public static final byte[] fromNetworkRequest$work_runtime_release(NetworkRequestCompat requestCompat) {
        Intrinsics.checkNotNullParameter(requestCompat, "requestCompat");
        if (Build.VERSION.SDK_INT < 28) {
            return new byte[0];
        }
        NetworkRequest request = requestCompat.getNetworkRequest();
        if (request == null) {
            return new byte[0];
        }
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ByteArrayOutputStream byteArrayOutputStream = outputStream;
        try {
            ByteArrayOutputStream it = byteArrayOutputStream;
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(it);
            try {
                ObjectOutputStream outputStream2 = objectOutputStream;
                int[] transports = NetworkRequestCompatKt.getTransportTypesCompat(request);
                int[] capabilities = NetworkRequestCompatKt.getCapabilitiesCompat(request);
                outputStream2.writeInt(transports.length);
                for (int element$iv : transports) {
                    outputStream2.writeInt(element$iv);
                }
                outputStream2.writeInt(capabilities.length);
                for (int element$iv2 : capabilities) {
                    outputStream2.writeInt(element$iv2);
                }
                Unit unit = Unit.INSTANCE;
                CloseableKt.closeFinally(objectOutputStream, null);
                Unit unit2 = Unit.INSTANCE;
                CloseableKt.closeFinally(byteArrayOutputStream, null);
                byte[] byteArray = outputStream.toByteArray();
                Intrinsics.checkNotNullExpressionValue(byteArray, "outputStream.toByteArray()");
                return byteArray;
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    CloseableKt.closeFinally(objectOutputStream, th);
                    throw th2;
                }
            }
        } catch (Throwable th3) {
            try {
                throw th3;
            } catch (Throwable th4) {
                CloseableKt.closeFinally(byteArrayOutputStream, th3);
                throw th4;
            }
        }
    }
}
