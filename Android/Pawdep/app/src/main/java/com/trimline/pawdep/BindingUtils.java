package com.trimline.pawdep;

import androidx.databinding.InverseMethod;

public class BindingUtils {
    @InverseMethod("positionTocategory")
    public static int category(Allocation_header.Categorys c) {
        return c == null ? 0 : c.ordinal();
    }

    public static Allocation_header.Categorys positionTocategory(int position) {
        return Allocation_header.Categorys.values()[position];
    }

    @InverseMethod("positionToacccounttype")
    public static int accounttype(Allocation_Line.Account_Types c) {
        return c == null ? 0 : c.ordinal();
    }

    public static Allocation_Line.Account_Types positionToacccounttype(int position) {
        return Allocation_Line.Account_Types.values()[position];
    }
    @InverseMethod("positionTotranstype")
    public static int transtype(enums.Transaction_Type c) {
        return c == null ? 0 : c.ordinal();
    }

    public static enums.Transaction_Type positionTotranstype(int position) {
        return enums.Transaction_Type.values()[position];
    }
}


