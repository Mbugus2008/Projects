package com.trimline.pawdep;

public enum Loan_Category {

Perfoming("Performing", 0),

/// <remarks/>
Watch("Watch", 1),

/// <remarks/>
Substandard("Substandard", 2),

/// <remarks/>
Doubtful("Doubtful", 3),

/// <remarks/>
Loss("Loss", 4);
public int code;
private String text;


Loan_Category(String text, int code) {
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
