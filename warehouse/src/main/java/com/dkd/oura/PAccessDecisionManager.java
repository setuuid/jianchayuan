package com.dkd.oura;

import java.util.Collection;
import java.util.Iterator;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * 权限验证对比
 * @author SY
 *
 */

public class PAccessDecisionManager implements AccessDecisionManager {
	
	/**
	 * 权限验证
	 * 如变更用户与角色的关系或角色与资源的关系 必须重新登录
	 */
	
	@Override
	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
		if(configAttributes == null) {
			return;
		}
		Iterator<ConfigAttribute> iterator = configAttributes.iterator();//所请求的资源拥有的权限(一个资源对多个权限)
		while(iterator.hasNext()) {
			ConfigAttribute configAttribute = iterator.next();
			String needPermission = configAttribute.getAttribute();//访问所请求资源所需要的权限Resource_code
			System.out.println("本次请求需要的权限是********************" + needPermission);
			for(GrantedAuthority ga : authentication.getAuthorities()) {//用户所拥有的权限authentication
				System.out.println("用户的权限是********************" + ga.getAuthority());
				if(needPermission.equals(ga.getAuthority())) {
					System.out.println("权限验证通过，放行！");
					return;
				}
			}
		}
		throw new AccessDeniedException(" 没有权限访问！ ");//没有权限
	}
	
	@Override
	public boolean supports(ConfigAttribute attribute) {
		return true;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}
	
}
