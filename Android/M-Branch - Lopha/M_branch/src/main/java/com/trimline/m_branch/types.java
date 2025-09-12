package com.trimline.m_branch;

import androidx.annotation.NonNull;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

/**
 * Created by Paulo on 3/8/2017.
 */
@Entity
public class types {
  @PrimaryKey
  @NonNull
  public String  Code;
  public String  Name;
   public boolean   Active;
  public boolean Attach_to_vehicle;
  public int Order;
  @Override
  public String toString() {
    return this.Name;
  }
}
