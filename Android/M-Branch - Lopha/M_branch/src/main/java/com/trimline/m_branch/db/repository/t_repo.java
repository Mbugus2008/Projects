package com.trimline.m_branch.db.repository;

import com.trimline.m_branch.Utilities.Receipts;
import com.trimline.m_branch.Utilities.collectiondates;
import com.trimline.m_branch.db.dao.B_Dao;
import com.trimline.m_branch.db.dao.d_transaction;
import com.trimline.m_branch.reports.tsummary;
import com.trimline.m_branch.transaction;


import java.util.ArrayList;
import java.util.List;

public class t_repo extends Repository<transaction> {
    d_transaction d_transaction;
    public t_repo(d_transaction dao) {
        super(dao);
        d_transaction = dao;
    }
   public List<collectiondates> getcollectiondates(){
       return d_transaction.getcollectiondates();

    }

    public List<tsummary> gettranssummarybydate(String date){
        return d_transaction.gettranssummarybydate(date);
    }
    public void refresh(String date){
         d_transaction.refresh(date);
    }

    public void post(String param){
        d_transaction.post(param);
    }
    public List<Receipts> getcollectionreceipts(String date){
        return d_transaction.getcollectionreceipts(date);
    }
    public Receipts getreceiptsummary(String reciept){
        return d_transaction.getreceiptsummary(reciept);
    }
    public List<transaction> gettransbyottn(String receipt){
        return d_transaction.gettransbydate(receipt);
    }
    public List<transaction> gettransallbydate(String date){
        return d_transaction.gettransallbydate(date);
    }
    public List<transaction> getreceipt(String receipt){
        return d_transaction.getreceipt(receipt);
    }
}
