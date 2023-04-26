package com.easthome.service.imp;

import com.easthome.entity.Style;
import com.easthome.mapper.StyleMapper;
import com.easthome.service.StyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StyleServiceImp implements StyleService {
    @Autowired
    private StyleMapper styleMapper;
    @Override
    public List<Style> findAllByStyle() {
        return styleMapper.findAllByStyle();
    }
}
