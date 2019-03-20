package com.jk.controller;

import com.jk.model.HeTong;
import com.jk.service.HeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
