
package com.jk.model;

import org.springframework.data.annotation.Transient;

import java.io.Serializable;

public class Broker implements Serializable {

    private static final long serialVersionUID = 2297594086782692032L;
    private Integer id;
    private String broName;
    private String broCover;
    private String iphone;
    private String areaId;
    private Integer broStore;
    private String mainPlot;

    @Transient
    private String areaName;
    @Transient
    private Integer follCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBroName() {
        return broName;
    }

    public void setBroName(String broName) {
        this.broName = broName;
    }

    public String getBroCover() {
        return broCover;
    }

    public void setBroCover(String broCover) {
        this.broCover = broCover;
    }

    public String getIphone() {
        return iphone;
    }

    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public Integer getBroStore() {
        return broStore;
    }

    public void setBroStore(Integer broStore) {
        this.broStore = broStore;
    }

    public String getMainPlot() {
        return mainPlot;
    }

    public void setMainPlot(String mainPlot) {
        this.mainPlot = mainPlot;
    }

    public Integer getFollCount() {
        return follCount;
    }

    public void setFollCount(Integer follCount) {
        this.follCount = follCount;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }
}
