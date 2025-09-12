package com.trimline.paul.metro.transactions;

// Class to store transactions grouped by Type under a specific Loan_No
public class GroupedByType {
    private String type;
    private Double totalAmount;

    public GroupedByType(String type, Double totalAmount) {
        this.type = type;
        this.totalAmount = totalAmount;
    }

    public String getType() {
        return type;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    @Override
    public String toString() {
        return "GroupedByType{" +
                "type='" + type + '\'' +
                ", totalAmount=" + totalAmount +
                '}';
    }
}
