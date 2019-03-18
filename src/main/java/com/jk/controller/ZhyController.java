package com.jk.controller;



import com.jk.model.*;
import com.jk.service.HouseRwjService;
import com.jk.service.ZhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;


@RestController
public class ZhyController {

    @Autowired
    private ZhyService zhyService;

    @Autowired
    private HouseRwjService houseRwjService;


    //查询面积
    @RequestMapping("queryAcreage1")
    public HashMap<String,Object> queryAcreage(Integer page, Integer rows){
        return zhyService.queryAcreage(page,rows);
    }
    //查询楼层
    @RequestMapping("queryLouCeng1")
    public HashMap<String,Object> queryLouCeng(Integer page, Integer rows){
        return zhyService.queryLouCeng(page,rows);
    }
    //查询楼龄
    @RequestMapping("queryLouLing1")
    public HashMap<String,Object> queryLouLing(Integer page, Integer rows){
        return zhyService.queryLouLing(page,rows);
    }
    //查询价格
    @RequestMapping("queryPrice1")
    public HashMap<String,Object> queryPrice(Integer page, Integer rows){
        return zhyService.queryPrice(page,rows);
    }
    //查询用途
    @RequestMapping("queryYongtu1")
    public HashMap<String,Object> queryYongtu(Integer page, Integer rows){
        return zhyService.queryYongtu(page,rows);
    }
    //查询装修
    @RequestMapping("queryZhuangxiu1")
    public HashMap<String,Object> queryZhuangxiu(Integer page, Integer rows){
        return zhyService  .queryZhuangxiu(page,rows);
    }
    //查询户型
    @RequestMapping("queryHuxing1")
    public HashMap<String,Object> queryHuxing(Integer page, Integer rows){
        return zhyService .queryHuxing(page,rows);
    }
    //查询朝向
    @RequestMapping("queryMianxiang1")
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

    public void  addHouse(House house){

        zhyService.addHouse(house);
    }

    @RequestMapping("zhy")
    public String zhy(Model model){
        List<Acreage> list = houseRwjService.queryAcreage();
        model.addAttribute("bb",list);

        List<Louceng> list2= houseRwjService.queryLouCeng();
        model.addAttribute("ee",list2);

        List<Louling> list3 = houseRwjService.queryLouLing();
        model.addAttribute("hh",list3);

        List<Privace> list4 = houseRwjService.queryPrice();
        model.addAttribute("aa",list4);

        List<Zhuangxiu> list5 = houseRwjService.queryZhuangxiu();
        model.addAttribute("ii",list5);

        List<Unit> list6 = houseRwjService.queryHuxing();
        model.addAttribute("cc",list6);

        List<Mianxiang> list7 = houseRwjService.queryMianxiang();
        model.addAttribute("ff",list7);
        return  "House/addhouse";
    }











}
