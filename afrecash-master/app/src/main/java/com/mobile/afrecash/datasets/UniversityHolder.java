package com.mobile.afrecash.datasets;

import java.util.ArrayList;

/**
 * Created by @GeekNat on 12/29/17.
 * All is possible
 */

public class UniversityHolder {

    private String id,name;
    private ArrayList<FacultyHolder> facultyHolders;

    public UniversityHolder(String id, String name, ArrayList<FacultyHolder> facultyHolders) {
        this.id = id;
        this.name = name;
        this.facultyHolders = facultyHolders;
    }

    public UniversityHolder(){

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

    public ArrayList<FacultyHolder> getFacultyHolders() {
        return facultyHolders;
    }

    public void setFacultyHolders(ArrayList<FacultyHolder> facultyHolders) {
        this.facultyHolders = facultyHolders;
    }
}
