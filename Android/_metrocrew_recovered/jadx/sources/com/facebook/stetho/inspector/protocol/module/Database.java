package com.facebook.stetho.inspector.protocol.module;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.util.SparseArray;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.ObjectIdMapper;
import com.facebook.stetho.inspector.helper.PeersRegisteredListener;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.ByteCompanionObject;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class Database implements ChromeDevtoolsDomain {
    private static final int MAX_BLOB_LENGTH = 512;
    private static final int MAX_EXECUTE_RESULTS = 250;
    private static final String UNKNOWN_BLOB_LABEL = "{blob}";
    private final ObjectMapper mObjectMapper;
    private List<DatabaseDriver2> mDatabaseDrivers = new ArrayList();
    private final ChromePeerManager mChromePeerManager = new ChromePeerManager();
    private final DatabasePeerRegistrationListener mPeerListener = new DatabasePeerRegistrationListener(this.mDatabaseDrivers);

    public static class AddDatabaseEvent {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public DatabaseObject database;
    }

    public static class DatabaseObject {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String domain;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String id;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String version;
    }

    public static class Error {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int code;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String message;
    }

    public static class ExecuteSQLRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String databaseId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String query;
    }

    public static class ExecuteSQLResponse implements JsonRpcResult {

        @JsonProperty
        public List<String> columnNames;

        @JsonProperty
        public Error sqlError;

        @JsonProperty
        public List<String> values;
    }

    public Database() {
        this.mChromePeerManager.setListener(this.mPeerListener);
        this.mObjectMapper = new ObjectMapper();
    }

    public void add(DatabaseDriver2 databaseDriver) {
        this.mDatabaseDrivers.add(databaseDriver);
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mChromePeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mChromePeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getDatabaseTableNames(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        GetDatabaseTableNamesRequest request = (GetDatabaseTableNamesRequest) this.mObjectMapper.convertValue(params, GetDatabaseTableNamesRequest.class);
        String databaseId = request.databaseId;
        DatabaseDescriptorHolder holder = this.mPeerListener.getDatabaseDescriptorHolder(databaseId);
        try {
            GetDatabaseTableNamesResponse response = new GetDatabaseTableNamesResponse();
            response.tableNames = holder.driver.getTableNames(holder.descriptor);
            return response;
        } catch (SQLiteException e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INVALID_REQUEST, e.toString(), null));
        }
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult executeSQL(JsonRpcPeer peer, JSONObject params) {
        ExecuteSQLRequest request = (ExecuteSQLRequest) this.mObjectMapper.convertValue(params, ExecuteSQLRequest.class);
        DatabaseDescriptorHolder holder = this.mPeerListener.getDatabaseDescriptorHolder(request.databaseId);
        try {
            return holder.driver.executeSQL(holder.descriptor, request.query, new BaseDatabaseDriver.ExecuteResultHandler<ExecuteSQLResponse>() { // from class: com.facebook.stetho.inspector.protocol.module.Database.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleRawQuery() throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("success");
                    response.values = Collections.singletonList("true");
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleSelect(Cursor result) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Arrays.asList(result.getColumnNames());
                    response.values = Database.flattenRows(result, 250);
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleInsert(long insertedId) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("ID of last inserted row");
                    response.values = Collections.singletonList(String.valueOf(insertedId));
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleUpdateDelete(int count) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("Modified rows");
                    response.values = Collections.singletonList(String.valueOf(count));
                    return response;
                }
            });
        } catch (RuntimeException e) {
            LogUtil.e(e, "Exception executing: %s", request.query);
            Error error = new Error();
            error.code = 0;
            error.message = e.getMessage();
            ExecuteSQLResponse response = new ExecuteSQLResponse();
            response.sqlError = error;
            return response;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ArrayList<String> flattenRows(Cursor cursor, int limit) {
        Util.throwIfNot(limit >= 0);
        ArrayList<String> flatList = new ArrayList<>();
        int numColumns = cursor.getColumnCount();
        for (int row = 0; row < limit && cursor.moveToNext(); row++) {
            for (int column = 0; column < numColumns; column++) {
                switch (cursor.getType(column)) {
                    case 0:
                        flatList.add(null);
                        break;
                    case 1:
                        flatList.add(String.valueOf(cursor.getLong(column)));
                        break;
                    case 2:
                        flatList.add(String.valueOf(cursor.getDouble(column)));
                        break;
                    case 3:
                    default:
                        flatList.add(cursor.getString(column));
                        break;
                    case 4:
                        flatList.add(blobToString(cursor.getBlob(column)));
                        break;
                }
            }
        }
        if (!cursor.isAfterLast()) {
            for (int column2 = 0; column2 < numColumns; column2++) {
                flatList.add("{truncated}");
            }
        }
        return flatList;
    }

    private static String blobToString(byte[] blob) {
        if (blob.length <= 512 && fastIsAscii(blob)) {
            try {
                return new String(blob, "US-ASCII");
            } catch (UnsupportedEncodingException e) {
                return UNKNOWN_BLOB_LABEL;
            }
        }
        return UNKNOWN_BLOB_LABEL;
    }

    private static boolean fastIsAscii(byte[] blob) {
        for (byte b : blob) {
            if ((b & ByteCompanionObject.MIN_VALUE) != 0) {
                return false;
            }
        }
        return true;
    }

    private static class DatabasePeerRegistrationListener extends PeersRegisteredListener {
        private final List<DatabaseDriver2> mDatabaseDrivers;
        private final SparseArray<DatabaseDescriptorHolder> mDatabaseHolders;
        private final ObjectIdMapper mDatabaseIdMapper;

        private DatabasePeerRegistrationListener(List<DatabaseDriver2> databaseDrivers) {
            this.mDatabaseHolders = new SparseArray<>();
            this.mDatabaseIdMapper = new ObjectIdMapper();
            this.mDatabaseDrivers = databaseDrivers;
        }

        public DatabaseDescriptorHolder getDatabaseDescriptorHolder(String databaseId) {
            return this.mDatabaseHolders.get(Integer.parseInt(databaseId));
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onFirstPeerRegistered() {
            for (DatabaseDriver2<?> driver : this.mDatabaseDrivers) {
                Iterator<?> it = driver.getDatabaseNames().iterator();
                while (it.hasNext()) {
                    DatabaseDescriptor desc = (DatabaseDescriptor) it.next();
                    Integer databaseId = this.mDatabaseIdMapper.getIdForObject(desc);
                    if (databaseId == null) {
                        Integer databaseId2 = Integer.valueOf(this.mDatabaseIdMapper.putObject(desc));
                        this.mDatabaseHolders.put(databaseId2.intValue(), new DatabaseDescriptorHolder(driver, desc));
                    }
                }
            }
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onLastPeerUnregistered() {
            this.mDatabaseIdMapper.clear();
            this.mDatabaseHolders.clear();
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onPeerAdded(JsonRpcPeer peer) {
            int N = this.mDatabaseHolders.size();
            for (int i = 0; i < N; i++) {
                int id = this.mDatabaseHolders.keyAt(i);
                DatabaseDescriptorHolder holder = this.mDatabaseHolders.valueAt(i);
                DatabaseObject databaseParams = new DatabaseObject();
                databaseParams.id = String.valueOf(id);
                databaseParams.name = holder.descriptor.name();
                databaseParams.domain = holder.driver.getContext().getPackageName();
                databaseParams.version = "N/A";
                AddDatabaseEvent eventParams = new AddDatabaseEvent();
                eventParams.database = databaseParams;
                peer.invokeMethod("Database.addDatabase", eventParams, null);
            }
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onPeerRemoved(JsonRpcPeer peer) {
        }
    }

    private static class DatabaseDescriptorHolder {
        public final DatabaseDescriptor descriptor;
        public final DatabaseDriver2 driver;

        public DatabaseDescriptorHolder(DatabaseDriver2 driver, DatabaseDescriptor descriptor) {
            this.driver = driver;
            this.descriptor = descriptor;
        }
    }

    private static class GetDatabaseTableNamesRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String databaseId;

        private GetDatabaseTableNamesRequest() {
        }
    }

    private static class GetDatabaseTableNamesResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<String> tableNames;

        private GetDatabaseTableNamesResponse() {
        }
    }

    @Deprecated
    public static abstract class DatabaseDriver extends BaseDatabaseDriver<String> {
        public DatabaseDriver(Context context) {
            super(context);
        }
    }
}
