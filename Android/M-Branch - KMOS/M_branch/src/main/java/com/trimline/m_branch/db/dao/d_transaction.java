package com.trimline.m_branch.db.dao;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import androidx.room.Dao;
import androidx.room.Query;

import com.trimline.m_branch.Utilities.Receipts;
import com.trimline.m_branch.Utilities.collectiondates;
import com.trimline.m_branch.reports.tsummary;
import com.trimline.m_branch.transaction;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Dao
    public  interface d_transaction extends B_Dao<transaction> {

        @Query("SELECT * FROM `transaction`")
        abstract List<transaction> getall();

        @Query("Delete from `transaction` where OTTN =:ottn")
        abstract void deletereceipt(String ottn);

        @Query("select * from `transaction` where OTTN =:c")
        abstract List<transaction> getreceipt(String c);

        @Query("select * from `transaction` where Document_No =:c")
        abstract transaction gettransaction(String c);

        @Query("select * from `transaction` where Loan_No =:c")
        abstract List<transaction> getbyvehicle(String c);

        @Query("select Date as date,Sum(Amount) as Total,count(Document_No) as Count from `transaction`  group by Date order by  substr(Date,7)||substr(date,4,2)||substr(Date,1,2)  desc")
        abstract List<collectiondates> getcollectiondates();

        @Query("select *,(select Name from types tt where Code = Type ) as typename from `transaction` t Where Date =:date order by Time desc ")
        abstract List<transaction> gettransbydate(String date);

        @Query("select (select `Name` from types tt where tt.Code = t.Type) as Type,`Date` , sum(Amount) as Amount from `transaction` t Where Date =:date  group by Type,Date")
        abstract List<tsummary> gettranssummarybydate(String date);

        @Query("update `transaction` set sent = 0 where Date =:f")
        abstract void refresh(String f);
        @Query("update `transaction` set sent = 0 where OTTN =:f")
        abstract void post(String f);
        @Query("select Count(*) as `Count`, OTTN as receipt, Date as date, Account_No as `No`, Account_Name as Name,Agent_Code as user, sum(Amount) as Total, reversed  from `transaction` t where Type <>'PENALTY CHARGED'  and Date =:date  group by OTTN ")
        abstract List<Receipts> getcollectionreceipts(String date);

        @Query("select Count(*) as `Count`, OTTN as receipt, Date as date, Account_No as `No`, Account_Name as Name,Agent_Code as user, sum(Amount) as Total, reversed from `transaction` t where Type <>'PENALTY CHARGED'  and OTTN =:receipt  group by OTTN ")
        abstract Receipts getreceiptsummary(String receipt);


        @Query("select * from `transaction` where OTTN =:c")
        abstract List<transaction> gettransbyottn(String c);

        @Query("select *,(select Name from types where Code= t.Type) as typename from `transaction` t where Date =:date  and Type <>'PENALTY CHARGED'")
        abstract List<transaction> gettransallbydate(String date);
    }