package com.easthome.service;

import com.easthome.entity.User;

import java.util.List;

public interface UserService {

    //验证账号密码是否正确
    public List<User> findByUsernameAndPassword(User user);
    //验证头像
    public List<User> findByUsernmae(String username);
    //注册
    public void insert(User user);
}
