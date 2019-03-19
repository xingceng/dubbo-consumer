package com.jk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("/logins")
    public String toindexs() {
        return "login";
    }

    @RequestMapping("/toIndex")
    public String toIndex() {
        return "index";
    }

    //页面查询合同
    @RequestMapping("/toHeTong")
    public String toHeTong() {
        return "hetong/hetong";
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

    @RequestMapping("/toMyTask")
    public String toMyTask(){
        return "hetong/mytask";
    }

    @RequestMapping("/toUser")
    public String toUser() {
        return "User/user";
    }

    @RequestMapping("/toUpdatePwd")
    public String toUpdatePwd() {
        return "User/updatePwd";
    }

    @RequestMapping("/toLog")
    public String toLog() {
        return "Log/log";
    }
}
