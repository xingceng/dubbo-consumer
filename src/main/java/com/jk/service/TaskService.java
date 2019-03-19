package com.jk.service;

import com.jk.model.Task;

import java.util.HashMap;

public interface TaskService {
    //新增任务
    void save(Task task);
    //根据合同id查询任务表
    Task queryRWById(Integer id);
    //根据合同id修改合同状态
    void updateHeTong(Integer id,Integer status);
    //随机从经纪人表中取出一条数据id
    int random();
    //查询任务表
    HashMap<String, Object> queryTask(Integer page, Integer rows,Task task);
}
