package com.easthome.controller;

import com.easthome.entity.ShoppingCar;
import com.easthome.entity.Style;
import com.easthome.service.ShoppingService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/*
* 购物车
* */
@Controller
public class ShoppingController {
    @Autowired
    private ShoppingService shoppingService;

    /*
    * 该方法执行购物车的添加操作
    * */
    @RequestMapping("/shoppingCon")
    public ModelAndView shoppingCon(@RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "4") Integer size, HttpSession session){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(pageNum, size);

        //获取用户id
        int userId = (int)session.getAttribute("userId");
        //查询该用户所有
        List<ShoppingCar> carList = shoppingService.findAllByShopping(userId);
        PageInfo<ShoppingCar> carPageInfo = new PageInfo<>(carList);

        mv.addObject("carPageInfo", carPageInfo);
        mv.setViewName("shoppingCar");

        return mv;
    }

    @RequestMapping("/shoppingCar")
    public String shoppingCar(){

        return "shoppingCar";
    }


    /*
    * 该方法执行添加购物车的操作
    * */
    @RequestMapping("addCar")
    @ResponseBody
    public String addCar(String goods_id, HttpSession session,
                         @RequestParam(defaultValue = "1") Integer goodsSize){
        //获取session中的当前登录用户id
        int userId =(int) session.getAttribute("userId");

        //根据 商品id 和 用户id 查询购物车表中是否存在该商品
        //如果存在，对数量+1，不存在则添加
        //System.out.println(goods_id);
        boolean flag = shoppingService.findGoodsidAndUserid(goods_id, userId, goodsSize);

        if (flag){
            //添加成功
            return "ok";
        }
        return "no";
    }

    /*
    * 该方法执行购物车的删除操作
    * */
    @RequestMapping("/delCar")
    @ResponseBody
    public String delCar(Integer id, Integer number){

        //调用方法执行删除操作，1.如果该商品的数量大于1 执行数量-1操作，
        //2.如果商品数量等于1 执行删除操作

        boolean flag = shoppingService.delPanduan(id, number);
        if (flag){
            return "ok";
        }

        return "no";
    }

    /*
    * 批量删除
    * */
    @RequestMapping("/deleteAll")
    @ResponseBody
    public String deleteAll(String id){
        //System.out.println(id);
        String[] str = id.split(",");
        shoppingService.deleteAll(str);
        return "ok";
    }
}
