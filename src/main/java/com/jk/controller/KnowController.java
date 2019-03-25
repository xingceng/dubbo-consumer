package com.jk.controller;

import com.jk.model.BuyHouse;
import com.jk.model.Knowledge;
import com.jk.service.KnowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class KnowController {

    @Autowired
    private KnowService knowService;

    @RequestMapping("queryKnowByPid")
    @ResponseBody
    public List<Knowledge> queryKnowByPid(Integer pid){
        return knowService.queryKnowByPid(pid);
    }

    @RequestMapping("addBuyHouse")
    @ResponseBody
    public void addBuyHouse(BuyHouse buyHouse){
        knowService.addBuyHouse(buyHouse);
    }

}
