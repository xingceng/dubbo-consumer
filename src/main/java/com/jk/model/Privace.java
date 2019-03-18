package com.jk.model;

import java.io.Serializable;

public class Privace implements Serializable {
    private static final long serialVersionUID = 5343140252809949530L;
    private Integer priceid;
    private String pricename;

    public Integer getPriceid() {
        return priceid;
    }

    public void setPriceid(Integer priceid) {
        this.priceid = priceid;
    }

    public String getPricename() {
        return pricename;
    }

    public void setPricename(String pricename) {
        this.pricename = pricename;
    }
}
