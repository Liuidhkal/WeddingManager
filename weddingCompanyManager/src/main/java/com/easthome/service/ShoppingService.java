package com.easthome.service;

import com.easthome.entity.ShoppingCar;

import java.util.List;

public interface ShoppingService {
    //根据 商品id 和 用户id 查询购物车表中是否存在该商品
    public boolean findGoodsidAndUserid(String goods_id, Integer userId, Integer goodsSize);

    //查询所有
    public List<ShoppingCar> findAllByShopping(Integer userId);

    //删除判断，1.如果该商品的数量大于1 执行数量-1操作， 2.如果商品数量等于1 执行删除操作
    public boolean delPanduan(Integer id, Integer number);

    //批量删除
    public void deleteAll(String[] str);
}
