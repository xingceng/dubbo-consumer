package com.jk.model;

import java.io.Serializable;

public class HeTong implements Serializable {
    private static final long serialVersionUID = 8179649336284505870L;
    private Integer id;
    private String phone;
    private String email;
    private String card;
    private String cardimg;
    private Integer hid;
    private Integer price;
    private String deadline;
    private String comment;
    private Integer brokerid;
    private String latedate;
    private Integer status;
    private String  hname;
    private String brokername;

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getBrokername() {
        return brokername;
    }

    public void setBrokername(String brokername) {
        this.brokername = brokername;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getCardimg() {
        return cardimg;
    }

    public void setCardimg(String cardimg) {
        this.cardimg = cardimg;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getBrokerid() {
        return brokerid;
    }

    public void setBrokerid(Integer brokerid) {
        this.brokerid = brokerid;
    }

    public String getLatedate() {
        return latedate;
    }

    public void setLatedate(String latedate) {
        this.latedate = latedate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
