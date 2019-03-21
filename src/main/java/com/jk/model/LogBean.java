package com.jk.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class LogBean implements Serializable{

    private static final long serialVersionUID = -4707821816529882366L;
    private String id;
    private Integer userId;
    private Date createDate;
    private String ip;
    private String className;
    private String method;
    private String reqParam;
    private String repParam;

    //业务字段
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end;

    private String userName;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getReqParam() {
        return reqParam;
    }

    public void setReqParam(String reqParam) {
        this.reqParam = reqParam;
    }

    public String getRepParam() {
        return repParam;
    }

    public void setRepParam(String repParam) {
        this.repParam = repParam;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "LogBean{" +
                "id='" + id + '\'' +
                ", userId=" + userId +
                ", createDate=" + createDate +
                ", ip='" + ip + '\'' +
                ", className='" + className + '\'' +
                ", method='" + method + '\'' +
                ", reqParam='" + reqParam + '\'' +
                ", repParam='" + repParam + '\'' +
                ", start=" + start +
                ", end=" + end +
                ", userName='" + userName + '\'' +
                '}';
    }
}
