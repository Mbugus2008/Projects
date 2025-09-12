package com.trimline.investor

/**
 * Created by Paul on 11-Dec-16.
 */
abstract class member {
    var No: String? = null
    var Name: String? = null
    var Phone_No: String? = null
    var ID_No: String? = null
    var Gender = 0
    var E_Mail: String? = null
    var Group: String? = null
    var updated = false
    var Un_allocated_Funds = 0.0
    var Loan_Balances = 0.0
    var Repayment = 0.0
    var Outstanding_Penalty = 0.0
    var Operation_Cost = 0.0
    abstract var vehicles: Array<vehicles>
    var Loan_Arrears = 0.0
    var dailyrepayment = 0.0
    var Savings = 0.0
    var Xmas = 0.0
    var Last_update_savings: String? = null
    var Last_update_xmas: String? = null
    var Last_update_Loan: String? = null
    var Key: String? = null
}