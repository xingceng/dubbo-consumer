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

    @RequestMapping("/toBroker")
    public String toBroker() {
        return "broker/brolist";
    }
}
