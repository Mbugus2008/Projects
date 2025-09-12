package com.mobile.afrecash.datasets;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class GetMember implements Serializable {

    @SerializedName("phone")
    @Expose
    private String phone;
    @SerializedName("DeviceID")
    @Expose
    private String deviceID;

    public GetMember(String phone, String deviceID) {
        this.phone = phone;
        this.deviceID = deviceID;
    }

    public String getPhoneNo() {
        return phone;
    }

    public void setPhoneNo(String phoneNo) {
        this.phone = phoneNo;
    }

    public String getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(String deviceID) {
        this.deviceID = deviceID;
    }
}