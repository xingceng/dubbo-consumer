package com.jk.controller;

import com.jk.model.PowerMenu;
import com.jk.model.Role;
import com.jk.model.Tree;
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

    //修改密码
    @RequestMapping("updatpwd")
    @ResponseBody
    public  void  updatPwd(User user,HttpSession session){
        User user2 = (User) session.getAttribute("user");
        Integer uid = user2.getId();
        user.setUid(uid);
        userService.updatPwd(user);
    }
    //查询角色
    @RequestMapping("queryRoleList")
    @ResponseBody
    public List<Role> queryRoleList(){
        return userService.queryRoleList();
    }
    //权限树
    @RequestMapping("queryPowerTree")
    @ResponseBody
    public List<Tree> queryPowerTree(Integer roleid){
        return userService.queryPowerTree(roleid);
    }

    @RequestMapping("saveRolePower")
    @ResponseBody
    public void saveRolePower(Integer roleId,Integer[] powerIds){
        userService.saveRolePower(roleId,powerIds);
    }

    @RequestMapping("queryPowerMenuList")
    @ResponseBody
    public List<PowerMenu> queryPowerMenuList(Integer powerId){
        return userService.queryPowerMenuList(powerId);
    }

    @RequestMapping("savePowerMenu")
    @ResponseBody
    public void savePowerMenu(PowerMenu menu){
        userService.savePowerMenu(menu);
    }

    //关注房源
    @RequestMapping("guanZhu")
    @ResponseBody
    public void guanZhu(Integer houseid,HttpSession session){
        User user2 = (User) session.getAttribute("user");
        Integer userid = user2.getId();
        userService.guanZhu(houseid,userid);
    }
}
