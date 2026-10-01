package androidx.work.multiprocess;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import kotlin.text.Typography;

/* JADX INFO: loaded from: classes.dex */
public interface IWorkManagerImpl extends IInterface {
    public static final String DESCRIPTOR = "androidx$work$multiprocess$IWorkManagerImpl".replace(Typography.dollar, '.');

    void cancelAllWork(IWorkManagerImplCallback callback) throws RemoteException;

    void cancelAllWorkByTag(String tag, IWorkManagerImplCallback callback) throws RemoteException;

    void cancelUniqueWork(String name, IWorkManagerImplCallback callback) throws RemoteException;

    void cancelWorkById(String id, IWorkManagerImplCallback callback) throws RemoteException;

    void enqueueContinuation(byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    void enqueueWorkRequests(byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    void queryWorkInfo(byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    void setForegroundAsync(byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    void setProgress(byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    void updateUniquePeriodicWorkRequest(String name, byte[] request, IWorkManagerImplCallback callback) throws RemoteException;

    public static class Default implements IWorkManagerImpl {
        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void enqueueWorkRequests(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void updateUniquePeriodicWorkRequest(String name, byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void enqueueContinuation(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void cancelWorkById(String id, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void cancelAllWorkByTag(String tag, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void cancelUniqueWork(String name, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void cancelAllWork(IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void queryWorkInfo(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void setProgress(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // androidx.work.multiprocess.IWorkManagerImpl
        public void setForegroundAsync(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }
    }

    public static abstract class Stub extends Binder implements IWorkManagerImpl {
        static final int TRANSACTION_cancelAllWork = 7;
        static final int TRANSACTION_cancelAllWorkByTag = 5;
        static final int TRANSACTION_cancelUniqueWork = 6;
        static final int TRANSACTION_cancelWorkById = 4;
        static final int TRANSACTION_enqueueContinuation = 3;
        static final int TRANSACTION_enqueueWorkRequests = 1;
        static final int TRANSACTION_queryWorkInfo = 8;
        static final int TRANSACTION_setForegroundAsync = 10;
        static final int TRANSACTION_setProgress = 9;
        static final int TRANSACTION_updateUniquePeriodicWorkRequest = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IWorkManagerImpl asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IWorkManagerImpl)) {
                return (IWorkManagerImpl) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            String descriptor = DESCRIPTOR;
            if (code >= 1 && code <= 16777215) {
                data.enforceInterface(descriptor);
            }
            if (code == 1598968902) {
                reply.writeString(descriptor);
                return true;
            }
            switch (code) {
                case 1:
                    byte[] _arg0 = data.createByteArray();
                    IWorkManagerImplCallback _arg1 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    enqueueWorkRequests(_arg0, _arg1);
                    return true;
                case 2:
                    String _arg2 = data.readString();
                    byte[] _arg3 = data.createByteArray();
                    IWorkManagerImplCallback _arg4 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    updateUniquePeriodicWorkRequest(_arg2, _arg3, _arg4);
                    return true;
                case 3:
                    byte[] _arg5 = data.createByteArray();
                    IWorkManagerImplCallback _arg6 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    enqueueContinuation(_arg5, _arg6);
                    return true;
                case 4:
                    String _arg7 = data.readString();
                    IWorkManagerImplCallback _arg8 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    cancelWorkById(_arg7, _arg8);
                    return true;
                case 5:
                    String _arg9 = data.readString();
                    IWorkManagerImplCallback _arg10 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    cancelAllWorkByTag(_arg9, _arg10);
                    return true;
                case 6:
                    String _arg11 = data.readString();
                    IWorkManagerImplCallback _arg12 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    cancelUniqueWork(_arg11, _arg12);
                    return true;
                case 7:
                    IWorkManagerImplCallback _arg13 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    cancelAllWork(_arg13);
                    return true;
                case 8:
                    byte[] _arg14 = data.createByteArray();
                    IWorkManagerImplCallback _arg15 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    queryWorkInfo(_arg14, _arg15);
                    return true;
                case 9:
                    byte[] _arg16 = data.createByteArray();
                    IWorkManagerImplCallback _arg17 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    setProgress(_arg16, _arg17);
                    return true;
                case 10:
                    byte[] _arg18 = data.createByteArray();
                    IWorkManagerImplCallback _arg19 = IWorkManagerImplCallback.Stub.asInterface(data.readStrongBinder());
                    setForegroundAsync(_arg18, _arg19);
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }

        private static class Proxy implements IWorkManagerImpl {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return DESCRIPTOR;
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void enqueueWorkRequests(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(1, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void updateUniquePeriodicWorkRequest(String name, byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeString(name);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(2, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void enqueueContinuation(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(3, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void cancelWorkById(String id, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeString(id);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(4, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void cancelAllWorkByTag(String tag, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeString(tag);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(5, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void cancelUniqueWork(String name, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeString(name);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(6, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void cancelAllWork(IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(7, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void queryWorkInfo(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(8, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void setProgress(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(9, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            @Override // androidx.work.multiprocess.IWorkManagerImpl
            public void setForegroundAsync(byte[] request, IWorkManagerImplCallback callback) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeByteArray(request);
                    _data.writeStrongInterface(callback);
                    this.mRemote.transact(10, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }
        }
    }
}
