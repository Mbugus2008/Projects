package com.openvalley.afrecash.datasets;

import java.io.Serializable;

/**
 * Created by @GeekNat on 12/30/17.
 * All is possible
 */

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Loan implements Serializable {

    @SerializedName("Key")
    @Expose
    private String key;
    @SerializedName("Loan_No")
    @Expose
    private String loanNo;
    @SerializedName("Application_Date")
    @Expose
    private String applicationDate;
    @SerializedName("Application_DateSpecified")
    @Expose
    private Boolean applicationDateSpecified;
    @SerializedName("Client_Code")
    @Expose
    private String clientCode;
    @SerializedName("Client_Name")
    @Expose
    private String clientName;
    @SerializedName("Loan_Type")
    @Expose
    private String loanType;
    @SerializedName("Loan_Type_Name")
    @Expose
    private String loanTypeName;
    @SerializedName("Approved_Amount")
    @Expose
    private Double approvedAmount;
    @SerializedName("Approved_AmountSpecified")
    @Expose
    private Boolean approvedAmountSpecified;
    @SerializedName("Outstanding_Balance")
    @Expose
    private Double outstandingBalance;
    @SerializedName("Outstanding_BalanceSpecified")
    @Expose
    private Boolean outstandingBalanceSpecified;
    @SerializedName("Outstanding_Interest")
    @Expose
    private Double outstandingInterest;
    @SerializedName("Outstanding_InterestSpecified")
    @Expose
    private Boolean outstandingInterestSpecified;
    @SerializedName("Requested_Amount")
    @Expose
    private Double requestedAmount;
    @SerializedName("Requested_AmountSpecified")
    @Expose
    private Boolean requestedAmountSpecified;
    @SerializedName("Loan_Status")
    @Expose
    private Integer loanStatus;
    @SerializedName("Loan_StatusSpecified")
    @Expose
    private Boolean loanStatusSpecified;
    @SerializedName("Mobile")
    @Expose
    private String mobile;
    @SerializedName("Mpesa_Reference")
    @Expose
    private Object mpesaReference;
    @SerializedName("Loan_Disbursement_Date")
    @Expose
    private String loanDisbursementDate;
    @SerializedName("Loan_Disbursement_DateSpecified")
    @Expose
    private Boolean loanDisbursementDateSpecified;
    @SerializedName("Posted")
    @Expose
    private Boolean posted;
    @SerializedName("PostedSpecified")
    @Expose
    private Boolean postedSpecified;
    @SerializedName("Due_Date")
    @Expose
    private String dueDate;
    @SerializedName("Due_DateSpecified")
    @Expose
    private Boolean dueDateSpecified;
    @SerializedName("Status")
    @Expose
    private int status;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getLoanNo() {
        return loanNo;
    }

    public void setLoanNo(String loanNo) {
        this.loanNo = loanNo;
    }

    public String getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(String applicationDate) {
        this.applicationDate = applicationDate;
    }

    public Boolean getApplicationDateSpecified() {
        return applicationDateSpecified;
    }

    public void setApplicationDateSpecified(Boolean applicationDateSpecified) {
        this.applicationDateSpecified = applicationDateSpecified;
    }

    public String getClientCode() {
        return clientCode;
    }

    public void setClientCode(String clientCode) {
        this.clientCode = clientCode;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getLoanType() {
        return loanType;
    }

    public void setLoanType(String loanType) {
        this.loanType = loanType;
    }

    public String getLoanTypeName() {
        return loanTypeName;
    }

    public void setLoanTypeName(String loanTypeName) {
        this.loanTypeName = loanTypeName;
    }

    public Double getApprovedAmount() {
        return approvedAmount;
    }

    public void setApprovedAmount(Double approvedAmount) {
        this.approvedAmount = approvedAmount;
    }

    public Boolean getApprovedAmountSpecified() {
        return approvedAmountSpecified;
    }

    public void setApprovedAmountSpecified(Boolean approvedAmountSpecified) {
        this.approvedAmountSpecified = approvedAmountSpecified;
    }

    public Double getOutstandingBalance() {
        return outstandingBalance;
    }

    public void setOutstandingBalance(Double outstandingBalance) {
        this.outstandingBalance = outstandingBalance;
    }

    public Boolean getOutstandingBalanceSpecified() {
        return outstandingBalanceSpecified;
    }

    public void setOutstandingBalanceSpecified(Boolean outstandingBalanceSpecified) {
        this.outstandingBalanceSpecified = outstandingBalanceSpecified;
    }

    public Double getOutstandingInterest() {
        return outstandingInterest;
    }

    public void setOutstandingInterest(Double outstandingInterest) {
        this.outstandingInterest = outstandingInterest;
    }

    public Boolean getOutstandingInterestSpecified() {
        return outstandingInterestSpecified;
    }

    public void setOutstandingInterestSpecified(Boolean outstandingInterestSpecified) {
        this.outstandingInterestSpecified = outstandingInterestSpecified;
    }

    public Double getRequestedAmount() {
        return requestedAmount;
    }

    public void setRequestedAmount(Double requestedAmount) {
        this.requestedAmount = requestedAmount;
    }

    public Boolean getRequestedAmountSpecified() {
        return requestedAmountSpecified;
    }

    public void setRequestedAmountSpecified(Boolean requestedAmountSpecified) {
        this.requestedAmountSpecified = requestedAmountSpecified;
    }

    public Integer getLoanStatus() {
        return loanStatus;
    }

    public void setLoanStatus(Integer loanStatus) {
        this.loanStatus = loanStatus;
    }

    public Boolean getLoanStatusSpecified() {
        return loanStatusSpecified;
    }

    public void setLoanStatusSpecified(Boolean loanStatusSpecified) {
        this.loanStatusSpecified = loanStatusSpecified;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Object getMpesaReference() {
        return mpesaReference;
    }

    public void setMpesaReference(Object mpesaReference) {
        this.mpesaReference = mpesaReference;
    }

    public String getLoanDisbursementDate() {
        return loanDisbursementDate;
    }

    public void setLoanDisbursementDate(String loanDisbursementDate) {
        this.loanDisbursementDate = loanDisbursementDate;
    }

    public Boolean getLoanDisbursementDateSpecified() {
        return loanDisbursementDateSpecified;
    }

    public void setLoanDisbursementDateSpecified(Boolean loanDisbursementDateSpecified) {
        this.loanDisbursementDateSpecified = loanDisbursementDateSpecified;
    }

    public Boolean getPosted() {
        return posted;
    }

    public void setPosted(Boolean posted) {
        this.posted = posted;
    }

    public Boolean getPostedSpecified() {
        return postedSpecified;
    }

    public void setPostedSpecified(Boolean postedSpecified) {
        this.postedSpecified = postedSpecified;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public Boolean getDueDateSpecified() {
        return dueDateSpecified;
    }

    public void setDueDateSpecified(Boolean dueDateSpecified) {
        this.dueDateSpecified = dueDateSpecified;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
