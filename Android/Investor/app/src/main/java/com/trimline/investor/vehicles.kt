package com.trimline.investor

/**
 * Created by Paulo on 3/27/2017.
 */
class vehicles {
    var Vehicle_Number: String? = null
    var vehicle_type = 0
    var Daily_Contribution: Double? = null
    var Start_Date: String? = null
    var Code: String? = null
    var Id_Number: String? = null
    var Arrears = 0.0
    var Penalty = 0.0
    var Fleet_No: String? = null
    override fun toString(): String {
        return Code!!
    }

    enum class Vehicle_Type(private val type: String) {
        _x0031_4_Seater("14 Seater"),
        _x0033_3_Seater("33 Seater"),
        _x0032_5_Seater("25 Seater"),
        _x0032_9_Seater("29 Seater"),
        _x0034_1_Seater("41 Seater"),
        _x0032_6_Seater("26 Seater"),
        _x0033_7_Seater("37 Seater");

        override fun toString(): String {
            return type
        }
    }
}