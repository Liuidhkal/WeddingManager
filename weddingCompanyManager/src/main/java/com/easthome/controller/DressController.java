package com.easthome.controller;

import com.easthome.entity.Dress;
import com.easthome.entity.Style;
import com.easthome.service.DressService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class DressController {
    @Autowired
    private DressService dressService;


    @RequestMapping("/lifuRent")
    public String lifuRent(){
        return "lifuRent";
    }

    @RequestMapping("/dressCon")
    public ModelAndView dressCon(@RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "2") Integer size){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(pageNum, size);
        //查询所有
        List<Dress> list = dressService.findAll();

        PageInfo<Dress> dressPageInfo = new PageInfo<>(list);

        mv.addObject("dressPageInfo", dressPageInfo);
        mv.setViewName("lifuRent");

        return mv;
    }
}
