package com.dkd.oura;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class PSavedRequestAwareAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	protected final Log logger = LogFactory.getLog(this.getClass());

	
    private RequestCache requestCache = new HttpSessionRequestCache();
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        BASE64Decoder decoder = new BASE64Decoder();
        if (savedRequest == null) {
           // super.onAuthenticationSuccess(request, response, authentication);

            int flag = 0;  
            //通过提交登录请求传递需要回调的URL callCustomRediretUrl  
            if(request.getSession().getAttribute("callCustomRediretUrl") != null && !"".equals(request.getSession().getAttribute("callCustomRediretUrl"))){  
                String url = String.valueOf(request.getSession().getAttribute("callCustomRediretUrl"));  
                url=new String(decoder.decodeBuffer(url));
                //若session 存在则需要使用自定义回调的URL 而不是缓存的URL  
                super.setDefaultTargetUrl(url);  
                super.setAlwaysUseDefaultTargetUrl(true);  
                flag = 1;  
                request.getSession().setAttribute("callCustomRediretUrl", "");  
            }  
            //重设置默认URL为主页地址  
            if(flag  == 0){  
                super.setDefaultTargetUrl("/login/success");  
            }  
            super.onAuthenticationSuccess(request, response, authentication);  
             
            return;  
        }
        
        
        String targetUrlParameter = getTargetUrlParameter();
        if (isAlwaysUseDefaultTargetUrl() || (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
            requestCache.removeRequest(request, response);
            super.onAuthenticationSuccess(request, response, authentication);

            return;
        }
        
        clearAuthenticationAttributes(request);

        // Use the DefaultSavedRequest URL
        String targetUrl = savedRequest.getRedirectUrl();
        logger.debug("Redirecting to DefaultSavedRequest Url: " + targetUrl);
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
	 public void setRequestCache(RequestCache requestCache) {
	        this.requestCache = requestCache;
	    }
}
