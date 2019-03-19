package com.jk.service;

import com.jk.model.User;

import java.util.HashMap;

public interface UserService {
    HashMap<String, Object> queryUser(Integer page, Integer rows);


    void updatPwd(User user);
}
