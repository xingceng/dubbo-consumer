package com.jk.service;

import com.jk.model.HeTong;

import java.util.HashMap;

public interface HeService {
    //合同查询
    HashMap<String, Object> queryHeTong(Integer page,Integer rows,HeTong heTong);
    //删除合同
    void delheTong(Integer id);
    //新增合同
    void addHeTong(HeTong h);
}
