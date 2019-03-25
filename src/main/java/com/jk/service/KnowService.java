package com.jk.service;

import com.jk.model.BuyHouse;
import com.jk.model.Knowledge;

import java.util.List;

public interface KnowService {
    //根据pid查询知识类型
    List<Knowledge> queryKnowByPid(Integer pid);
    //新增买房知识
    void addBuyHouse(BuyHouse buyHouse);
}
