package com.trimline.investments;

public class PaymentMethods {
    public String Key;
    public String Code;
    public String Description;
    public Boolean Available_on_channel;
    @Override
    public String toString(){return this.Code;}
}
