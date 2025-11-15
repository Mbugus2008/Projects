package com.trimline.paul.metro.reports;

public class ChildItem {
    public final String itemNo;
    public final double managementSum;
    public final double saccoSum;
    public final double operationSum;
    public final double loanSum;
    public final double othersSum;

    public ChildItem(String itemNo, double managementSum, double saccoSum, double operationSum, double loanSum, double othersSum) {
        this.itemNo = itemNo;
        this.managementSum = managementSum;
        this.saccoSum = saccoSum;
        this.operationSum = operationSum;
        this.loanSum = loanSum;
        this.othersSum = othersSum;
    }
}
