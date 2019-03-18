package com.jk.controller;

import com.jk.model.Tree;
import com.jk.model.User;
import com.jk.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    //登陆
    @RequestMapping("login")
    @ResponseBody
    public String login(User user,String valCode,HttpSession session){
        //验证用户名
        User user2 = loginService.queryUserByLoginNumber(user.getUsername());
        if(user2==null){
            return "用户名不存在";
        }
        //验证密码
        if(!user.getPassword().equals(user2.getPassword())){
            return "密码错误";
        }
        session.setAttribute("user", user2);
        return "登录成功";
    }

    @RequestMapping("queryNavTree")
    @ResponseBody
    public List<Tree> queryNavTree(){
        return loginService.queryNavTree();
    }
}
