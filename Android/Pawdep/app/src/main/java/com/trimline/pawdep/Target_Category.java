package com.trimline.pawdep;

public  enum Target_Category {

    /// <remarks/>
    Individual("Individual",0),

    /// <remarks/>
    Group("Group",1),

    /// <remarks/>
    Both("Both",2),

    /// <remarks/>
    Other("Other",3);
    public int code;
    private String text;
    Target_Category(String text, int code) {
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
