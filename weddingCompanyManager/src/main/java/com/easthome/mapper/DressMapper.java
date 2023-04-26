package com.easthome.mapper;

import com.easthome.entity.Dress;

import java.util.List;

public interface DressMapper {
    public List<Dress> findAll();

    //根据商品编号查询信息
    public Dress findByGoodsId(String d_id);
}
