package com.easthome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/*
* 退出
* */
@Controller
public class ExitController {
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("username");
        session.removeAttribute("userId");
        return "redirect:/login.jsp";
    }
}
