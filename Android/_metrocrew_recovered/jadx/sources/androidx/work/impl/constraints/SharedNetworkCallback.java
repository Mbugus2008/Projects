package androidx.work.impl.constraints;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import androidx.work.Logger;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: WorkConstraintsTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J4\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00130\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00152\u0016\u0010\u001d\u001a\u0012\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011j\u0002`\u0014J\u0018\u0010\u001e\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u0004H\u0016J\u0010\u0010\"\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020 H\u0016J\f\u0010#\u001a\u0004\u0018\u00010\u0004*\u00020\u001bR \u0010\u0003\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0087\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001e\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR,\u0010\u000f\u001a\u001e\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011j\u0002`\u0014\u0012\u0004\u0012\u00020\u00150\u00108\u0002X\u0083\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006$"}, d2 = {"Landroidx/work/impl/constraints/SharedNetworkCallback;", "Landroid/net/ConnectivityManager$NetworkCallback;", "()V", "cachedCapabilities", "Landroid/net/NetworkCapabilities;", "getCachedCapabilities", "()Landroid/net/NetworkCapabilities;", "setCachedCapabilities", "(Landroid/net/NetworkCapabilities;)V", "capabilitiesInitialized", "", "getCapabilitiesInitialized", "()Z", "setCapabilitiesInitialized", "(Z)V", "requests", "", "Lkotlin/Function1;", "Landroidx/work/impl/constraints/ConstraintsState;", "", "Landroidx/work/impl/constraints/OnConstraintState;", "Landroid/net/NetworkRequest;", "requestsLock", "", "addCallback", "Lkotlin/Function0;", "connManager", "Landroid/net/ConnectivityManager;", "networkRequest", "onConstraintState", "onCapabilitiesChanged", "network", "Landroid/net/Network;", "networkCapabilities", "onLost", "getCurrentNetworkCapabilities", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
final class SharedNetworkCallback extends ConnectivityManager.NetworkCallback {
    private static NetworkCapabilities cachedCapabilities;
    private static boolean capabilitiesInitialized;
    public static final SharedNetworkCallback INSTANCE = new SharedNetworkCallback();
    private static final Object requestsLock = new Object();
    private static final Map<Function1<ConstraintsState, Unit>, NetworkRequest> requests = new LinkedHashMap();

    private SharedNetworkCallback() {
    }

    public final NetworkCapabilities getCachedCapabilities() {
        return cachedCapabilities;
    }

    public final void setCachedCapabilities(NetworkCapabilities networkCapabilities) {
        cachedCapabilities = networkCapabilities;
    }

    public final boolean getCapabilitiesInitialized() {
        return capabilitiesInitialized;
    }

    public final void setCapabilitiesInitialized(boolean z) {
        capabilitiesInitialized = z;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        ConstraintsState constraintsNotMet;
        Intrinsics.checkNotNullParameter(network, "network");
        Intrinsics.checkNotNullParameter(networkCapabilities, "networkCapabilities");
        Logger.get().debug(WorkConstraintsTrackerKt.TAG, "NetworkRequestConstraintController onCapabilitiesChanged callback");
        synchronized (requestsLock) {
            cachedCapabilities = networkCapabilities;
            Iterable $this$forEach$iv = requests.entrySet();
            for (Object element$iv : $this$forEach$iv) {
                Map.Entry entry = (Map.Entry) element$iv;
                Function1 onConstraintState = (Function1) entry.getKey();
                NetworkRequest request = (NetworkRequest) entry.getValue();
                if (request.canBeSatisfiedBy(networkCapabilities)) {
                    constraintsNotMet = ConstraintsState.ConstraintsMet.INSTANCE;
                } else {
                    constraintsNotMet = new ConstraintsState.ConstraintsNotMet(7);
                }
                onConstraintState.invoke(constraintsNotMet);
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onLost(Network network) {
        Intrinsics.checkNotNullParameter(network, "network");
        Logger.get().debug(WorkConstraintsTrackerKt.TAG, "NetworkRequestConstraintController onLost callback");
        synchronized (requestsLock) {
            cachedCapabilities = null;
            Iterable $this$forEach$iv = requests.keySet();
            for (Object element$iv : $this$forEach$iv) {
                Function1 it = (Function1) element$iv;
                it.invoke(new ConstraintsState.ConstraintsNotMet(7));
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    public final Function0<Unit> addCallback(final ConnectivityManager connManager, NetworkRequest networkRequest, final Function1<? super ConstraintsState, Unit> onConstraintState) {
        ConstraintsState constraintsNotMet;
        Intrinsics.checkNotNullParameter(connManager, "connManager");
        Intrinsics.checkNotNullParameter(networkRequest, "networkRequest");
        Intrinsics.checkNotNullParameter(onConstraintState, "onConstraintState");
        synchronized (requestsLock) {
            boolean registerCallback = requests.isEmpty();
            requests.put(onConstraintState, networkRequest);
            if (registerCallback) {
                Logger.get().debug(WorkConstraintsTrackerKt.TAG, "NetworkRequestConstraintController register shared callback");
                connManager.registerDefaultNetworkCallback(this);
            }
            Logger.get().debug(WorkConstraintsTrackerKt.TAG, "NetworkRequestConstraintController send initial capabilities");
            NetworkCapabilities currentCapabilities = INSTANCE.getCurrentNetworkCapabilities(connManager);
            if (networkRequest.canBeSatisfiedBy(currentCapabilities)) {
                constraintsNotMet = ConstraintsState.ConstraintsMet.INSTANCE;
            } else {
                constraintsNotMet = new ConstraintsState.ConstraintsNotMet(7);
            }
            onConstraintState.invoke(constraintsNotMet);
            Unit unit = Unit.INSTANCE;
        }
        return new Function0<Unit>() { // from class: androidx.work.impl.constraints.SharedNetworkCallback.addCallback.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
            public final void invoke2() {
                Object obj = SharedNetworkCallback.requestsLock;
                Function1<ConstraintsState, Unit> function1 = onConstraintState;
                ConnectivityManager connectivityManager = connManager;
                SharedNetworkCallback sharedNetworkCallback = this;
                synchronized (obj) {
                    SharedNetworkCallback.requests.remove(function1);
                    if (SharedNetworkCallback.requests.isEmpty()) {
                        Logger.get().debug(WorkConstraintsTrackerKt.TAG, "NetworkRequestConstraintController unregister shared callback");
                        connectivityManager.unregisterNetworkCallback(sharedNetworkCallback);
                        SharedNetworkCallback.INSTANCE.setCachedCapabilities(null);
                        SharedNetworkCallback.INSTANCE.setCapabilitiesInitialized(false);
                    }
                    Unit unit2 = Unit.INSTANCE;
                }
            }
        };
    }

    public final NetworkCapabilities getCurrentNetworkCapabilities(ConnectivityManager $this$getCurrentNetworkCapabilities) {
        Intrinsics.checkNotNullParameter($this$getCurrentNetworkCapabilities, "<this>");
        if (capabilitiesInitialized) {
            return cachedCapabilities;
        }
        cachedCapabilities = $this$getCurrentNetworkCapabilities.getNetworkCapabilities($this$getCurrentNetworkCapabilities.getActiveNetwork());
        capabilitiesInitialized = true;
        return cachedCapabilities;
    }
}
