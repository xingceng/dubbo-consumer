package com.jk.service;

import com.jk.model.HeTong;

import java.util.HashMap;

public interface HeService {
    HashMap<String, Object> queryHeTong(Integer page,Integer rows,HeTong heTong);
}
