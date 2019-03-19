package com.jk.service;

import com.jk.model.Broker;
import com.jk.model.House;
import com.jk.model.LookHouse;
import com.jk.model.UserApply;

import java.util.HashMap;
import java.util.List;

public interface ZylService {

    //==============================================================================================
    HashMap<String, Object> queryUserApply(Integer rows, Integer page, UserApply u);
    HashMap<String, Object> queryUserApply0(Integer rows, Integer page, UserApply u);
    HashMap<String, Object> queryUserApply1(Integer rows, Integer page, UserApply u);

    void addUserApply(UserApply u);

    UserApply queryUserApplyById(Integer id);

    void deleteUserApply(String ids);

    List<House> queryHouse();

    List<Broker> queryBroker();

    //申请看房  修改状态
    //改为 0 1 2
    void updateApplyStatus0(Integer id);
    void updateApplyStatus1(Integer id);

    void updateBro(Integer id, Integer brid);
    //==============================================================================================
    HashMap<String, Object> queryLookHouse(Integer rows, Integer page, LookHouse l);

    void addLookHouse(LookHouse l);

    LookHouse queryLookHouseById(Integer id);

    void deleteLookHouse(String ids);
}
