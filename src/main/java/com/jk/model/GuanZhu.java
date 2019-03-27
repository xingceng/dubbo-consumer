/**
 * @ClassName: GuanZhu
 * @Description: TODO
 * @Author: 杨明瑞
 * @Date: 2019/3/22 8:47
 * @Version: 1.0
 */
package com.jk.model;

import java.io.Serializable;

public class GuanZhu implements Serializable {

    private static final long serialVersionUID = -4131003525098683051L;
    private Integer id;
    private Integer userid;
    private Integer houseid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getHouseid() {
        return houseid;
    }

    public void setHouseid(Integer houseid) {
        this.houseid = houseid;
    }
}
