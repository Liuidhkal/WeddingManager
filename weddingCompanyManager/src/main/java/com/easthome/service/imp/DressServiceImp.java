package com.easthome.service.imp;

import com.easthome.entity.Dress;
import com.easthome.mapper.DressMapper;
import com.easthome.service.DressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DressServiceImp implements DressService {
    @Autowired
    private DressMapper dressMapper;

    @Override
    public List<Dress> findAll() {
        return dressMapper.findAll();
    }
}
