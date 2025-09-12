package com.mobile.afrecash.datasets;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Repayment {
    @SerializedName("loan")
    @Expose
    private Loan loan;
    @SerializedName("Amounttopay")
    @Expose
    private double amountToPay;
    @SerializedName("source")
    @Expose
    private int source;

    public Loan getLoan() {
        return loan;
    }

    public void setLoan(Loan loan) {
        this.loan = loan;
    }

    public double getAmountToPay() {
        return amountToPay;
    }

    public void setAmountToPay(double amountToPay) {
        this.amountToPay = amountToPay;
    }

    public int getSource() {
        return source;
    }

    public void setSource(int source) {
        this.source = source;
    }
}
