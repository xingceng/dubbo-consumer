package com.jk.service;

import com.jk.model.HeTong;
import com.jk.model.Tree;
import com.jk.model.User;

import java.util.List;

public interface LoginService {


    List<HeTong> queryHeTong();

    User queryUserByLoginNumber(String username);

    List<Tree> queryNavTree();

    int random();
}
