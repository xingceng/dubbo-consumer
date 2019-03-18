package com.jk.model;

import java.io.Serializable;

public class Louceng  implements Serializable {
    private static final long serialVersionUID = -3618702323007418685L;
    private Integer locengid;
    private String loucengname;

    public Integer getLocengid() {
        return locengid;
    }

    public void setLocengid(Integer locengid) {
        this.locengid = locengid;
    }

    public String getLoucengname() {
        return loucengname;
    }

    public void setLoucengname(String loucengname) {
        this.loucengname = loucengname;
    }
}
