package com.trimline.pawdep;

public  enum Product_Category {
    /// <remarks/>
    Short_Term("Short_Term",0),
    /// <remarks/>
    Long_Term("Long_Term",0);
    public int code;
    private String text;
    Product_Category(String text, int code) {
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
