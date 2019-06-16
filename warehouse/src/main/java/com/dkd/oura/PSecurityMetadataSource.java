package com.dkd.oura;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.dkd.system.bo.Resource;
import com.dkd.system.service.IResourceService;

/**
 * 数据库中全部资源
 * 提供某个资源对应的权限定义，即getAttributes方法返回的结果。 
 * 此类在初始化时，应该取到所有资源的定义。
 * @author SY
 *
 */

public class PSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	
	private IResourceService resourceServiceImpl;
	private static List<Resource> resources;
	private static Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();

	public IResourceService getResourceServiceImpl() {
		return resourceServiceImpl;
	}

	public void setResourceServiceImpl(IResourceService resourceServiceImpl) {
		this.resourceServiceImpl = resourceServiceImpl;
	}

	public PSecurityMetadataSource(IResourceService resourceServiceImpl) {  
	    this.resourceServiceImpl = resourceServiceImpl;  
	    //System.out.println("**********系统资源初始化**********");
	    loadResourceDefine();
	}  
	
    /**
     * 加载系统中全部的权限和资源的关系
     * 如果变更资源 必须重启系统
     * @return
     */
	
    private void loadResourceDefine(){  
        resources = this.resourceServiceImpl.selectAll();
		System.out.println("系统全部资源权限个数为******************"+resources.size());
		for (Resource resource : resources) {
			System.out.println("权限为******************"+resource.getValue());
			configAttributes.add(new SecurityConfig(resource.getResource_code()));
		}
    }  
  
    /**
     * 返回所请求资源所需要的权限  
     */
    
    @Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {  
        HttpServletRequest request = ((FilterInvocation) object).getRequest();  
       
        System.out.println("当前请求为********************"+request.getRequestURI());
        
        for (Resource resource : resources) { 
        	
            if (request.getRequestURI().contains(resource.getValuea())) {
            	System.out.println("系统权限资源中发现匹配项********************"+resource.getValuea());
            	System.out.println("返回请求资源所需要的权限********************"+resource.getResource_code());
            	Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();  
            	configAttributes.add(new SecurityConfig(resource.getResource_code()));
                return configAttributes;  
            
            }  
        }  
        return null;  
    }  
    
    @Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {  
    	return null;  
  	}  

	@Override
	public boolean supports(Class<?> clazz) {  
		return true;  
	}  
  
}
