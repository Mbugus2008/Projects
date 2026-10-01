package com.trimline.metrocrew;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class worker {
    Context c;

    public worker(Context context) {
        this.c = context;
    }

    public void doWork() {
        try {
            Runnable myRunnable4 = new Runnable() { // from class: com.trimline.metrocrew.worker.1
                @Override // java.lang.Runnable
                public void run() throws Throwable {
                    worker.this.getlogins();
                    worker.this.gettypes();
                    worker.this.getvehicles();
                    worker.this.getmembers();
                    worker.this.getpaymenttypes();
                    worker.this.postReceiptHeader();
                    worker.this.postReceiptLines();
                }
            };
            new Thread(myRunnable4).start();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void gettypes() throws Throwable {
        DB db = DB.getInstance(this.c);
        types.dao Dao = db.trandao();
        try {
            new Gson();
            String result = JsonParser.postjson("Transtypes", null, null);
            Type localType = new TypeToken<List<types>>() { // from class: com.trimline.metrocrew.worker.2
            }.getType();
            List<types> results = (List) new Gson().fromJson(result, localType);
            if (results != null) {
                try {
                    if (result.length() > 0) {
                        Dao.deleteall();
                    }
                    for (types f : results) {
                        Dao.insert(f);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getpaymenttypes() throws Throwable {
        DB db = DB.getInstance(this.c);
        payment_modes.dao Dao = db.pdao();
        try {
            new Gson();
            String result = JsonParser.postjson("PaymentModes", null, null);
            Type localType = new TypeToken<List<payment_modes>>() { // from class: com.trimline.metrocrew.worker.3
            }.getType();
            List<payment_modes> results = (List) new Gson().fromJson(result, localType);
            if (results != null) {
                try {
                    if (result.length() > 0) {
                        Dao.deleteall();
                    }
                    for (payment_modes f : results) {
                        Dao.insert(f);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getlogins() throws Throwable {
        DB db = DB.getInstance(this.c);
        agent.dao Dao = db.aDao();
        try {
            new Gson();
            String result = JsonParser.postjson("Users", null, null);
            Type localType = new TypeToken<List<agent>>() { // from class: com.trimline.metrocrew.worker.4
            }.getType();
            List<agent> results = (List) new Gson().fromJson(result, localType);
            if (results != null) {
                try {
                    for (agent f : results) {
                        Dao.insert(f);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return;
            }
            Log.i("members", "Empty");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getmembers() throws Throwable {
        DB db = DB.getInstance(this.c);
        Member.dao Dao = db.memberDao();
        loan.dao ldao = db.ldao();
        try {
            String key = "";
            Boolean all = false;
            while (!all.booleanValue()) {
                String result = JsonParser.postjson("Members", "key", key);
                Type localType = new TypeToken<List<Member>>() { // from class: com.trimline.metrocrew.worker.5
                }.getType();
                List<Member> results = (List) new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        all = true;
                        for (Member f : results) {
                            if (f.No != null) {
                                Dao.insert(f);
                            }
                            if (f.loans.length > 0) {
                                ldao.removelclientloans(f.No);
                                for (loan l : f.loans) {
                                    ldao.insert(l);
                                }
                            }
                            key = f.Key;
                            all = false;
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                } else {
                    Log.i("members", "Empty");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getvehicles() throws Throwable {
        DB db = DB.getInstance(this.c);
        Vehicles.dao vdao = db.vDao();
        try {
            Boolean.valueOf(false);
            String result = JsonParser.postjson_metro("Vehicles", null, null);
            Type localType = new TypeToken<List<Vehicles>>() { // from class: com.trimline.metrocrew.worker.6
            }.getType();
            List<Vehicles> results = (List) new Gson().fromJson(result, localType);
            if (results != null) {
                try {
                    for (Vehicles f : results) {
                        if (!f.Code.equalsIgnoreCase("") && f.Fleet_No != null && f.Vehicle_Number != null) {
                            vdao.insert(f);
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return;
            }
            Log.i("members", "Empty");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getloans() throws Throwable {
        DB db = DB.getInstance(this.c);
        loan.dao Dao = db.ldao();
        try {
            String key = "";
            Boolean all = false;
            while (!all.booleanValue()) {
                String result = JsonParser.postjson("loans", "bookmarkkey", key);
                Type localType = new TypeToken<List<loan>>() { // from class: com.trimline.metrocrew.worker.7
                }.getType();
                List<loan> results = (List) new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        all = true;
                        for (loan f : results) {
                            if (f.Loan_No != null) {
                                Dao.insert(f);
                            }
                            key = f.Key;
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                } else {
                    Log.i("Groups", "Empty");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void postReceiptLines() {
        Log.v("Posting Trans==>", "Receipts");
        DB db = DB.getInstance(this.c);
        final transaction.dao Dao = db.tdao();
        try {
            AsyncTask.execute(new Runnable() { // from class: com.trimline.metrocrew.worker.8
                @Override // java.lang.Runnable
                public void run() throws Throwable {
                    Gson g = new Gson();
                    List<transaction> receiptList = Dao.loadunsent();
                    Log.v("Posting Trans==>D1", g.toJson(receiptList));
                    for (transaction t : receiptList) {
                        String data = g.toJson(t);
                        Log.v("Posting Trans==>D", data);
                        String result = JsonParser.postjson("receipts_line", "data", data);
                        Log.v("Posting Trans==>R", result);
                        Type localType = new TypeToken<transaction>() { // from class: com.trimline.metrocrew.worker.8.1
                        }.getType();
                        transaction res = (transaction) new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
                        if (res != null && res.Key != null) {
                            Log.i("saving", "saving");
                            res.sent = true;
                            Dao.update(res);
                        }
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void postReceiptHeader() {
        Log.v("Posting Header==>", "Receipt headers");
        DB db = DB.getInstance(this.c);
        final theader.dao Dao = db.thDao();
        try {
            AsyncTask.execute(new Runnable() { // from class: com.trimline.metrocrew.worker.9
                @Override // java.lang.Runnable
                public void run() throws Throwable {
                    Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
                    List<theader> receiptList = Dao.loadAll(false);
                    Log.v("Posting Header==>All", g.toJson(receiptList));
                    for (theader t : receiptList) {
                        String data = g.toJson(t);
                        Log.v("Posting Header==>Data", data);
                        String result = JsonParser.postjson("receipts", "data", data);
                        Type localType = new TypeToken<theader>() { // from class: com.trimline.metrocrew.worker.9.1
                        }.getType();
                        theader res = (theader) new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(result, localType);
                        if (res != null && res.Key != null) {
                            res.sent = true;
                            Dao.update(res);
                        }
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
