package com.jk.controller;

import com.jk.model.User;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //后台用户列表
    @RequestMapping("queryUser")
    @ResponseBody
    public HashMap<String,Object> queryUser(Integer page,Integer rows){
        return userService.queryUser(page,rows);
    }


    @RequestMapping("updatpwd")
    @ResponseBody
    public  void  updatPwd(User user,HttpSession session){
        User user2 = (User) session.getAttribute("user");
        Integer uid = user2.getId();
        user.setUid(uid);
        userService.updatPwd(user);
    }
}
