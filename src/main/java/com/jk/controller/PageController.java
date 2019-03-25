package com.jk.controller;

import com.jk.model.*;
import com.jk.service.ZylService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class PageController {
    @Autowired
    private ZylService zylService;

    @RequestMapping("/logins")
    public String toindexs() {
        return "login";
    }

    @RequestMapping("/toIndex")
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/ershoufang")
    public String toErshoufang() {
        return "House/ershoufang";
    }

    @RequestMapping("/gongyu")
    public String toGongyu() {
        return "House/gongyu";
    }

    @RequestMapping("/zufang")
    public String toZufang() {
        return "House/zufang";
    }

    @RequestMapping("/xinfang")
    public String toXinfang() {
        return "House/xinfang";
    }

    @RequestMapping("/haiwai")
    public String toHaiwai() {
        return "House/haiwai";
    }

    //页面查询任务
    @RequestMapping("/toTask")
    public String toTask(){
        return "hetong/taskshow";
    }
    //页面查询我的任务
    @RequestMapping("/toMyTask")
    public String toMyTask(){
        return "hetong/mytask";
    }

    @RequestMapping("/toUser")
    public String toUser() {
        return "User/user";
    }
    @RequestMapping("toBroker")
    public String toBroker() {
        return "broker/brolist";
    }
    //页面查询合同
    @RequestMapping("/toHeTong")
    public String toHeTong(){
        return "hetong/hetong";
    }
    @RequestMapping("/toUpdatePwd")
    public String toUpdatePwd() {
        return "User/updatePwd";
    }

    @RequestMapping("/toLog")
    public String toLog() {
        return "Log/log";

    }
    //去到 网站用户申请看房 页面
    @RequestMapping("/toUserApply")
    public String toUserApply(Model m){
        List<House> houselist = zylService.queryHouse();
        m.addAttribute("houselist", houselist);
        List<User> brolist = zylService.queryUser();
        m.addAttribute("brolist", brolist);
        return "userapply/userapply";
    }
    @RequestMapping("/toUserApply0")
    public String toUserApply0(Model m){
        List<House> houselist = zylService.queryHouse();
        m.addAttribute("houselist", houselist);
        List<User> brolist = zylService.queryUser();
        m.addAttribute("brolist", brolist);
        return "userapply/userapply0";
    }
    @RequestMapping("/toUserApply1")
    public String toUserApply1(Model m){
        List<House> houselist = zylService.queryHouse();
        m.addAttribute("houselist", houselist);
        List<User> brolist = zylService.queryUser();
        m.addAttribute("brolist", brolist);
        return "userapply/userapply1";
    }
    //去到  看房记录 页面
    @RequestMapping("/toLookHouse")
    public String toLookHouse(Model m){
        List<House> houselist = zylService.queryHouse();
        m.addAttribute("houselist", houselist);
        List<User> brolist = zylService.queryUser();
        m.addAttribute("brolist", brolist);
        return "lookhouse/lookhouse";
    }
    //去到 买房知识  页面
    @RequestMapping("/toBuyHouse")
    public String toBuyHouse(){
        return "buyhouse/buyhouse";
    }
    @RequestMapping("/tokehuList")
    public String tokehuList() {
        return "House/kehuList";
    }

    //页面查询任务反馈结果
    @RequestMapping("/toTaskBack")
    public String toTaskBack(){
        return "hetong/taskback";
    }

    @RequestMapping("/toRolePower")
    public String toRolePower() {
        return "role/rolepower";
    }
    @RequestMapping("/addhetong")
    public String addhetong(Model m){
        List<House> houselist = zylService.queryHouse();
        m.addAttribute("houselist", houselist);
        List<User> brolist = zylService.queryUser();
        m.addAttribute("brolist", brolist);
        return "hetong/addhetong";
    }
}
