package com.openvalley.afrecash.datasets;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class OTP implements Serializable {

    @SerializedName("phone")
    @Expose
    private String phone;
    @SerializedName("message")
    @Expose
    private String message;

    public OTP(String phone, String message) {
        this.phone = phone;
        this.message = message;
    }

    public String getPhoneNo() {
        return phone;
    }

    public void setPhoneNo(String phoneNo) {
        this.phone = phoneNo;
    }

    public String getmessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}