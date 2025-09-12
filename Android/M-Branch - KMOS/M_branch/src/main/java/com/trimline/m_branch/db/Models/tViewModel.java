package com.trimline.m_branch.db.Models;

import androidx.lifecycle.LiveData;

import com.trimline.m_branch.Utilities.collectiondates;
import com.trimline.m_branch.db.repository.t_repo;
import com.trimline.m_branch.reports.tsummary;
import com.trimline.m_branch.transaction;


import java.util.ArrayList;
import java.util.List;

public class tViewModel extends BaseViewModel<transaction, t_repo> {
    public t_repo trepo;

    public tViewModel(t_repo Repository) {
        super(Repository);
        this.trepo = Repository;
    }
    // Custom method specific to UserViewModel
    public List<collectiondates> getdates() {
        return trepo.getcollectiondates();
    }
    public List<transaction> getdates(String date) {
        return trepo.gettransallbydate(date);
    }

}