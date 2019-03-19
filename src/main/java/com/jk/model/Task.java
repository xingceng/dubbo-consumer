package com.jk.model;

import java.io.Serializable;

public class Task implements Serializable {
    private static final long serialVersionUID = -7829131289978535480L;
    private Integer id;
    private Integer htid;
    private String content;
    private Integer supportid;
    private String phone;
    private String email;
    private String hname;

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHtid() {
        return htid;
    }

    public void setHtid(Integer htid) {
        this.htid = htid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getSupportid() {
        return supportid;
    }

    public void setSupportid(Integer supportid) {
        this.supportid = supportid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
