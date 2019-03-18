package com.jk.model;

import java.io.Serializable;

public class Acreage  implements Serializable {

    private static final long serialVersionUID = 7155679532245417975L;
    private Integer acreageid; //面积
    private String acreagename; //面积

    public Integer getAcreageid() {
        return acreageid;
    }

    public void setAcreageid(Integer acreageid) {
        this.acreageid = acreageid;
    }

    public String getAcreagename() {
        return acreagename;
    }

    public void setAcreagename(String acreagename) {
        this.acreagename = acreagename;
    }
}

