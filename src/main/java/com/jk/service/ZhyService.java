package com.jk.service;

import com.jk.model.House;

import java.util.HashMap;

public interface ZhyService {

   //查询面积
    HashMap<String,Object> queryAcreage(Integer page, Integer rows);
   //查询楼层
    HashMap<String,Object> queryLouCeng(Integer page, Integer rows);
   //查询楼龄
    HashMap<String,Object> queryLouLing(Integer page, Integer rows);
  //查询价格
    HashMap<String,Object> queryPrice(Integer page, Integer rows);
  //查询用途
    HashMap<String,Object> queryYongtu(Integer page, Integer rows);
   //查询装修
    HashMap<String,Object> queryZhuangxiu(Integer page, Integer rows);
  //查询户型
    HashMap<String,Object> queryHuxing(Integer page, Integer rows);
  //查询朝向
    HashMap<String,Object> queryMianxiang(Integer page, Integer rows);
  //查询房屋
    HashMap<String,Object> queryFangwu(Integer typeid, Integer page, Integer rows);

    //新增房源
    void addHouse(House house);
}
