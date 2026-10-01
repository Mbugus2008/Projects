package com.trimline.paul.metro.transactions;

import com.trimline.paul.metro.transaction;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
// ExpandableListAdapter.java


public class GroupedByVehicle {
    // The office treats these raw type codes as one "Management" bucket
    private static final Set<String> MGMT_CODES = new HashSet<>(Arrays.asList(
            "MANAGEMENT", "SACCO", "WELFARE", "OPERATION", "F1"));

    private double managementAmount;
    private double otherAmount;

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
        for (GroupedByType g : groupedByTypeList) {
            String code = g.getType() == null ? "" : g.getType().trim().toUpperCase();
            if (MGMT_CODES.contains(code)) managementAmount += g.getTotalAmount();
            else otherAmount += g.getTotalAmount();
        }
    }

    public double getManagementAmount() {
        return managementAmount;
    }

    public double getOtherAmount() {
        return otherAmount;
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


