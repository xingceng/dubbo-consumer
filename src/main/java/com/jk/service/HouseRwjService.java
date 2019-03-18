package com.jk.service;


import com.jk.model.*;
import com.jk.model.*;

import java.util.HashMap;
import java.util.List;

public interface HouseRwjService {



    //查询面积
    List<Acreage> queryAcreage();

    //查询楼层
    List<Louceng> queryLouCeng();

    //查询楼龄
    List<Louling> queryLouLing();

    //查询价格
    List<Privace> queryPrice();

    //查询用途
    List<Yongtu> queryYongtu();

    //查询装修
    List<Zhuangxiu> queryZhuangxiu();

    //查询户型
    List<Unit> queryHuxing();

    //查询朝向
    List<Mianxiang> queryMianxiang();

    //查询房屋
    List<House> queryfangyuan(Integer housetype);

    //查询线路
    List<Circuit> queryxianlu(Integer id);


}
