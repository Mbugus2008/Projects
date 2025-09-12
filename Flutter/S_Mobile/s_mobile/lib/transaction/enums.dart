enum transaction_Type {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Withdrawal_Request,

  /// <remarks/>
  Deposit,

  /// <remarks/>
  Balance,

  /// <remarks/>
  Ministatement,

  /// <remarks/>
  Airtime,

  /// <remarks/>
  Loan_balance,

  /// <remarks/>
  Loan_Status,

  /// <remarks/>
  Share_Deposit_Balance,

  /// <remarks/>
  Transfer_to_Fosa,

  /// <remarks/>
  Bank_Transfer,

  /// <remarks/>
  Utility_Payment,

  /// <remarks/>
  Loan_Application,

  /// <remarks/>
  Standing_orders,

  /// <remarks/>
  Reversal,

  /// <remarks/>
  Loan_Repayment,

  /// <remarks/>
  Share_Contribution,

  /// <remarks/>
  Stop_Atm,

  /// <remarks/>
  Confirm,

  /// <remarks/>
  Bill_Confirmation,

  /// <remarks/>
  Airtime_Confirmation,

  /// <remarks/>
  Lump_sum,

  /// <remarks/>
  Bank_Transfer_Confirmation,

  /// <remarks/>
  Account_Activation,

  /// <remarks/>
  New_Fosa_Account,

  /// <remarks/>
  Statement,

  /// <remarks/>
  Loan_Ministatement,

  /// <remarks/>
  Loan_Statement,
}

enum status {
  /// <remarks/>
  Failed,

  /// <remarks/>
  Pending,

  /// <remarks/>
  Completed,
}

enum source {
  /// <remarks/>
  Fosa,

  /// <remarks/>
  Mpesa,
}

enum destination {
  /// <remarks/>
  Fosa,

  /// <remarks/>
  Shares,

  /// <remarks/>
  Deposits,
}

enum loan_Type {
  /// <remarks/>
  Mloan,

  /// <remarks/>
  Dividend,

  /// <remarks/>
  Other,
}

enum channel {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Ussd,

  /// <remarks/>
  App,

  /// <remarks/>
  Agency,
}

enum product_Category {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Share_Capital,

  /// <remarks/>
  Deposit_Contribution,

  /// <remarks/>
  Fixed_Deposit,

  /// <remarks/>
  Junior_Savings,

  /// <remarks/>
  Registration_Fee,

  /// <remarks/>
  Benevolent,

  /// <remarks/>
  Settlement,

  /// <remarks/>
  Holiday,

  /// <remarks/>
  Kusco_Shares,

  /// <remarks/>
  Disbursement_Account,

  /// <remarks/>
  M_Wallet,
}

enum transfer_type {
  /// <remarks/>
  Self,

  /// <remarks/>
  Other_Member,
}

enum bank_Transfer_type {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Internal,

  /// <remarks/>
  Eft,

  /// <remarks/>
  RTGS,

  /// <remarks/>
  Pesalink,
}
