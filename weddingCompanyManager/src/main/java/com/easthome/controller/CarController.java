package com.easthome.controller;

import com.easthome.entity.Weddingcar;
import com.easthome.service.WeddingcarService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CarController {
    @Autowired
    private WeddingcarService weddingcarService;

    @RequestMapping("/carRent")
    public String carRent(){
        return "carRent";
    }

    @RequestMapping("/carRentCon")
    public ModelAndView carRentCon(@RequestParam(defaultValue = "1") Integer pageNum,
                                   @RequestParam(defaultValue = "3") Integer size){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(pageNum, size);
        //查询所有婚车
        List<Weddingcar> carList = weddingcarService.findAll();
        PageInfo<Weddingcar> wedCarPageInfo = new PageInfo<>(carList);

        mv.addObject("wedCarPageInfo", wedCarPageInfo);
        mv.setViewName("carRent");
        //写完查询并分页的内容 需要前端接收并展示婚车数据
        return mv;
    }
}
