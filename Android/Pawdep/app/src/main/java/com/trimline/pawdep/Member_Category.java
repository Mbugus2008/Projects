package com.trimline.pawdep;

public  enum Member_Category {

        /// <remarks/>
        Member("Member",0),

        /// <remarks/>
        Staff("Staff",1);

        private int code;

    public void setCode(int code) {
        this.code = code;
    }

    public void setText(String text) {
        this.text = text;
    }

    private String text;
        Member_Category(String text, int code) {
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
