package com.trimline.paul.metro.reports;

import com.trimline.paul.metro.transaction;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * One vehicle (loan no) inside a cashier group: totals, the per-type
 * breakdown and the individual collections for the drill-down dialog.
 */
public class CashierVehicle {
    public String ItemNo = "";
    public String FleetNo = "";
    public int Count;
    public double Total;
    public final List<transaction> Transactions = new ArrayList<>();
    // label -> amount, ordered by the transaction type catalogue
    public final LinkedHashMap<String, Double> TypeSums = new LinkedHashMap<>();
}
