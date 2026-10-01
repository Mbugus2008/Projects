package com.trimline.paul.metro.reports;

// Helper class to hold the grouped data
public class AgentTypeSummary {
    public String agentCode;

    public String type;
    public double amount;

    // Constructor, getters and setters
    public AgentTypeSummary(String agentCode,  String type, double amount) {
        this.agentCode = agentCode;

        this.type = type;
        this.amount = amount;
    }
    public String getAgentCode() { return agentCode; }

    public String getType() { return type; }
    public double getAmount() { return amount; }
    // ... (generate getters and setters)
}
