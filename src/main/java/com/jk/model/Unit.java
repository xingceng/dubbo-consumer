package com.jk.model;

import java.io.Serializable;

public class Unit implements Serializable {

    private static final long serialVersionUID = -8903548846641195430L;
    private Integer unitid;
    private String unitname;

    public Integer getUnitid() {
        return unitid;
    }

    public void setUnitid(Integer unitid) {
        this.unitid = unitid;
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }
}
