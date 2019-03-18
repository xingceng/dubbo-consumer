package com.jk.controller;


import com.jk.model.*;
import com.jk.service.HouseRwjService;
import com.jk.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@RestController
public class HouseRwjController {

    @Autowired
    private HouseRwjService houseRwjService;



    //查询面积
    @RequestMapping("queryAcreage")
    public List<Acreage> queryAcreage() {
        List<Acreage> list = houseRwjService.queryAcreage();
        return list;
    }

    //查询楼层
    @RequestMapping("queryLouCeng")
    public List<Louceng> queryLouCeng() {
        List<Louceng> list = houseRwjService.queryLouCeng();
        return list;
    }

    //查询楼龄
    @RequestMapping("queryLouLing")
    public List<Louling> queryLouLing() {
        List<Louling> list = houseRwjService.queryLouLing();
        return list;
    }

    //查询价格
    @RequestMapping("queryPrice")
    public List<Privace> queryPrice() {
        List<Privace> list = houseRwjService.queryPrice();
        return list;
    }

    //查询用途
    @RequestMapping("queryYongtu")
    public List<Yongtu> queryYongtu() {
        List<Yongtu> list = houseRwjService.queryYongtu();
        return list;
    }

    //查询装修
    @RequestMapping("queryZhuangxiu")
    public List<Zhuangxiu> queryZhuangxiu() {
        List<Zhuangxiu> list = houseRwjService.queryZhuangxiu();

        return list;
    }

    //查询户型
    @RequestMapping("queryHuxing")
    public List<Unit> queryHuxing() {
        List<Unit> list = houseRwjService.queryHuxing();
        return list;
    }

    //查询朝向
    @RequestMapping("queryMianxiang")
    public List<Mianxiang> queryMianxiang() {
        List<Mianxiang> list = houseRwjService.queryMianxiang();
        return list;
    }

    // 房屋详情展示
    @RequestMapping("queryfangyuan")
    public List<House> queryfangyuan(Integer housetype) {
        List<House> list = houseRwjService.queryfangyuan(housetype);
        return list;
    }
    // 查询线路
    @RequestMapping("queryxianlu")
    public List<Circuit> queryxianlu(Integer id) {
        List<Circuit> list = houseRwjService.queryxianlu(id);
        return list;
    }

}
