package com.jk.service;

import com.jk.model.Tree;
import com.jk.model.User;

import java.util.List;

public interface LoginService {

    User queryUserByLoginNumber(String username);

    List<Tree> queryNavTree();
}
