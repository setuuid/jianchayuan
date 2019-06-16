package com.dkd.oura;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证登陆用户名密码
 *
 * @author sy
 */

public class PUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	 public static final String SPRING_SECURITY_FORM_REDERICT_KEY = "spring-security-redirect";
	 private String redirectParameter = SPRING_SECURITY_FORM_REDERICT_KEY;  
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (!request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }
        
        String username = obtainUsername(request);
        String password = obtainPassword(request);
        String redirectUrl = obtainRedercitUrl(request);
        username = username.trim();
      //自定义回调URL，若存在则放入Session  
        if(redirectUrl != null && !"".equals(redirectUrl)){  
            request.getSession().setAttribute("callCustomRediretUrl", redirectUrl);  
        }  
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
        setDetails(request, authRequest);
        return this.getAuthenticationManager().authenticate(authRequest);
    }
    protected String obtainRedercitUrl(HttpServletRequest request) {
        return request.getParameter(redirectParameter);
    }

}
