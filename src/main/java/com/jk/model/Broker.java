/**
 * Copyright (C), 2015-2019, XXX有限公司
 * FileName: Broker
 * Author:   18730
 * Date:     2019/3/18 14:50
 * Description: 经纪人信息
 */
package com.jk.model;

import org.springframework.data.annotation.Transient;

import java.io.Serializable;

public class Broker implements Serializable {

    private static final long serialVersionUID = 2297594086782692032L;
    private Integer id;
    private String broName;
    private String broCover;
    private String iphone;
    private Integer province;
    private Integer city;
    private Integer broStore;
    private String mainPlot;
    private String workYear;

    @Transient
    private Integer follCount;
    private String coverage;
    private Integer daikan;
    private Integer zuping;

    public String getWorkYear() {
        return workYear;
    }

    public void setWorkYear(String workYear) {
        this.workYear = workYear;
    }

    public Integer getDaikan() {
        return daikan;
    }

    public void setDaikan(Integer daikan) {
        this.daikan = daikan;
    }

    public Integer getZuping() {
        return zuping;
    }

    public void setZuping(Integer zuping) {
        this.zuping = zuping;
    }

    public String getCoverage() {
        return coverage;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

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

    public Integer getProvince() {
        return province;
    }

    public void setProvince(Integer province) {
        this.province = province;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
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
}
