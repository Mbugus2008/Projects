package com.openvalley.afrecash.datasets;

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

    @SerializedName("Id_No")
    @Expose
    private String Id_No;

    @SerializedName("pin")
    @Expose
    private String pin;

    public GetMember(String phone, String deviceID) {
        this.phone = phone;
        this.deviceID = deviceID;
    }

    public GetMember(String phone, String deviceID, String id_No, String pin) {
        this.phone = phone;
        this.deviceID = deviceID;
        Id_No = id_No;
        this.pin = pin;
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

    public String getId_No() {
        return Id_No;
    }

    public void setId_No(String id_No) {
        Id_No = id_No;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }
}