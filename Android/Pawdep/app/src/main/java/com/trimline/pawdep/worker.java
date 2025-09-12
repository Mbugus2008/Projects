package com.trimline.pawdep;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import androidx.annotation.NonNull;
import com.trimline.pawdep.databinding.Pwtrans;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class worker {// extends Worker {
    Context c;

    public worker(@NonNull Context context) {
        this.c = context;
//            @NonNull Context context,
//            @NonNull WorkerParameters params) {
//        super(context, params);
    }

    // @Override
    //  public Result doWork() {
    public void doWork() {
//        // Do the work here--in this case, upload the images.
        try {
            Runnable myRunnable4 = new Runnable() {
                @Override
                public void run() {
                    getlogins();
                    Loanproducts();
                    Devices();
                   // accounts();
                   // Banks();
                   // Sectors();
                }
            };
            new Thread(myRunnable4).start();
            Runnable myRunnable = new Runnable() {
                @Override
                public void run() {
                    getgroups();
                }
            };
            new Thread(myRunnable).start();
            Runnable myRunnable2 = new Runnable() {
                @Override
                public void run() {
                    getmembers();
                }
            };
//            new Thread(myRunnable2).start();
//            Runnable myRunnable3 = new Runnable() {
//                @Override
//                public void run() {
//                    getloans();
//                }
//            };
            //new Thread(myRunnable3).start();
            Runnable myRunnable5 = new Runnable() {
                @Override
                public void run() {
                    sendtrans();
                }
            };
            new Thread(myRunnable5).start();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //        new others().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
//        new getLoans().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
//        new getgmembers().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
//        new getgroups().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
//        new trans().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        //sendtrans();
//        getlogins();
//        Loanproducts();
//        Devices();
//        accounts();
//        Banks();
//        Sectors();
//        getgroups();
//        getmembers();
//        getloans();
        // return Result.success();
    }

    private void getlogins() {
        Agent.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.agentdao();
        try {
            String result = JsonParser.postjson("logins", null, null);
            Type localType = new TypeToken<List<Agent>>() {
            }.getType();
            List<Agent> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {
                    for (Agent f : results
                    ) {
                        Dao.Insert(f);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                Log.i("members", "Empty");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private void Devices() {
        Devices.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.ddao();
        try {
            String result = JsonParser.postjson("Devices", null, null);
            Type localType = new TypeToken<List<Devices>>() {
            }.getType();
            List<Devices> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {

                    Dao.Insertall(results);

                } catch (Exception ex) {

                    ex.printStackTrace();
                }
            } else {
                Log.i("members", "Empty");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private void accounts() {
        Accounts.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.accdao();
        try {
            String result = JsonParser.postjson("accounts", null, null);
            Type localType = new TypeToken<List<Accounts>>() {
            }.getType();
            List<Accounts> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {

                    Dao.Insertall(results);

                } catch (Exception ex) {

                    ex.printStackTrace();
                }
            } else {
                Log.i("members", "Empty");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private void Banks() {
        Banks.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.bdao();
        try {
            String result = JsonParser.postjson("banks", null, null);
            Type localType = new TypeToken<List<Banks>>() {
            }.getType();
            List<Banks> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {
                    Dao.Insertall(results);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                Log.i("Banks", "Empty");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void Sectors() {
        Sectors.dao Dao;
        Sub_Sector.dao sDao;
        DB db = DB.getInstance(c);
        Dao = db.sdao();
        sDao = db.sbdao();
        try {
            String result = JsonParser.postjson("Sectors", null, null);
            Type localType = new TypeToken<List<Sectors>>() {
            }.getType();
            List<Sectors> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {
                    Dao.Insertall(results);

                    List<Sub_Sector> sb = new ArrayList<>();

                    for (Sectors s : results
                    )
                        if (s.Sub_Sector != null)
                            sb.addAll(Arrays.asList(s.Sub_Sector));
                    if (sb.size() > 0)
                        sDao.Insertall(sb);
                } catch (Exception ex) {

                    ex.printStackTrace();
                }
            } else {
                Log.i("members", "Empty");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private void Loanproducts() {
        Loan_products.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.lpdao();
        try {
            String result = JsonParser.postjson("Loanproducts", null, null);
            Type localType = new TypeToken<List<Loan_products>>() {
            }.getType();
            List<Loan_products> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            if (results != null) {
                try {

                    Dao.Insertall(results);

                } catch (Exception ex) {

                    ex.printStackTrace();
                }
            } else {
                Log.i("members", "Empty");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private void getmembers() {
        Member.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.memberDao();
        //Member.Repository r = new Member.Repository((Application)c);
        try {
            List<Member> results;
            String key = "";
            Boolean all = false;
            while (all == false) {
                String result = JsonParser.postjson("allmembers", "bookmarkkey", key);
                Type localType = new TypeToken<List<Member>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
                if (results != null) {
                    try {
                        all = results.size() == 0;
                        //r.insert(results);
                        Dao.Insertall(results);
                        if (results.size() > 0)
                            key = results.get(results.size() - 1).Key;
//                   for (Member f : results
//                    ) {
//                       if (f.No!=null)
//                           Dao.Insert(f);
//                       key = f.Key;
//                       all = false;
//                    }
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

    private void getgroups() {
        Group.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.groupDao();

        List<Group> results;
        String key = "";
        Boolean all = false;
        while (all == false) {
            try {
                String result = JsonParser.postjson("allgroups", "bookmarkkey", key);
                Type localType = new TypeToken<List<Group>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
                if (results != null) {
                    try {
                        all = results.size() == 0;
                        Dao.insertAll(results);
                        if (results.size() > 0)
                            key = results.get(results.size() - 1).Key;
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                } else {
                    Log.i("Groups", "Empty");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void getloans() {
        Loan.dao Dao;
        DB db = DB.getInstance(c);
        Dao = db.loandao();
        // Loan.Repository repository = new Loan.Repository((Application)c);
        try {
            List<Loan> results;
            String key = "";
            Boolean all = false;
            while (all == false) {
                String result = JsonParser.postjson("loans", "bookmarkkey", key);
                Type localType = new TypeToken<List<Loan>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
                if (results != null) {
                    try {
                        all = results.size() == 0;
                        // repository.insert(results);
                        Dao.Insertall(results);
                        if (results.size() > 0)
                            key = results.get(results.size() - 1).Key;

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

    private void updatenewmember(){



    }

    public  void sendtrans() {
        Transaction.dao Dao;
        T_line.dao tdao;
        PW_Transactions.dao pdao;
        Advance.dao adao;
        Repayment.dao rdao;
        Member.dao mdao;

        Loan_guarantors.dao lgdao;
        DB db = DB.getInstance(c);
        Dao = db.transactiondao();
        tdao = db.t_linedao();
        adao = db.advissuedao();
        rdao = db.adao();
        pdao = db.ptadao();
        lgdao = db.lgdao();
        mdao = db.memberDao();
        Non_Cash.dao ncdao = db.nondao();
        Loan_Request.dao lrdao = db.lrdao();
        Receipts.dao rcdao = db.rdao();
        Receipt_lines.dao rcldao = db.rldao();
        try {
            List<Member> newm = mdao.getnewmembers();
            Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            for (Member m : newm
            ) {
                String newmember = g.toJson(m);
                newmember = JsonParser.postjson("newmembers", "data", newmember);
                Type localType = new TypeToken<Member>() {
                }.getType();
                Member r = g.fromJson(newmember, localType);
                if (r.No != "") {
                    System.out.println(m.No);
                    mdao.delete(m.No);
                    System.out.println(r.No);
                    mdao.Insert(r);
                    tdao.updatpawdep(m.No, r.No);
                    adao.updatpawdep(m.No, r.No);
                    pdao.updatpawdep(m.No, r.No);
                    lgdao.updatpawdep(m.No, r.No);
                    ncdao.updatpawdep(m.No, r.No);
                    lrdao.updatpawdep(m.No, r.No);
                    rcdao.updatpawdep(m.No, r.No);
                    rcldao.updatpawdep(m.No, r.No);
                }
            }
            for (Transaction cc : Dao.unsent()
            ) {
                boolean sent = true;
                Transaction res = null;
                String result = g.toJson(cc);
                result = JsonParser.postjson("Collections", "data", result);
                Type localType = new TypeToken<Transaction>() {
                }.getType();
                res = g.fromJson(result, localType);
                if (res != null) {
                    List<T_line> t = tdao.unsent(res.Transaction_No);
                    if (t.size() > 0) {
                        String tlines = JsonParser.postjson("tlines", "data", g.toJson(t));
                        Type tline = new TypeToken<List<T_line>>() {
                        }.getType();
                        t = new Gson().fromJson(tlines, tline);
                        sent = false;
                        if (t!=null)
                        for (T_line d : t
                        ) {
                            if (d.Key != null) {
                                d.sent = true;
                                tdao.Update(d);
                            } else
                                sent = false;
                        }
                    }
                    List<Repayment> a = rdao.unsent(res.Transaction_No);
                    if (a.size() > 0) {
                        String alines = JsonParser.postjson("repayment", "data", g.toJson(a));
                        Type adv = new TypeToken<List<Repayment>>() {
                        }.getType();
                        a = g.fromJson(alines, adv);
                        sent = false;
                        if (a!=null)
                        for (Repayment d : a
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                rdao.Update(d);
                            } else
                                sent = false;
                        }
                    }
                    List<PW_Transactions> p = pdao.unsent(res.Transaction_No);
                    System.out.println(new Gson().toJson(p));
                    if (p.size() > 0) {
                        String alines = JsonParser.postjson("Pwtransactions", "data", g.toJson(p));
                        Type adv = new TypeToken<List<PW_Transactions>>() {
                        }.getType();
                        p = g.fromJson(alines, adv);
                        sent = false;
                        if (p!=null)
                        for (PW_Transactions d : p
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                pdao.Update(d);
                            } else
                                sent = false;
                        }
                    }
                    List<Advance> aa = adao.unsent(res.Transaction_No);
                    if (aa.size() > 0) {
                        String alines = JsonParser.postjson("advancesissue", "data", g.toJson(aa));
                        Type adv = new TypeToken<List<Advance>>() {
                        }.getType();
                        aa = g.fromJson(alines, adv);
                        sent = false;
                        if (aa!=null)
                        for (Advance d : aa
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                adao.Update(d);
                            } else
                                sent = false;
                        }
                    }
                    Group_Loan.dao gldao = db.gdao();
                    List<Group_Loan> gl = gldao.unsent(res.Transaction_No);
                    if (gl.size() > 0) {
                        String alines = JsonParser.postjson("grouploan", "data", g.toJson(gl));
                        Type adv = new TypeToken<List<Group_Loan>>() {
                        }.getType();
                        gl = g.fromJson(alines, adv);
                        sent = false;
                        if (gl!=null)
                        for (Group_Loan d : gl
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                gldao.Update(d);
                            } else
                                sent = false;
                        }
                    }


                    List<Non_Cash> nc = ncdao.unsent(res.Transaction_No);
                    if (nc.size() > 0) {
                        String alines = JsonParser.postjson("noncash", "data", g.toJson(nc));
                        Type adv = new TypeToken<List<Non_Cash>>() {
                        }.getType();
                        nc = g.fromJson(alines, adv);
                        sent = false;
                        if (nc!=null)
                        for (Non_Cash d : nc
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                ncdao.Update(d);
                            } else
                                sent = false;
                        }
                    }

                    List<Loan_guarantors> lg = lgdao.unsent();
                    if (lg.size() > 0) {
                        String alines = JsonParser.postjson("loanguarantors", "data", g.toJson(lg));
                        Type adv = new TypeToken<List<Loan_guarantors>>() {
                        }.getType();
                        lg = g.fromJson(alines, adv);
                        sent = false;
                        if (lg!=null)
                        for (Loan_guarantors d : lg
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                lgdao.Update(d);
                            } else
                                sent = false;
                        }
                    }

                    List<Loan_Request> lr = lrdao.unsent();
                    if (lr.size() > 0) {
                        String alines = JsonParser.postjson("loanrequest", "data", g.toJson(lr));
                        Type adv = new TypeToken<List<Loan_Request>>() {
                        }.getType();
                        lr = g.fromJson(alines, adv);
                        sent = false;
                        if (lr!=null)
                        for (Loan_Request d : lr
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                lrdao.Update(d);
                            } else
                                sent = false;
                        }
                    }

                    List<Receipts> receipts = rcdao.unsent();
                    if (receipts.size() > 0) {
                        String alines = JsonParser.postjson("Receipts", "data", g.toJson(receipts));
                        Type adv = new TypeToken<List<Receipts>>() {
                        }.getType();
                        receipts = g.fromJson(alines, adv);
                        sent = false;
                        if (receipts!=null)
                        for (Receipts d : receipts
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                rcdao.Update(d);
                            } else
                                sent = false;
                        }
                    }

                    List<Receipt_lines> receipt_lines = rcldao.unsent();
                    if (receipt_lines.size() > 0) {
                        String alines = JsonParser.postjson("Receiptslines", "data", g.toJson(receipt_lines));
                        Type adv = new TypeToken<List<Receipt_lines>>() {
                        }.getType();
                        receipt_lines = g.fromJson(alines, adv);
                        sent = false;
                        if (receipt_lines!=null)
                        for (Receipt_lines d : receipt_lines
                        ) {
                            if (d.Key != null) {
                                d.Sent = true;
                                rcldao.Update(d);
                            } else
                                sent = false;
                        }
                    }
                    if (sent)
                        Dao.updatesent(res.Transaction_No);


                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private class getLoans extends AsyncTask<Void, Void, Void> {

        @Override
        protected Void doInBackground(Void... members) {
            getloans();
            return null;
        }
    }

    private class getgroups extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... members) {
            getgroups();
            return null;
        }
    }
    private class getgmembers extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... members) {
            getmembers();
            return null;
        }

        @Override
        protected void onPostExecute(Void v) {
            new getgmembers();

        }
    }

    private class others extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... members) {
            getlogins();
            Loanproducts();
            Devices();
            accounts();
            Banks();
            Sectors();
            return null;
        }
    }
    private class trans extends AsyncTask<Void, Void, Void> {
        @Override
        protected Void doInBackground(Void... members) {
            sendtrans();
            return null;
        }
    }

//    private void sendtline() {
//        T_line.dao Dao ;
//        DB db = DB.getInstance(c);
//        Dao = db.t_linedao();
//        try {
//            for (T_line cc : Dao.unsent()
//            ) {
//                T_line res = null;
//                Gson g = new Gson();
//                String result = g.toJson(cc);
//                result = JsonParser.postjson("Collections", "data", result);
//                Type localType = new TypeToken<T_line>() {
//                }.getType();
//                res = new Gson().fromJson(result, localType);
//                if (res != null) {
//                    Dao.updatesent (res.No);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//
//        }
//    }
}



