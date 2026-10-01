package com.trimline.paul.metro.reports;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * One cashier (agent) group of the cashier report: totals, the per-type
 * breakdown of what the cashier collected and the vehicles involved.
 */
public class CashierAgent {
    public String Code = "";
    public String Name = "";
    public boolean Resolved = false;  // true when Name/Code came from the agent table
    public int VehicleCount;
    public int Count;        // number of collections (transactions)
    public double Total;
    public boolean Expanded = true;
    public final List<CashierVehicle> Vehicles = new ArrayList<>();
    // label -> amount, ordered by the transaction type catalogue
    public final LinkedHashMap<String, Double> TypeTotals = new LinkedHashMap<>();
}
