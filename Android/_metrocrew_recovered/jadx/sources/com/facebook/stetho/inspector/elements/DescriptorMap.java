package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Util;
import java.util.IdentityHashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public final class DescriptorMap implements DescriptorRegistrar {
    private Descriptor.Host mHost;
    private boolean mIsInitializing;
    private final Map<Class<?>, Descriptor> mMap = new IdentityHashMap();

    @Override // com.facebook.stetho.inspector.elements.DescriptorRegistrar
    public /* bridge */ /* synthetic */ DescriptorRegistrar registerDescriptor(Class cls, Descriptor descriptor) {
        return registerDescriptor((Class<?>) cls, descriptor);
    }

    public DescriptorMap beginInit() {
        Util.throwIf(this.mIsInitializing);
        this.mIsInitializing = true;
        return this;
    }

    @Override // com.facebook.stetho.inspector.elements.DescriptorRegistrar
    public DescriptorMap registerDescriptor(Class<?> elementClass, Descriptor descriptor) {
        Util.throwIfNull(elementClass);
        Util.throwIfNull(descriptor);
        Util.throwIf(descriptor.isInitialized());
        Util.throwIfNot(this.mIsInitializing);
        if (this.mMap.containsKey(elementClass)) {
            throw new UnsupportedOperationException();
        }
        if (this.mMap.containsValue(descriptor)) {
            throw new UnsupportedOperationException();
        }
        this.mMap.put(elementClass, descriptor);
        return this;
    }

    public DescriptorMap setHost(Descriptor.Host host) {
        Util.throwIfNull(host);
        Util.throwIfNot(this.mIsInitializing);
        Util.throwIfNotNull(this.mHost);
        this.mHost = host;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public DescriptorMap endInit() {
        Util.throwIfNot(this.mIsInitializing);
        Util.throwIfNull(this.mHost);
        this.mIsInitializing = false;
        for (Class<?> elementClass : this.mMap.keySet()) {
            Descriptor descriptor = this.mMap.get(elementClass);
            if (descriptor instanceof ChainedDescriptor) {
                ChainedDescriptor chainedDescriptor = (ChainedDescriptor) descriptor;
                Class<?> superClass = elementClass.getSuperclass();
                Descriptor superDescriptor = getImpl(superClass);
                chainedDescriptor.setSuper(superDescriptor);
            }
            descriptor.initialize(this.mHost);
        }
        return this;
    }

    @Nullable
    public Descriptor get(Class<?> elementClass) {
        Util.throwIfNull(elementClass);
        Util.throwIf(this.mIsInitializing);
        return getImpl(elementClass);
    }

    @Nullable
    private Descriptor getImpl(Class<?> elementClass) {
        for (Class<?> theClass = elementClass; theClass != null; theClass = theClass.getSuperclass()) {
            Descriptor descriptor = this.mMap.get(theClass);
            if (descriptor != null) {
                return descriptor;
            }
        }
        return null;
    }
}
