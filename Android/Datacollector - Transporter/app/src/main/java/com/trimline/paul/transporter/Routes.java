package com.trimline.paul.transporter;

public  class Routes
{
    public String Code ;
    public String Description;
    @Override
    public String toString() {
        return this.Description;
    }
    public  static Routes currentroute;
}
