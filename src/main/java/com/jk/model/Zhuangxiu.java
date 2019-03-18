package com.jk.model;

import java.io.Serializable;

public class Zhuangxiu  implements Serializable {
    private static final long serialVersionUID = 818577009483073316L;
    private Integer zhuangxiuid;
    private String zhuangxiuname;

    public Integer getZhuangxiuid() {
        return zhuangxiuid;
    }

    public void setZhuangxiuid(Integer zhuangxiuid) {
        this.zhuangxiuid = zhuangxiuid;
    }

    public String getZhuangxiuname() {
        return zhuangxiuname;
    }

    public void setZhuangxiuname(String zhuangxiuname) {
        this.zhuangxiuname = zhuangxiuname;
    }
}
