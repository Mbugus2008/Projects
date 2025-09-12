package com.trimline.paul.metro;
/**
 * Created by Paulo on 3/8/2017.
 */

public class types {
  public String  Code;
  public String  Name;
   public boolean   Active;
  public boolean Attach_to_vehicle;
  public int Order;
  public int Type;
  @Override
  public String toString() {
    return this.Name;
  }
}
