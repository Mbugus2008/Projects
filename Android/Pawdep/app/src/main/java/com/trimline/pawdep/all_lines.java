package com.trimline.pawdep;

import androidx.room.Embedded;
import androidx.room.Relation;

import java.util.List;

public class all_lines {


        @Embedded
        public Allocation_header aheader;
        @Relation(
                parentColumn = "No",
                entityColumn = "No"
        )
        public List<Allocation_Line> linelist;
    }

