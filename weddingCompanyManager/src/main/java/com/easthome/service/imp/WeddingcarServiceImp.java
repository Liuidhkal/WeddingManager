package com.easthome.service.imp;

import com.easthome.entity.Weddingcar;
import com.easthome.mapper.WeddingcarMapper;
import com.easthome.service.WeddingcarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WeddingcarServiceImp implements WeddingcarService {
    @Autowired
    private WeddingcarMapper weddingcarMapper;
    @Override
    public List<Weddingcar> findAll() {
        return weddingcarMapper.findAll();
    }
}
