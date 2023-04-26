package com.easthome.service.imp;

import com.easthome.entity.Dress;
import com.easthome.entity.ShoppingCar;
import com.easthome.entity.Style;
import com.easthome.entity.Weddingcar;
import com.easthome.mapper.DressMapper;
import com.easthome.mapper.ShoppingMapper;
import com.easthome.mapper.StyleMapper;
import com.easthome.mapper.WeddingcarMapper;
import com.easthome.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImp implements ShoppingService {
    @Autowired
    private ShoppingMapper shoppingMapper;
    //引入style表
    @Autowired
    private StyleMapper styleMapper;
    //引入Weddingcar表
    @Autowired
    private WeddingcarMapper weddingcarMapper;
    //引入DressMapper
    @Autowired
    private DressMapper dressMapper;

    @Override
    public boolean findGoodsidAndUserid(String goods_id, Integer userId, Integer goodsSize) {
        //定义一个布尔标记
        boolean flag = false;

        //截取goods_id的字符串第一个，判断是那种类型的商品
        String subG = goods_id.substring(0, 1);

        //根据商品id和用户id查询到的商品数据，1.如果list长度为0 说明不存在该商品 执行insert添加操作
        //                               2.如果list长度不为0，则执行该商品数量的修改操作
        List<ShoppingCar> list = shoppingMapper.findGoodsidAndUserid(goods_id, userId);

        if (list.size() == 0){//执行这里，说明购物车表中没有该商品，执行添加操作
            //获取该商品id的商品信息

            //判断是哪种类型的商品
            if (subG.equals("s")){//说明是婚礼主题style的商品表

                //根据商品编号查询该行数据
                Style styleByGoodsId = styleMapper.findByGoodsId(goods_id);

                //将该商品信息和当前用户id添加进购物车
                shoppingMapper.insertByStyle(styleByGoodsId, userId);

                //加入购物车成功 将布尔标记改为true
                flag = true;
            }else if (subG.equals("c")){//说明是婚车租赁的weddingcar表

                //根据商品编号查询该行数据
                Weddingcar weddingcarByGoodsId = weddingcarMapper.findByGoodsId(goods_id);

                //将该商品信息和当前用户id添加进购物车 还有添加的数量
                shoppingMapper.insertByWeddingcar(weddingcarByGoodsId, userId, goodsSize);

                //对婚车Weddingcar表的库存进行减少操作  减少goodsSize数量
                weddingcarMapper.updateByCount(goods_id, goodsSize);

                flag = true;
            }else if (subG.equals("d")){//礼服
                //System.out.println("#1");
                //根据商品编号查询该行数据
                Dress dress = dressMapper.findByGoodsId(goods_id);
               // System.out.println("#2");
                //将该商品信息和当前用户id添加进购物车
                shoppingMapper.insertByDress(dress, userId);
                //System.out.println("#3");
                flag = true;

            }


        }else {//list长度不为0，执行该商品数量的修改操作
            //根据商品id和用户id执行 购物车表 的商品数量的修改操作
            shoppingMapper.updateGoods(goods_id, userId, goodsSize);

            if (subG.equals("c")){
                //如果是车的话，对weddingcar的婚车表库存数量进行减少
                weddingcarMapper.updateByCount(goods_id, goodsSize);
            }

            flag = true;
        }

        return flag;
    }

    @Override
    public List<ShoppingCar> findAllByShopping(Integer userId) {
        return shoppingMapper.findAllByShopping(userId);
    }

    @Override
    public boolean delPanduan(Integer id, Integer number) {
        //打布尔标记
        boolean flag = false;

        //判断数量是否为1
        if (number == 1){
            //执行删除操作
            shoppingMapper.delById(id);
            flag=true;
        }else {
            //修改 执行数量-1操作
            shoppingMapper.updateById(id);
            flag=true;
        }

        return flag;
    }

    @Override
    public void deleteAll(String[] str) {
        shoppingMapper.deleteAll(str);
    }
}
