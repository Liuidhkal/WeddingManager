package com.easthome.service.imp;

import com.easthome.entity.User;
import com.easthome.mapper.UserMapper;
import com.easthome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> findByUsernameAndPassword(User user) {
        return userMapper.findByUsernameAndPassword(user);
    }

    @Override
    public List<User> findByUsernmae(String username) {
        return userMapper.findByUsernmae(username);
    }

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }
}
