package com.jk.controller;

import com.jk.model.HeTong;
import com.jk.model.User;
import com.jk.service.HeService;
import com.jk.utils.BASE64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Base64;
import java.util.HashMap;

@RestController
public class HeController {

    @Autowired
    private HeService heService;


    /**
     * 合同后台查询
     * @param page
     * @param rows
     * @param heTong
     * @return
     */
    @RequestMapping("queryHeTong")
    public HashMap<String,Object> queryHeTong(Integer page, Integer rows, HeTong heTong){
        return heService.queryHeTong(page,rows,heTong);
    }

    @RequestMapping("delheTong")
    public void delheTong(Integer id){
        heService.delheTong(id);
    }
    //新增合同
    @RequestMapping("addHeTong")
    public void addHeTong(HeTong h, HttpSession session){
        User user = (User) session.getAttribute("user");
        h.setBrokerid(user.getId());
        heService.addHeTong(h);
    }

    @RequestMapping("queryCard")
    public String queryCard(String cardimg){
        String card = BASE64.UpFileImg(cardimg);
        return card;
    }
}
