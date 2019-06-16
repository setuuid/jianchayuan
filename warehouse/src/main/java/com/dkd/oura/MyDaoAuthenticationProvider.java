package com.dkd.oura;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.util.StringUtils;

import com.dkd.system.bo.User;



public class MyDaoAuthenticationProvider extends DaoAuthenticationProvider {
    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails,
                                                  UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {
        // TODO Auto-generated method stub
        //super.additionalAuthenticationChecks(userDetails, authentication);
        Object salt = null;
 
        if (this.getSaltSource() != null) {
            salt = this.getSaltSource().getSalt(userDetails);
        }

        if (authentication.getCredentials() == null) {
            logger.debug("Authentication failed: no credentials provided");

            throw new BadCredentialsException(messages.getMessage(
                    "AbstractUserDetailsAuthenticationProvider.badCredentials", "登录失败"), userDetails);
        }
        User user = (User) getUserDetailsService().loadUserByUsername(userDetails.getUsername());
       //控制用户登录的ip
        String remoteAddress = null;
        Object details = authentication.getDetails();
        if (details instanceof WebAuthenticationDetails) {
             WebAuthenticationDetails webDetails = (WebAuthenticationDetails) details;
             remoteAddress = webDetails.getRemoteAddress();
             remoteAddress=remoteAddress.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : remoteAddress;
        }
        // 例行null检查远程ip，若空，可以直接返回或异常
        if (remoteAddress == null || remoteAddress.trim().length() == 0) {
                throw new BadCredentialsException(
                        messages
                                .getMessage("framework.security.notAuthorizedIp"));
        }
        String validAddress = user.getUserip();
        
        
        //如果未限定ip，返回
//        if (validAddress == null || validAddress.trim().length() == 0) {
//              throw new BadCredentialsException(messages.getMessage(
//                    "AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"), userDetails);
//        }
        if (validAddress != null && validAddress.trim().length() > 0) {
            
      
        //检查ip有效性
        if (!validateRemoteAddress(validAddress, remoteAddress)) {

            throw new BadCredentialsException(messages.getMessage(
                    "AbstractUserDetailsAuthenticationProvider.badCredentials", "登录失败,登录ip受限制！"), userDetails);
        }
        String presentedPassword = authentication.getCredentials().toString();
     
        /*if(user.getUkey()!=null&&user.getUkey()!=""&&presentedPassword.startsWith("ukey")){*/
        if (presentedPassword.length() == 32) {
//            System.out.println(userDetails.getPassword());
//            System.out.println(presentedPassword);
//            System.out.println(getPasswordEncoder().isPasswordValid(userDetails.getPassword(), presentedPassword, null));
            if (!userDetails.getPassword().equals(presentedPassword)) {
                logger.debug("Authentication failed: password does not match stored value");

                throw new BadCredentialsException(messages.getMessage(
                        "AbstractUserDetailsAuthenticationProvider.badCredentials", "用户名和密码不正确"), userDetails);
            }
        } else {
            if (!getPasswordEncoder().isPasswordValid(userDetails.getPassword(), presentedPassword, salt)) {
                logger.debug("Authentication failed: password does not match stored value");

                throw new BadCredentialsException(messages.getMessage(
                        "AbstractUserDetailsAuthenticationProvider.badCredentials", "用户名和密码不正确"), userDetails);
            }
        }
        }else{
        	String presentedPassword = authentication.getCredentials().toString();
            
            /*if(user.getUkey()!=null&&user.getUkey()!=""&&presentedPassword.startsWith("ukey")){*/
            if (presentedPassword.length() == 32) {
//                System.out.println(userDetails.getPassword());
//                System.out.println(presentedPassword);
//                System.out.println(getPasswordEncoder().isPasswordValid(userDetails.getPassword(), presentedPassword, null));
                if (!userDetails.getPassword().equals(presentedPassword)) {
                    logger.debug("Authentication failed: password does not match stored value");

                    throw new BadCredentialsException(messages.getMessage(
                            "AbstractUserDetailsAuthenticationProvider.badCredentials", "用户名和密码不正确"), userDetails);
                }
            } else {
                if (!getPasswordEncoder().isPasswordValid(userDetails.getPassword(), presentedPassword, salt)) {
                    logger.debug("Authentication failed: password does not match stored value");

                    throw new BadCredentialsException(messages.getMessage(
                            "AbstractUserDetailsAuthenticationProvider.badCredentials", "用户名和密码不正确"), userDetails);
                }
            }
        }
    }

    @Override
    protected void doAfterPropertiesSet() throws Exception {
        // TODO Auto-generated method stub
        super.doAfterPropertiesSet();
    }

    @Override
    public void setPasswordEncoder(Object passwordEncoder) {
        // TODO Auto-generated method stub
        super.setPasswordEncoder(passwordEncoder);
    }

    @Override
    protected PasswordEncoder getPasswordEncoder() {
        // TODO Auto-generated method stub
        return super.getPasswordEncoder();
    }

    @Override
    public void setSaltSource(SaltSource saltSource) {
        // TODO Auto-generated method stub
        super.setSaltSource(saltSource);
    }

    @Override
    protected SaltSource getSaltSource() {
        // TODO Auto-generated method stub
        return super.getSaltSource();
    }

    @Override
    public void setUserDetailsService(UserDetailsService userDetailsService) {
        // TODO Auto-generated method stub
        super.setUserDetailsService(userDetailsService);
    }

    @Override
    protected UserDetailsService getUserDetailsService() {
        // TODO Auto-generated method stub
        return super.getUserDetailsService();
    }
    public static final String getIpAddr(final HttpServletRequest request)  
            throws Exception {  
        if (request == null) {  
            throw (new Exception("getIpAddr method HttpServletRequest Object is null"));  
        }  
        String ipString = request.getHeader("x-forwarded-for");  
        if (StringUtils.isEmpty(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
            ipString = request.getHeader("Proxy-Client-IP");  
        }  
        if (StringUtils.isEmpty(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
            ipString = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (StringUtils.isEmpty(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
            ipString = request.getRemoteAddr();  
        }  
      
        // 多个路由时，取第一个非unknown的ip  
        final String[] arr = ipString.split(",");  
        for (final String str : arr) {  
            if (!"unknown".equalsIgnoreCase(str)) {  
                ipString = str;  
                break;  
            }  
        }  
      
        return ipString;  
    }  
    private boolean validateRemoteAddress(String validAddress,
            String remoteAddress) {
        // 逗号，分号分割多个ip
    	if(validAddress.indexOf(",")>0){
    		 String[] address = validAddress.split(",");
    	        if (address != null && address.length > 0) {
    	            for (String addr : address) {
    	                if (match(addr, remoteAddress))
    	                    return true;
    	            }
    	        }
    	}else{
    		String address=validAddress;
    		 if (address != null && address!="") {
 	                if (match(address, remoteAddress))
 	                    return true;
 	        }
    	}
       
        return false;
    }
 
    private boolean match(String addr, String remoteAddress) {
        // 用各种正则表达式等验证IP有效性，省略... ...
        if (remoteAddress.matches(addr)) {
            return true;
        }
       
        // 围在有效IP里，则false
        return false;
    }
}
