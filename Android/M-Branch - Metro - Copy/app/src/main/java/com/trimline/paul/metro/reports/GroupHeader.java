package com.trimline.paul.metro.reports;

public class GroupHeader {
    public final String agentCode;
    public final int vehicleCount;
    public final double totalAmount;
    public final double managementSum;
    public final double saccoSum;
    public final double operationSum;
    public final double loanSum;
    public final double othersSum;

    public GroupHeader(String agentCode, int vehicleCount, double totalAmount, double managementSum, double saccoSum, double operationSum, double loanSum, double othersSum) {
        this.agentCode = agentCode;
        this.vehicleCount = vehicleCount;
        this.totalAmount = totalAmount;
        this.managementSum = managementSum;
        this.saccoSum = saccoSum;
        this.operationSum = operationSum;
        this.loanSum = loanSum;
        this.othersSum = othersSum;
    }
}
