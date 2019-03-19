package com.jk.service;

import com.jk.model.PowerMenu;
import com.jk.model.Role;
import com.jk.model.Tree;
import com.jk.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserService {
    HashMap<String, Object> queryUser(Integer page, Integer rows);


    void updatPwd(User user);

    List<Role> queryRoleList();

    List<Tree> queryPowerTree(Integer roleid);

    void saveRolePower(Integer roleId, Integer[] powerIds);

    List<PowerMenu> queryPowerMenuList(Integer powerId);

    void savePowerMenu(PowerMenu menu);
}
