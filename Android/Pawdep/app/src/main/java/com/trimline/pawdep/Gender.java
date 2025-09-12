package com.trimline.pawdep;

public  enum Gender {

     /// <remarks/>
     Female("Female",0),
     /// <remarks/>
     Male("Male",1);
    public int code;
    private String text;
    Gender(String text, int code) {
        this.code = code;
        this.text = text;
    }
    public int getCode() {
        return code;
    }
    public String getText() {
        return text;
    }
    @Override
    public String toString() {
        // you can localise this string somehow here
        return text;
    }
 }
