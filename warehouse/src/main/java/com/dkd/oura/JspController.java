package com.dkd.oura;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dkd.system.bo.Resource;
import com.dkd.system.bo.Role;
import com.dkd.system.bo.User;
import com.dkd.system.service.IUserService;
import com.dkd.utils.tree.Tree;





/**
 * 首页框架页面控制器
 *
 * @author SY
 */

@Controller
@RequestMapping(value = "/jsp")
public class JspController {

    @Autowired
    private MenuBean menuBean;
    /*@Resource
	private IUserInfoService  userInfoService;*/
    
    @javax.annotation.Resource
    private IUserService userService;

   
    
   
    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/newindex")
    public ModelAndView index(Model model) {
    	
    	User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	model.addAttribute("user", user);
        return new ModelAndView("newindex");
    }
    
    /**
     * 菜单
     * @return
     */
    @RequestMapping("/selectMenu")
    @ResponseBody
    public List<Tree> selectMenu() {
    	User user1 = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Set<Resource> Resources = new HashSet<Resource>();//权限集合
    	List<Tree> list = new ArrayList<Tree>();
    	User user = userService.selectUserMenu(user1.getUser_id());
    	if(null != user) {
    		Set<Role> roles = user.getUserRoles();//角色集合
    		for(Role role : roles) {
    			for(Resource resource :role.getResources()) {
    				Resources.add(resource);
    			}
    		}
    	}
    	for(Resource resource : removeDuplicate(Resources)) {
    		Tree tree = new Tree();
    		tree.setId(resource.getResource_id());
    		if("0".equals(resource.getParent_id())) {
    			tree.setPid(resource.getParent_id());
    		} else {
    			tree.setPid(resource.getParent_id());
    		}
    		tree.setLevel(resource.getSeq()+"");
    		tree.setText(resource.getResource_name());
    		if(null != resource.getResource_icon()) {
    			tree.setIconCls(resource.getResource_icon());
    		} 
    		Map<String, Object> attr = new HashMap<String, Object>();
    		attr.put("url", resource.getValue());
    		tree.setAttributes(attr);
    		list.add(tree);
    	}
    	menuSort(list);
    	return list;
    }

    /**
     * welcome
     *
     * @return
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     */
     
    @RequestMapping(value = "/index", produces = "text/html")
    public String center(Model model) throws IllegalAccessException, InvocationTargetException {
    	URLBean urlBean = new URLBean();
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<String> resourceCode = new ArrayList<>();
        for(GrantedAuthority ga:user.getAuthorities()){
            resourceCode.add(ga.getAuthority());
        }
        if(resourceCode.contains(urlBean.getUrl96011RC())){
            urlBean.setAccess960111(true);
        }

        if(resourceCode.contains(urlBean.getUrljwpyRC())){
            urlBean.setAccessJWPY(true);
        }

        if(resourceCode.contains(urlBean.getUrlkshRC())){
            urlBean.setAccessKSH(true);
        }

        if(resourceCode.contains(urlBean.getUrlspdcRC())){
            urlBean.setAccessSPDC(true);
        }

        if(resourceCode.contains(urlBean.getUrljfwRC())){
            urlBean.setAccessJFW(true);
        }

        if(resourceCode.contains(urlBean.getUrlwxdcRC())){
            urlBean.setAccessWXDC(true);
        }

        if(resourceCode.contains(urlBean.getUrlyydcRC())){
            urlBean.setAccessYYDC(true);
        }

        if(resourceCode.contains(urlBean.getUrlzhywRC())){
            urlBean.setAccessZHYW(true);
        }

        if(resourceCode.contains(urlBean.getUrlzfywRC())){
            urlBean.setAccessZFYW(true);
        }

        if(resourceCode.contains(urlBean.getUrlzfqyRC())){
            urlBean.setAccessZFQY(true);
        }
        if(resourceCode.contains(urlBean.getUrldcsxRC())){
            urlBean.setAccessDCSX(true);
        }
      
        model.addAttribute("url", urlBean);
      
       
        return "index";
    }
    
  
    
    
    

    @RequestMapping("/callcenter")
    public ModelAndView callcenter(String callnum, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("callnum", callnum);
        model.addAttribute("user", user);
        return new ModelAndView("callcenter");
    }
    
   

    /**
     * 菜单排序
     * @param list
     * @return
     */
	
	/*private List<SysMenu> menuSort(List<SysMenu> list) { // 交换排序->冒泡排序  
		SysMenu temp = null;  
        boolean exchange = false;  
        for (int i = 0; i < list.size(); i++) {  
            exchange = false;  
            for (int j = list.size() - 2; j >= i; j--) {  
                if (list.get(j + 1).getXuhao().compareTo(list.get(j).getXuhao()) < 0) {  
                    temp = list.get(j + 1);  
                    list.set(j + 1, list.get(j));  
                    list.set(j, temp);  
                    exchange = true;  
                }  
            }  
            if (!exchange)  
                break;  
        }  
        return list;  
    } */
    
    private List<Tree> menuSort(List<Tree> list) { // 交换排序->冒泡排序  
    	Tree temp = null;  
        boolean exchange = false;  
        for (int i = 0; i < list.size(); i++) {  
            exchange = false;  
            for (int j = list.size() - 2; j >= i; j--) {  
                if (list.get(j + 1).getLevel().compareTo(list.get(j).getLevel()) < 0) {  
                    temp = list.get(j + 1);  
                    list.set(j + 1, list.get(j));  
                    list.set(j, temp);  
                    exchange = true;  
                }  
            }  
            if (!exchange)  
                break;  
        }  
        return list;  
    } 
	
	/**
	 * 去重
	 * @param set
	 * @return
	 */
	private Set<Resource> removeDuplicate(Set<Resource> set) {
		Map<String, Resource> map = new HashMap<String, Resource>();
		Set<Resource> tempSet = new HashSet<Resource>();
		for (Resource r : set) {
			if (map.get(r.getResource_id()) == null) {
				map.put(r.getResource_id(), r);
			} else {
				tempSet.add(r);
			}
		}
		set.removeAll(tempSet);
		return set;
	}
	
	/*@RequestMapping("/403.do")  
	public String error_403(){
		return "common/403";
	}*/

	public static void main(String args[]){
		 
		
		
	}

}
