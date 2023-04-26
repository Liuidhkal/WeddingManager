package com.easthome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

/*
* 这里管理总项
* */
@Controller
public class HomeController {
    @RequestMapping("/home")
    public String home(){
        return "home";
    }


    @RequestMapping("/download")
    public void download(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        FileInputStream in = null;

        //获取img
        /**/int img = Integer.parseInt(req.getParameter("img"));

        resp.setContentType("application/x-msdownload");
        //设置下载后的文件名
        String uuid = UUID.randomUUID().toString();
        resp.setHeader("Content-Disposition","attachment;filename="+uuid+"1.jpg");
        in = new FileInputStream("C:\\Users\\86156\\Desktop\\java\\图片\\100"+img+".jpg");

        byte[] bytes = new byte[1024];

        //获取输出流
        ServletOutputStream out = resp.getOutputStream();

        int count = 0;
        while((count = in.read(bytes)) != -1){
            out.write(bytes, 0, count);
        }
    }
}
