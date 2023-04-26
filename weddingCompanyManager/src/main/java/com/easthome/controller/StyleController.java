package com.easthome.controller;

import com.easthome.entity.Style;
import com.easthome.service.StyleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/*
* 婚礼主题管理
* */
@Controller
public class StyleController {
    @Autowired
    private StyleService styleService;

    @RequestMapping("/styleCon")
    public ModelAndView styleCon(@RequestParam(defaultValue = "1") Integer pageNum,
                           @RequestParam(defaultValue = "3") Integer size){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(pageNum, size);
        //查询所有
        List<Style> list = styleService.findAllByStyle();

        PageInfo<Style> stylePageInfo = new PageInfo<>(list);

        mv.addObject("stylePageInfo", stylePageInfo);
        mv.setViewName("style");

        return mv;
    }

    @RequestMapping("/style")
    public String style(){
        return "style";
    }
}
