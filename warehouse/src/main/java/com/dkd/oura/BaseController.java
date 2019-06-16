package com.dkd.oura;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class BaseController {
	

    @ExceptionHandler(Exception.class)
    public void handleException(Exception ex, HttpServletRequest request, HttpServletResponse response) {

        try {
            StringBuffer sb = new StringBuffer();
            sb.append("<script language='javascript'>alert('");
            sb.append("系统异常");
            sb.append("!');history.go(-1);</script>");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println(sb.toString());
            response.getWriter().flush();
            
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
