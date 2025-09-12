package com.openvalley.afrecash.datasets;

/**
 * Created by @GeekNat on 12/29/17.
 * All is possible
 */

public class DepartmentHolder {
    private String id,name;

    public DepartmentHolder(String id, String name) {
        this.id = id;
        this.name = name;
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
}
