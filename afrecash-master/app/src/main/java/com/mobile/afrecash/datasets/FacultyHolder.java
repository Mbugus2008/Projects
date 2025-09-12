package com.mobile.afrecash.datasets;

import java.util.ArrayList;

/**
 * Created by @GeekNat on 12/29/17.
 * All is possible
 */

public class FacultyHolder {
    private String id,name;
    private ArrayList<DepartmentHolder> departmentHolders;

    public FacultyHolder(String id, String name, ArrayList<DepartmentHolder> departmentHolders) {
        this.id = id;
        this.name = name;
        this.departmentHolders = departmentHolders;
    }

    public FacultyHolder(){

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<DepartmentHolder> getDepartmentHolders() {
        return departmentHolders;
    }

    public void setDepartmentHolders(ArrayList<DepartmentHolder> departmentHolders) {
        this.departmentHolders = departmentHolders;
    }
}
