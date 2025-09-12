package com.trimline.paul.m_branch.teller;

import androidx.databinding.InverseMethod;

import com.trimline.paul.m_branch.enums.transaction_Type;

public class bindingutils {

    @InverseMethod("positionTotranstype")
    public static int transtype(transaction_Type c) {
        return c == null ? 0 : c.ordinal();
    }

    public static transaction_Type positionTotranstype(int position) {
        return transaction_Type.values()[position];
    }
}
