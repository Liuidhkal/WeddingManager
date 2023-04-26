package com.easthome.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.easthome.entity.User;
import com.easthome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;
import java.util.UUID;
/*
* 注册登录
* */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    /*
    * 登录验证
    * */
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){

        //将账号密码传入，获取查询到集合
        List<User> list = userService.findByUsernameAndPassword(new User(username, password));
        //System.out.println("userId = " + userId);
        if (list.size() != 0){//说明账号密码正确
            Integer userId = list.get(0).getId();

            //获取头像虚拟路径
            String profile = list.get(0).getProfile();
            session.setAttribute("profile",profile);

            //向session中传入用户名
            session.setAttribute("username", username);
            //传入id 用于区分每个用户的购物车
            session.setAttribute("userId", userId);
            //重定向到登陆成功页面
            return "home";
        }else {//登录失败
            //重新回到登录界面,向前端显示语句
            session.setAttribute("message2", "账号或密码错误，请重新输入！");
            return "redirect:/login.jsp";
        }

    }

    /*
    * 头像验证
    * */
    @RequestMapping("/checkprofile")
    @ResponseBody
    public String checkprofile(String username){
        List<User> list = userService.findByUsernmae(username);
        if (list.size() != 0){//存在头像
            String profile = list.get(0).getProfile();
            if (profile == null){
                return "null";
            }else {
                return profile;
            }
        }else {
            return "null";
        }
    }

    @RequestMapping("/success")
    public String success(){
        return "home";
    }

    /*
    * 注册用户名重复验证
    * */
    @RequestMapping("/check")
    @ResponseBody
    public String check(String username){
        List<User> list = userService.findByUsernmae(username);
        if (list.size() == 0){
            //说明数据库中没有该账户
            return "0";
        }else {
            return "1";
        }
    }

    /*
    * 注册文件上传
    * */
    @RequestMapping("/register")
    public String register(String username, String password, MultipartFile profile) throws ServletException, IOException {

        //获取二进制文件
        //Part profile = req.getPart("profile");

       /* //获取输入流
        InputStream inputStream = profile.getInputStream();
        //调用工具类上传头像文件,在工具类中把头像下载到本地硬盘中，返回了一个加了随机名的头像名称
        String xvNiPath = IOUtils.imgLoad(inputStream, profile.getOriginalFilename());*/
        String uuName = UUID.randomUUID().toString();
        String xvNiPath = uuName+profile.getOriginalFilename();

        //存
        profile.transferTo(new File("D:\\JAVALianxi\\MySQLConfig\\"+xvNiPath));

        User user = null;
        if (profile.getOriginalFilename().length() != 0){//如果上传的文件名长度不为0

            //employee = new Employee(username, password,"10.11.7.166:8080/MySQLConfig/"+xvNiPath);
            user = new User(username, password,
                    InetAddress.getLocalHost().getHostAddress()+":8080/MySQLConfig/"+xvNiPath);
            //System.out.println("存的头像"+employee.getProfile());
        } else {
            user = new User(username,password);
        }

        //调用业务层的注册方法进行注册
        userService.insert(user);
        return "redirect:/zhuceSuccess";
    }

    @RequestMapping("/zhuceSuccess")
    public String zhuceSuccess(){
        return "zhuceSuccess";
    }

    @RequestMapping("/code")
    public void code(HttpServletResponse response, HttpSession session) throws IOException {
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100,4,100);
        //获取验证码的值
        String myCode = lineCaptcha.getCode();
        session.setAttribute("myCode", myCode);

        lineCaptcha.write(response.getOutputStream());
        response.getOutputStream().close();
    }

    @RequestMapping("/ifCode")
    @ResponseBody
    public String ifCode(String yanzhengma, HttpSession session){
        //获取图片的验证码
        String myCode =(String) session.getAttribute("myCode");

        if (yanzhengma.equals(myCode)){
            return "ok";
        }
        return "no";
    }
}
