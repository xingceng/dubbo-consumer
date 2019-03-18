package com.jk.controller;



import com.jk.model.House;
import com.jk.service.ZhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


@RestController
public class ZhyController {

    @Autowired
    private ZhyService zhyService;



    //查询面积
    @RequestMapping("queryAcreage")
    public HashMap<String,Object> queryAcreage(Integer page, Integer rows){
        return zhyService.queryAcreage(page,rows);
    }
    //查询楼层
    @RequestMapping("queryLouCeng")
    public HashMap<String,Object> queryLouCeng(Integer page, Integer rows){
        return zhyService.queryLouCeng(page,rows);
    }
    //查询楼龄
    @RequestMapping("queryLouLing")
    public HashMap<String,Object> queryLouLing(Integer page, Integer rows){
        return zhyService.queryLouLing(page,rows);
    }
    //查询价格
    @RequestMapping("queryPrice")
    public HashMap<String,Object> queryPrice(Integer page, Integer rows){
        return zhyService.queryPrice(page,rows);
    }
    //查询用途
    @RequestMapping("queryYongtu")
    public HashMap<String,Object> queryYongtu(Integer page, Integer rows){
        return zhyService.queryYongtu(page,rows);
    }
    //查询装修
    @RequestMapping("queryZhuangxiu")
    public HashMap<String,Object> queryZhuangxiu(Integer page, Integer rows){
        return zhyService  .queryZhuangxiu(page,rows);
    }
    //查询户型
    @RequestMapping("queryHuxing")
    public HashMap<String,Object> queryHuxing(Integer page, Integer rows){
        return zhyService .queryHuxing(page,rows);
    }
    //查询朝向
    @RequestMapping("queryMianxiang")
    public HashMap<String,Object> queryMianxiang(Integer page, Integer rows){
        return zhyService .queryMianxiang(page,rows);
    }

    // 房屋详情展示
    @RequestMapping("queryFangwu")
    public HashMap<String,Object> queryFangwu(Integer typeid,Integer page, Integer rows){
        return zhyService .queryFangwu(page,rows,typeid);
    }


    //新增房源
    @RequestMapping("addHouse")
    public void addHouse(House house){
        zhyService.addHouse(house);
    }




}
