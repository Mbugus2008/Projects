package com.openvalley.afrecash.datasets;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class User implements Serializable {

    @SerializedName("Key")
    @Expose
    private String key;
    @SerializedName("No")
    @Expose
    private String no;
    @SerializedName("Name")
    @Expose
    private String name;
    @SerializedName("ID_No")
    @Expose
    private String iDNo;
    @SerializedName("Registration_Date")
    @Expose
    private String registrationDate;
    @SerializedName("Registration_DateSpecified")
    @Expose
    private Boolean registrationDateSpecified;
    @SerializedName("Region")
    @Expose
    private Object region;
    @SerializedName("Address")
    @Expose
    private Object address;
    @SerializedName("Phone_No")
    @Expose
    private String phoneNo;
    @SerializedName("Code")
    @Expose
    private Integer code;
    @SerializedName("Desc")
    @Expose
    private String desc;
    @SerializedName("Password")
    @Expose
    private String password;
    @SerializedName("Ref_1")
    @Expose
    private String ref1;
    @SerializedName("Ref_2")
    @Expose
    private String ref2;
    @SerializedName("Device_ID")
    @Expose
    private String deviceID;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIDNo() {
        return iDNo;
    }

    public void setIDNo(String iDNo) {
        this.iDNo = iDNo;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Boolean getRegistrationDateSpecified() {
        return registrationDateSpecified;
    }

    public void setRegistrationDateSpecified(Boolean registrationDateSpecified) {
        this.registrationDateSpecified = registrationDateSpecified;
    }

    public Object getRegion() {
        return region;
    }

    public void setRegion(Object region) {
        this.region = region;
    }

    public Object getAddress() {
        return address;
    }

    public void setAddress(Object address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRef1() {
        return ref1;
    }

    public void setRef1(String ref1) {
        this.ref1 = ref1;
    }

    public String getRef2() {
        return ref2;
    }

    public void setRef2(String ref2) {
        this.ref2 = ref2;
    }

    public String getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(String deviceID) {
        this.deviceID = deviceID;
    }
}