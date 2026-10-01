package androidx.wear.ambient;

import androidx.lifecycle.DefaultLifecycleObserver;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: AmbientLifecycleObserver.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\bf\u0018\u00002\u00020\u0001:\u0002\u0005\u0006R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0004ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0007À\u0006\u0001"}, d2 = {"Landroidx/wear/ambient/AmbientLifecycleObserver;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "isAmbient", "", "()Z", "AmbientDetails", "AmbientLifecycleCallback", "wear_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public interface AmbientLifecycleObserver extends DefaultLifecycleObserver {
    boolean isAmbient();

    /* JADX INFO: compiled from: AmbientLifecycleObserver.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0002\u0010\u0005J\b\u0010\t\u001a\u00020\nH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0007¨\u0006\u000b"}, d2 = {"Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;", "", "burnInProtectionRequired", "", "deviceHasLowBitAmbient", "(ZZ)V", "getBurnInProtectionRequired", "()Z", "getDeviceHasLowBitAmbient", "toString", "", "wear_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public static final class AmbientDetails {
        private final boolean burnInProtectionRequired;
        private final boolean deviceHasLowBitAmbient;

        public AmbientDetails(boolean burnInProtectionRequired, boolean deviceHasLowBitAmbient) {
            this.burnInProtectionRequired = burnInProtectionRequired;
            this.deviceHasLowBitAmbient = deviceHasLowBitAmbient;
        }

        public final boolean getBurnInProtectionRequired() {
            return this.burnInProtectionRequired;
        }

        public final boolean getDeviceHasLowBitAmbient() {
            return this.deviceHasLowBitAmbient;
        }

        public String toString() {
            return "AmbientDetails - burnInProtectionRequired: " + this.burnInProtectionRequired + ", deviceHasLowBitAmbient: " + this.deviceHasLowBitAmbient;
        }
    }

    /* JADX INFO: compiled from: AmbientLifecycleObserver.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\b\u0010\u0006\u001a\u00020\u0003H\u0016J\b\u0010\u0007\u001a\u00020\u0003H\u0016ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\bÀ\u0006\u0001"}, d2 = {"Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;", "", "onEnterAmbient", "", "ambientDetails", "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;", "onExitAmbient", "onUpdateAmbient", "wear_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public interface AmbientLifecycleCallback {
        default void onEnterAmbient(AmbientDetails ambientDetails) {
            Intrinsics.checkNotNullParameter(ambientDetails, "ambientDetails");
        }

        default void onUpdateAmbient() {
        }

        default void onExitAmbient() {
        }
    }
}
