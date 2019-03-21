package com.jk.model;

import java.io.Serializable;

public class Kehu  implements Serializable {

    private static final long serialVersionUID = -7996258087789889896L;
    private Integer kehuid;//客户id
    private String kehuname;//客户名称
    private String kehuphone;//客户手机号
    private String kehucard;//客户身份证
    private String kehucardimg;//客户身份证图片
    private String kehuemail;//客户邮箱
    private String kehupassword;//客户密码

    public Integer getKehuid() {
        return kehuid;
    }

    public void setKehuid(Integer kehuid) {
        this.kehuid = kehuid;
    }

    public String getKehuname() {
        return kehuname;
    }

    public void setKehuname(String kehuname) {
        this.kehuname = kehuname;
    }

    public String getKehuphone() {
        return kehuphone;
    }

    public void setKehuphone(String kehuphone) {
        this.kehuphone = kehuphone;
    }

    public String getKehucard() {
        return kehucard;
    }

    public void setKehucard(String kehucard) {
        this.kehucard = kehucard;
    }

    public String getKehucardimg() {
        return kehucardimg;
    }

    public void setKehucardimg(String kehucardimg) {
        this.kehucardimg = kehucardimg;
    }

    public String getKehuemail() {
        return kehuemail;
    }

    public void setKehuemail(String kehuemail) {
        this.kehuemail = kehuemail;
    }

    public String getKehupassword() {
        return kehupassword;
    }

    public void setKehupassword(String kehupassword) {
        this.kehupassword = kehupassword;
    }

    @Override
    public String toString() {
        return "Kehu{" +
                "kehuid=" + kehuid +
                ", kehuname='" + kehuname + '\'' +
                ", kehuphone='" + kehuphone + '\'' +
                ", kehucard='" + kehucard + '\'' +
                ", kehucardimg='" + kehucardimg + '\'' +
                ", kehuemail='" + kehuemail + '\'' +
                ", kehupassword='" + kehupassword + '\'' +
                '}';
    }
}
