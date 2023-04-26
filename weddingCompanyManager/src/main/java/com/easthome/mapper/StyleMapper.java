package com.easthome.mapper;

import com.easthome.entity.Style;

import java.util.List;

public interface StyleMapper {
    //查询style表的所有信息，并分页
    public List<Style> findAllByStyle();

    //根据商品编号查询信息
    public Style findByGoodsId(String goodsId);
}
