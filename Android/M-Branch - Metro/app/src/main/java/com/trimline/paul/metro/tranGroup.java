package com.trimline.paul.metro;

import java.util.ArrayList;
import java.util.List;

public class tranGroup {

        private String Type;
        private List<transaction> transactions;
    public tranGroup(String group) {
        this.Type = group;
        this.transactions = new ArrayList<>();
    }

    // Getters and Setters
    public String getGroup() {
        return Type;
    }

    public void setGroup(String group) {
        this.Type = group;
    }

    public List<transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<transaction> transactions) {
        this.transactions = transactions;
    }

    public void addTransaction(transaction transaction) {
        this.transactions.add(transaction);
    }
    }
