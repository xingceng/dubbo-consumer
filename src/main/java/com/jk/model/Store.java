/**
 * @ClassName: Store
 * @Description: TODO
 * @Author: 杨明瑞
 * @Date: 2019/3/22 11:53
 * @Version: 1.0
 */
package com.jk.model;

import java.io.Serializable;

public class Store implements Serializable {

    private static final long serialVersionUID = 2570001832440829467L;
    private Integer id;
    private String storename;
    private Integer cityid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename;
    }

    public Integer getCityid() {
        return cityid;
    }

    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }
}
