package com.jk.model;

import java.io.Serializable;

public class Mianxiang implements Serializable {
    private static final long serialVersionUID = 4613038974596368090L;
    private Integer mianxiangid;
    private String mianxiangname;

    public Integer getMianxiangid() {
        return mianxiangid;
    }

    public void setMianxiangid(Integer mianxiangid) {
        this.mianxiangid = mianxiangid;
    }

    public String getMianxiangname() {
        return mianxiangname;
    }

    public void setMianxiangname(String mianxiangname) {
        this.mianxiangname = mianxiangname;
    }
}
