package com.trimline.paul.metro.transactions;

import com.trimline.paul.metro.transaction;

import java.util.List;
// ExpandableListAdapter.java


public class GroupedByVehicle {
    private String vehicle;

    public String getFleetNO() {
        return FleetNO;
    }

    public void setFleetNO(String fleetNO) {
        FleetNO = fleetNO;
    }

    private String FleetNO;
    private Double totalAmount;
    private List<GroupedByType> groupedByTypeList;

    public List<transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<transaction> transactions) {
        this.transactions = transactions;
    }

    private List<transaction> transactions;
    public GroupedByVehicle(String loanNo, Double totalAmount, List<GroupedByType> groupedByTypeList, List<transaction> transactions) {
        this.vehicle = loanNo;
        this.totalAmount = totalAmount;
        this.groupedByTypeList = groupedByTypeList;
        this.transactions = transactions;
    }

    public String getVehicle() {
        return vehicle;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public List<GroupedByType> getGroupedByTypeList() {
        return groupedByTypeList;
    }

    @Override
    public String toString() {
        return "GroupedByLoanNo{" +
                "loanNo='" + vehicle + '\'' +
                ", totalAmount=" + totalAmount +
                ", groupedByTypeList=" + groupedByTypeList +
                '}';
    }
}


