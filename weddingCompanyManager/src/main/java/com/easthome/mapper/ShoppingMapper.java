package com.easthome.mapper;

import com.easthome.entity.Dress;
import com.easthome.entity.ShoppingCar;
import com.easthome.entity.Style;
import com.easthome.entity.Weddingcar;

import java.util.List;

public interface ShoppingMapper {
    //根据 商品id 和 用户id 查询购物车表中是否存在该商品
    public List<ShoppingCar> findGoodsidAndUserid(String goods_id, Integer userId);

    //执行添加操作:style表数据添加进去
    public void insertByStyle(Style style, Integer userId);
    //weddingcar表添加进去
    public void insertByWeddingcar(Weddingcar weddingcar, Integer userId, Integer goodsSize);
    //Dress
    public void insertByDress(Dress dress, Integer userId);

    //根据商品id和用户id执行商品数量的修改操作
    public void updateGoods(String goods_id, Integer userId, Integer goodsSize);

    //查询所有
    public List<ShoppingCar> findAllByShopping(Integer userId);

    //根据购物车id删除
    public void delById(Integer id);
    //根据购物车id执行修改操作
    public void updateById(Integer id);

    //批量删除
    public void deleteAll(String[] str);
}
