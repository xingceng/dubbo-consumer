package com.jk.controller;



import com.jk.model.*;
import com.jk.service.HouseRwjService;
import com.jk.service.ZhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@Controller
public class ZhyController {

    @Autowired
    private ZhyService zhyService;

    @Autowired
    private HouseRwjService houseRwjService;


    //查询面积
    @RequestMapping("queryAcreage1")
    @ResponseBody
    public HashMap<String,Object> queryAcreage(Integer page, Integer rows){
        return zhyService.queryAcreage(page,rows);
    }
    //查询楼层
    @RequestMapping("queryLouCeng1")
    @ResponseBody
    public HashMap<String,Object> queryLouCeng(Integer page, Integer rows){
        return zhyService.queryLouCeng(page,rows);
    }
    //查询楼龄
    @RequestMapping("queryLouLing1")
    @ResponseBody
    public HashMap<String,Object> queryLouLing(Integer page, Integer rows){
        return zhyService.queryLouLing(page,rows);
    }
    //查询价格
    @RequestMapping("queryPrice1")
    @ResponseBody
    public HashMap<String,Object> queryPrice(Integer page, Integer rows){
        return zhyService.queryPrice(page,rows);
    }
    //查询用途
    @RequestMapping("queryYongtu1")
    @ResponseBody
    public HashMap<String,Object> queryYongtu(Integer page, Integer rows){
        return zhyService.queryYongtu(page,rows);
    }
    //查询装修
    @RequestMapping("queryZhuangxiu1")
    @ResponseBody
    public HashMap<String,Object> queryZhuangxiu(Integer page, Integer rows){
        return zhyService  .queryZhuangxiu(page,rows);
    }
    //查询户型
    @RequestMapping("queryHuxing1")
    @ResponseBody
    public HashMap<String,Object> queryHuxing(Integer page, Integer rows){
        return zhyService .queryHuxing(page,rows);
    }
    //查询朝向
    @RequestMapping("queryMianxiang1")
    @ResponseBody
    public HashMap<String,Object> queryMianxiang(Integer page, Integer rows){
        return zhyService .queryMianxiang(page,rows);
    }

    // 房屋详情展示
    @RequestMapping("queryFangwu")
    @ResponseBody
    public HashMap<String,Object> queryFangwu(Integer typeid,Integer page, Integer rows){
        return zhyService .queryFangwu(page,rows,typeid);
    }


    //新增房源
    @RequestMapping("addHouse")
    @ResponseBody
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

        List<Yongtu> list8 = houseRwjService.queryYongtu();
        model.addAttribute("oo",list8);
        return  "House/addhouse";
    }

    @RequestMapping("/querykehu")
    @ResponseBody
    public HashMap<String,Object> querykehu(Integer page, Integer rows){
        return zhyService .querykehu(page,rows);
    }



   //新增客户
    @RequestMapping("addkehu")
    @ResponseBody
    public void addkehu(Kehu kehu){
        zhyService.addkehu(kehu);
    }


    @RequestMapping("delt")
    @ResponseBody
    public void delt(Integer kehuid){
        zhyService.delt(kehuid);
    }


    @RequestMapping("queryAreaByPid")
    @ResponseBody
    public List<Circuit> queryAreaByPid(int pid){
        return zhyService.queryAreaByPid(pid);
    }







}
