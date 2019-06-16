package com.dkd.oura;


import com.dkd.system.bo.User;
import com.dkd.system.service.IUserService;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.annotation.Resource;

/**
 * spring security 用户登录
 *
 * @author SY
 */

public class PUserDetailServiceImpl implements UserDetailsService {

    
    @Resource 
    private IUserService iUserService;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	
     User user = this.iUserService.userLogin(username);
       if (user == null) {
            //插入登录失败日志
            throw new UsernameNotFoundException("用户" + username + "不存在");
        }
        return user;
    }

}