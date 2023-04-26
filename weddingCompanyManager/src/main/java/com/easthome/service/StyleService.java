package com.easthome.service;

import com.easthome.entity.Style;

import java.util.List;

public interface StyleService {
    //查询style表的所有信息，并分页
    public List<Style> findAllByStyle();
}
