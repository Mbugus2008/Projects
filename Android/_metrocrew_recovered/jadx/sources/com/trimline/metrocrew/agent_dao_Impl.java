package com.trimline.metrocrew;

import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.util.DBUtil;
import androidx.room.util.SQLiteStatementUtil;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.jvm.functions.Function1;

/* JADX INFO: loaded from: classes5.dex */
public final class agent_dao_Impl extends agent.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<agent> __insertAdapterOfagent = new EntityInsertAdapter<agent>() { // from class: com.trimline.metrocrew.agent_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `agent` (`Agent_Code`,`Customer_ID_No`,`Mobile_No`,`Status`,`Name`,`Account`,`Password`,`Constituency`,`Account_type`,`Balance`) VALUES (?,?,?,?,?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(final SQLiteStatement statement, final agent entity) {
            if (entity.Agent_Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Agent_Code);
            }
            if (entity.Customer_ID_No == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Customer_ID_No);
            }
            if (entity.Mobile_No == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.Mobile_No);
            }
            statement.mo152bindLong(4, entity.Status);
            if (entity.Name == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo154bindText(5, entity.Name);
            }
            if (entity.Account == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Account);
            }
            if (entity.Password == null) {
                statement.mo153bindNull(7);
            } else {
                statement.mo154bindText(7, entity.Password);
            }
            if (entity.Constituency == null) {
                statement.mo153bindNull(8);
            } else {
                statement.mo154bindText(8, entity.Constituency);
            }
            statement.mo152bindLong(9, entity.Account_type);
            statement.mo151bindDouble(10, entity.Balance);
        }
    };
    private final EntityDeleteOrUpdateAdapter<agent> __deleteAdapterOfagent = new EntityDeleteOrUpdateAdapter<agent>() { // from class: com.trimline.metrocrew.agent_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `agent` WHERE `Agent_Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final agent entity) {
            if (entity.Agent_Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Agent_Code);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<agent> __updateAdapterOfagent = new EntityDeleteOrUpdateAdapter<agent>() { // from class: com.trimline.metrocrew.agent_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `agent` SET `Agent_Code` = ?,`Customer_ID_No` = ?,`Mobile_No` = ?,`Status` = ?,`Name` = ?,`Account` = ?,`Password` = ?,`Constituency` = ?,`Account_type` = ?,`Balance` = ? WHERE `Agent_Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final agent entity) {
            if (entity.Agent_Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Agent_Code);
            }
            if (entity.Customer_ID_No == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Customer_ID_No);
            }
            if (entity.Mobile_No == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.Mobile_No);
            }
            statement.mo152bindLong(4, entity.Status);
            if (entity.Name == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo154bindText(5, entity.Name);
            }
            if (entity.Account == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Account);
            }
            if (entity.Password == null) {
                statement.mo153bindNull(7);
            } else {
                statement.mo154bindText(7, entity.Password);
            }
            if (entity.Constituency == null) {
                statement.mo153bindNull(8);
            } else {
                statement.mo154bindText(8, entity.Constituency);
            }
            statement.mo152bindLong(9, entity.Account_type);
            statement.mo151bindDouble(10, entity.Balance);
            if (entity.Agent_Code == null) {
                statement.mo153bindNull(11);
            } else {
                statement.mo154bindText(11, entity.Agent_Code);
            }
        }
    };

    public agent_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.agent.dao
    void insert(final agent entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.agent_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m444lambda$insert$0$comtrimlinemetrocrewagent_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-agent_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m444lambda$insert$0$comtrimlinemetrocrewagent_dao_Impl(agent entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOfagent.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.agent.dao
    void delete(final agent entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.agent_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m443lambda$delete$1$comtrimlinemetrocrewagent_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-agent_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m443lambda$delete$1$comtrimlinemetrocrewagent_dao_Impl(agent entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOfagent.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.agent.dao
    void update(final agent entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.agent_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m445lambda$update$2$comtrimlinemetrocrewagent_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-agent_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m445lambda$update$2$comtrimlinemetrocrewagent_dao_Impl(agent entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOfagent.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.agent.dao
    List<agent> getagents() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.agent_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return agent_dao_Impl.lambda$getagents$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getagents$3(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM agent");
        try {
            int _columnIndexOfAgentCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Agent_Code");
            int _columnIndexOfCustomerIDNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Customer_ID_No");
            int _columnIndexOfMobileNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Mobile_No");
            int _columnIndexOfStatus = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Status");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account");
            int _columnIndexOfPassword = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Password");
            int _columnIndexOfConstituency = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Constituency");
            int _columnIndexOfAccountType = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_type");
            int _columnIndexOfBalance = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Balance");
            List<agent> _result = new ArrayList<>();
            while (_stmt.step()) {
                agent _item = new agent();
                if (_stmt.isNull(_columnIndexOfAgentCode)) {
                    _item.Agent_Code = null;
                } else {
                    _item.Agent_Code = _stmt.getText(_columnIndexOfAgentCode);
                }
                if (_stmt.isNull(_columnIndexOfCustomerIDNo)) {
                    _item.Customer_ID_No = null;
                } else {
                    _item.Customer_ID_No = _stmt.getText(_columnIndexOfCustomerIDNo);
                }
                if (_stmt.isNull(_columnIndexOfMobileNo)) {
                    _item.Mobile_No = null;
                } else {
                    _item.Mobile_No = _stmt.getText(_columnIndexOfMobileNo);
                }
                int _columnIndexOfAgentCode2 = _columnIndexOfAgentCode;
                _item.Status = (int) _stmt.getLong(_columnIndexOfStatus);
                if (_stmt.isNull(_columnIndexOfName)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName);
                }
                if (_stmt.isNull(_columnIndexOfAccount)) {
                    _item.Account = null;
                } else {
                    _item.Account = _stmt.getText(_columnIndexOfAccount);
                }
                if (_stmt.isNull(_columnIndexOfPassword)) {
                    _item.Password = null;
                } else {
                    _item.Password = _stmt.getText(_columnIndexOfPassword);
                }
                if (_stmt.isNull(_columnIndexOfConstituency)) {
                    _item.Constituency = null;
                } else {
                    _item.Constituency = _stmt.getText(_columnIndexOfConstituency);
                }
                _item.Account_type = (int) _stmt.getLong(_columnIndexOfAccountType);
                _item.Balance = _stmt.getDouble(_columnIndexOfBalance);
                _result.add(_item);
                _columnIndexOfAgentCode = _columnIndexOfAgentCode2;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.agent.dao
    agent getagent(final String agentcode, final String pass) {
        return (agent) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.agent_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return agent_dao_Impl.lambda$getagent$4(agentcode, pass, (SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ agent lambda$getagent$4(String agentcode, String pass, SQLiteConnection _connection) {
        agent _result;
        SQLiteStatement _stmt = _connection.prepare("Select * from agent where Agent_Code =? and Password=?");
        try {
            if (agentcode == null) {
                _stmt.mo153bindNull(1);
            } else {
                _stmt.mo154bindText(1, agentcode);
            }
            if (pass == null) {
                _stmt.mo153bindNull(2);
            } else {
                _stmt.mo154bindText(2, pass);
            }
            int _columnIndexOfAgentCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Agent_Code");
            int _columnIndexOfCustomerIDNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Customer_ID_No");
            int _columnIndexOfMobileNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Mobile_No");
            int _columnIndexOfStatus = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Status");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account");
            int _columnIndexOfPassword = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Password");
            int _columnIndexOfConstituency = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Constituency");
            int _columnIndexOfAccountType = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_type");
            int _columnIndexOfBalance = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Balance");
            if (_stmt.step()) {
                _result = new agent();
                if (_stmt.isNull(_columnIndexOfAgentCode)) {
                    _result.Agent_Code = null;
                } else {
                    _result.Agent_Code = _stmt.getText(_columnIndexOfAgentCode);
                }
                if (_stmt.isNull(_columnIndexOfCustomerIDNo)) {
                    _result.Customer_ID_No = null;
                } else {
                    _result.Customer_ID_No = _stmt.getText(_columnIndexOfCustomerIDNo);
                }
                if (_stmt.isNull(_columnIndexOfMobileNo)) {
                    _result.Mobile_No = null;
                } else {
                    _result.Mobile_No = _stmt.getText(_columnIndexOfMobileNo);
                }
                _result.Status = (int) _stmt.getLong(_columnIndexOfStatus);
                if (_stmt.isNull(_columnIndexOfName)) {
                    _result.Name = null;
                } else {
                    _result.Name = _stmt.getText(_columnIndexOfName);
                }
                if (_stmt.isNull(_columnIndexOfAccount)) {
                    _result.Account = null;
                } else {
                    _result.Account = _stmt.getText(_columnIndexOfAccount);
                }
                if (_stmt.isNull(_columnIndexOfPassword)) {
                    _result.Password = null;
                } else {
                    _result.Password = _stmt.getText(_columnIndexOfPassword);
                }
                if (_stmt.isNull(_columnIndexOfConstituency)) {
                    _result.Constituency = null;
                } else {
                    _result.Constituency = _stmt.getText(_columnIndexOfConstituency);
                }
                _result.Account_type = (int) _stmt.getLong(_columnIndexOfAccountType);
                _result.Balance = _stmt.getDouble(_columnIndexOfBalance);
            } else {
                _result = null;
            }
            _stmt.close();
            return _result;
        } catch (Throwable th) {
            _stmt.close();
            throw th;
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
