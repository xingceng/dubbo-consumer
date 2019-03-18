package com.jk.model;

import java.io.Serializable;
import java.util.Date;

public class House implements Serializable {
    private static final long serialVersionUID = 4109150726225906245L;
    private Integer houseid;   //房id
    private String  housename;  //房源名
    private Integer housetype; //房類型
    private Integer housecircuitid;  //地区id
    private Integer housepriceid; // 价格id
    private Integer houseacreageid;  //面积id
    private Integer houseunitid;  //户型id
    private Integer houseyongtuid; //用途id
    private Integer houseloucengid; //楼层id
    private Integer housemianxiang; //朝向id
    private Integer houseloulingid; //楼龄id
    private Integer housezhuangxiuid; //装修id
    private Integer housecount; //浏览量
    private Integer housestuts;//状态
    private Date    housetime;//发布时间
    private String acreagename;//面积名
    private String circuitname; //地区名
    private String loucengname; //楼层名
    private String loulingname; // 楼龄名
    private String mianxiangname;// 朝向名
    private String pricename;// 价格名
    private String unitname;// 户型名
    private String yongtuname;//用途名
    private String zhuangxiuname;// 装修名

    private  String diqu;

    public String getDiqu() {
        return diqu;
    }

    public void setDiqu(String diqu) {
        this.diqu = diqu;
    }

    public Integer getHouseid() {
        return houseid;
    }

    public void setHouseid(Integer houseid) {
        this.houseid = houseid;
    }

    public String getHousename() {
        return housename;
    }

    public void setHousename(String housename) {
        this.housename = housename;
    }

    public Integer getHousetype() {
        return housetype;
    }

    public void setHousetype(Integer housetype) {
        this.housetype = housetype;
    }

    public Integer getHousecircuitid() {
        return housecircuitid;
    }

    public void setHousecircuitid(Integer housecircuitid) {
        this.housecircuitid = housecircuitid;
    }

    public Integer getHousepriceid() {
        return housepriceid;
    }

    public void setHousepriceid(Integer housepriceid) {
        this.housepriceid = housepriceid;
    }

    public Integer getHouseacreageid() {
        return houseacreageid;
    }

    public void setHouseacreageid(Integer houseacreageid) {
        this.houseacreageid = houseacreageid;
    }

    public Integer getHouseunitid() {
        return houseunitid;
    }

    public void setHouseunitid(Integer houseunitid) {
        this.houseunitid = houseunitid;
    }

    public Integer getHouseyongtuid() {
        return houseyongtuid;
    }

    public void setHouseyongtuid(Integer houseyongtuid) {
        this.houseyongtuid = houseyongtuid;
    }

    public Integer getHouseloucengid() {
        return houseloucengid;
    }

    public void setHouseloucengid(Integer houseloucengid) {
        this.houseloucengid = houseloucengid;
    }

    public Integer getHousemianxiang() {
        return housemianxiang;
    }

    public void setHousemianxiang(Integer housemianxiang) {
        this.housemianxiang = housemianxiang;
    }

    public Integer getHouseloulingid() {
        return houseloulingid;
    }

    public void setHouseloulingid(Integer houseloulingid) {
        this.houseloulingid = houseloulingid;
    }

    public Integer getHousezhuangxiuid() {
        return housezhuangxiuid;
    }

    public void setHousezhuangxiuid(Integer housezhuangxiuid) {
        this.housezhuangxiuid = housezhuangxiuid;
    }

    public Integer getHousecount() {
        return housecount;
    }

    public void setHousecount(Integer housecount) {
        this.housecount = housecount;
    }

    public Integer getHousestuts() {
        return housestuts;
    }

    public void setHousestuts(Integer housestuts) {
        this.housestuts = housestuts;
    }

    public Date getHousetime() {
        return housetime;
    }

    public void setHousetime(Date housetime) {
        this.housetime = housetime;
    }

    public String getAcreagename() {
        return acreagename;
    }

    public void setAcreagename(String acreagename) {
        this.acreagename = acreagename;
    }

    public String getCircuitname() {
        return circuitname;
    }

    public void setCircuitname(String circuitname) {
        this.circuitname = circuitname;
    }

    public String getLoucengname() {
        return loucengname;
    }

    public void setLoucengname(String loucengname) {
        this.loucengname = loucengname;
    }

    public String getLoulingname() {
        return loulingname;
    }

    public void setLoulingname(String loulingname) {
        this.loulingname = loulingname;
    }

    public String getMianxiangname() {
        return mianxiangname;
    }

    public void setMianxiangname(String mianxiangname) {
        this.mianxiangname = mianxiangname;
    }

    public String getPricename() {
        return pricename;
    }

    public void setPricename(String pricename) {
        this.pricename = pricename;
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }

    public String getYongtuname() {
        return yongtuname;
    }

    public void setYongtuname(String yongtuname) {
        this.yongtuname = yongtuname;
    }

    public String getZhuangxiuname() {
        return zhuangxiuname;
    }

    public void setZhuangxiuname(String zhuangxiuname) {
        this.zhuangxiuname = zhuangxiuname;
    }
}
