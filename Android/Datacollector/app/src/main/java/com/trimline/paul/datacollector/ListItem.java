package com.trimline.paul.datacollector;

public class ListItem {
    public static final int TYPE_GROUP = 0;
    public static final int TYPE_CHILD = 1;

    public int type;
    public Summaries.Bydate group;
    public Collection child;

    public ListItem(int type, Summaries.Bydate group, Collection child) {
        this.type = type;
        this.group = group;
        this.child = child;
    }
}
