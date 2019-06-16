package com.dkd.oura;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 首页框架页面控制器
 *
 * @author SY
 */

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	 @Autowired
	  private MenuBean menuBean;
    @RequestMapping("/success")
    public String success() {
        return "redirect:/jsp/index";
    }
    @RequestMapping("")
    public String success1() {
     return "redirect:/jsp/index";
    }
    @RequestMapping("jsp")
    public String jsp() {
     return "login";
    }
    
}
