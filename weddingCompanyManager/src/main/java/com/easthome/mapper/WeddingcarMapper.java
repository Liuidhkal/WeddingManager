package com.easthome.mapper;

import com.easthome.entity.Weddingcar;

import java.util.List;

public interface WeddingcarMapper {
    //查询所有婚车
    public List<Weddingcar> findAll();

    //根据商品id查询该商品编号的行信息
    public Weddingcar findByGoodsId(String goods_id);

    //对婚车weddingcar表的库存进行减少操作
    public void updateByCount(String c_id, Integer goodsSize);
}
