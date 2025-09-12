package com.mobile.afrecash.datasets;

/**
 * Created by @GeekNat on 12/29/17.
 * All is possible
 */

public class HomeHolder {

    private String headerText = "-",
            headerAmount = "-",
            footerText = "-",
            btnText = "",
            ongoingLoans = "-",
            pendingLoans = "-",
            paidLoans = "-",
            rejectedLoans = "-",
            defaultedLoans = "-";

    private Loan loanHolder = new Loan();

    public String getDefaultedLoans() {
        return defaultedLoans;
    }

    public void setDefaultedLoans(String defaultedLoans) {
        this.defaultedLoans = defaultedLoans;
    }

    public String getHeaderText() {
        return headerText;
    }

    public void setHeaderText(String headerText) {
        this.headerText = headerText;
    }

    public String getHeaderAmount() {
        return headerAmount;
    }

    public void setHeaderAmount(String headerAmount) {
        this.headerAmount = headerAmount;
    }

    public String getFooterText() {
        return footerText;
    }

    public void setFooterText(String footerText) {
        this.footerText = footerText;
    }

    public String getBtnText() {
        return btnText;
    }

    public void setBtnText(String btnText) {
        this.btnText = btnText;
    }

    public String getOngoingLoans() {
        return ongoingLoans;
    }

    public void setOngoingLoans(String ongoingLoans) {
        this.ongoingLoans = ongoingLoans;
    }

    public String getPendingLoans() {
        return pendingLoans;
    }

    public void setPendingLoans(String pendingLoans) {
        this.pendingLoans = pendingLoans;
    }

    public String getPaidLoans() {
        return paidLoans;
    }

    public void setPaidLoans(String paidLoans) {
        this.paidLoans = paidLoans;
    }

    public String getRejectedLoans() {
        return rejectedLoans;
    }

    public void setRejectedLoans(String rejectedLoans) {
        this.rejectedLoans = rejectedLoans;
    }

    public Loan getLoanHolder() {
        return loanHolder;
    }

    public void setLoanHolder(Loan loanHolder) {
        this.loanHolder = loanHolder;
    }
}
