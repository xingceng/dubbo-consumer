package com.jk.controller;

import com.jk.model.User;
import com.jk.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    //登陆
    @RequestMapping("/loginuser")
    @ResponseBody
    public String loginuser(User user, HttpSession session) {
        String loginFlag = null;
        loginFlag = loginService.login(user);
        session.setAttribute("user", user);
        return loginFlag;
    }
}
