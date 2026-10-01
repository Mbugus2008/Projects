package com.trimline.paul.metro;

/**
 * Created by Paulo on 3/27/2017.
 */

public class vehicles {
    public String getVehicle_Number() {
        return Vehicle_Number;
    }

    public String Vehicle_Number;
    public int vehicle_type;
    public Double Daily_Contribution;
    public String Start_Date;
    public String Code;
    public String Id_Number;
    public double Arrears;
    public double Penalty;
    public String Fleet_No;
    /** 0 = blank, 1 = Sacco, 2 = Investor (Vehicles page "Owner" enum) */
    public int Owner;
    /** Vehicles page "Dues" (decimal) */
    public double Dues;
    /** Vehicles page "Collect": 0 = blank, 1 = Loan, 2 = Offload */
    public int Collect;
    @Override
    public String toString() {
        return this.Code;
    }

    public static enum Vehicle_Type {


        _x0031_4_Seater("14 Seater"),

        _x0033_3_Seater("33 Seater"),

       _x0032_5_Seater("25 Seater"),

        _x0032_9_Seater("29 Seater"),

        _x0034_1_Seater("41 Seater"),

        _x0032_6_Seater("26 Seater"),

        _x0033_7_Seater("37 Seater");

        private String type;

        Vehicle_Type(String aState) {
            type = aState;
        }

        @Override
        public String toString() {
            return type;
        }
    }

}

