package com.jk.controller;

import com.jk.model.BuyHouse;
import com.jk.model.LookHouse;
import com.jk.model.UserApply;
import com.jk.model.House;
import com.jk.service.ZylService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;

@Controller
public class ZylController {

    @Autowired
    private ZylService zylService;
//==============================================================================================
    //网站用户申请看房 查询
    @RequestMapping("queryUserApply")
    @ResponseBody
    public HashMap<String,Object> queryUserApply(Integer rows, Integer page, UserApply u){
        return zylService.queryUserApply(rows,page,u);
    }
    @RequestMapping("queryUserApply0")
    @ResponseBody
    public HashMap<String,Object> queryUserApply0(Integer rows, Integer page, UserApply u){
        return zylService.queryUserApply0(rows,page,u);
    }
    @RequestMapping("queryUserApply1")
    @ResponseBody
    public HashMap<String,Object> queryUserApply1(Integer rows, Integer page, UserApply u){
        return zylService.queryUserApply1(rows,page,u);
    }
    //网站用户申请看房 新增 修改
    @RequestMapping("addUserApply")
    @ResponseBody
    public void addUserApply(UserApply  u){
        zylService.addUserApply(u);
    }
    //网站用户申请看房  回显
    @RequestMapping("queryUserApplyById")
    @ResponseBody
    public UserApply queryUserApplyById(Integer id){
        return zylService.queryUserApplyById(id);
    }
    //网站用户申请看房 删除
    @RequestMapping("deleteUserApply")
    @ResponseBody
    public void deleteUserApply(String ids){
        zylService.deleteUserApply(ids);
    }

    @RequestMapping("updateBro")
    @ResponseBody
    public void updateBro(Integer id,Integer brid){
        zylService.updateBro(id,brid);
    }
//=============================================================================================
    //看房记录  查询
    @RequestMapping("queryLookHouse")
    @ResponseBody
    public HashMap<String,Object> queryLookHouse(Integer rows, Integer page, LookHouse l){
        return zylService.queryLookHouse(rows,page,l);
    }
    //看房记录 新增 修改
    @RequestMapping("addLookHouse")
    @ResponseBody
    public void addLookHouse(LookHouse l){
        zylService.addLookHouse(l);
    }
    //看房记录   回显
    @RequestMapping("queryLookHouseById")
    @ResponseBody
    public LookHouse queryLookHouseId(Integer id){
        return zylService.queryLookHouseById(id);
    }
    //看房记录  删除
    @RequestMapping("deleteLookHouse")
    @ResponseBody
    public void deleteLookHouse(String ids){
        zylService.deleteLookHouse(ids);
    }
    //===============================================================================
    //买房知识管理  查询
    @RequestMapping("queryBuyHouse")
    @ResponseBody
    public HashMap<String,Object> queryBuyHouse(Integer rows, Integer page, BuyHouse b){
        return zylService.queryBuyHouse(rows,page,b);
    }
    @RequestMapping("deleteBuyHouse")
    @ResponseBody
    public void deleteBuyHouse(String ids){
        zylService.deleteBuyHouse(ids);
    }

}
