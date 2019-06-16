package com.dkd.system.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.system.bo.UserInfo;
import com.dkd.system.form.UserInfoForm;
import com.dkd.system.service.IUserInfoService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.Page;

/**
 * 用户管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/userinfo")
public class UserInfoContoller {

    @Resource
    private IUserInfoService userInfoService;

    /*@Resource
    private IUserService userService;

    @Resource
    private IRoleService roleService;

    @Resource
    private IUserRoleService userRoleService;

    @Autowired
    private UploadRepository uploadRepository;*/
    
    /**
     * 跳转用户查询页
     * @return
     */
    @RequestMapping("/query.do")
    public String query() {
    	return "system/user/query";
    }
    /**
     * 查询用户
     *
     * @param userInfoForm
     * @param model
     * @param request
     * @return
     */

    @RequestMapping("/querylist.do")
    @ResponseBody
    public JsonResult<UserInfo> query(@RequestParam (value = "page", required = false) int start,
    					@RequestParam(value = "rows",required = false) int length,
    					@RequestParam int draw,
    					@RequestParam String username,
    					@RequestParam String realname,
    					@RequestParam String sex,
    					@RequestParam String isUse
    					) {
    	
    	UserInfoForm userInfoForm= new UserInfoForm();
    	userInfoForm.setUsername(username);
    	userInfoForm.setRealname(realname);
    	userInfoForm.setSex(sex);
    	userInfoForm.setIsUse(isUse);
    	userInfoForm.setPageSize(length+"");
    	userInfoForm.setPageNow(start+"");
    	JsonResult<UserInfo> js = new JsonResult<UserInfo>();
        Map<String, Object> map = userInfoService.selectByCondition(userInfoForm);
        List<UserInfo> list =(List<UserInfo>) map.get("list");
        return js.createSuccessJsonResult(draw, Long.parseLong(((Page)map.get("page")).getTotalCount()+""), list);
       
       
    }

   /* *//**
     * 新建用户或编辑
     *
     * @param userinfo_id
     * @param model
     * @return
     *//*

    @RequestMapping("/userInfo.do")
    public String userInfo(String userinfo_id, ModelMap model) {
        UserInfoForm userInfoForm = new UserInfoForm();
        if (StringUtils.isNotEmpty(userinfo_id)) {
            UserInfo userInfo = userInfoService.selectByPk(userinfo_id);
            BeanUtils.copyProperties(userInfo, userInfoForm);
            BeanUtils.copyProperties(userInfo.getUser(), userInfoForm);
            BeanUtils.copyProperties(userInfo.getUser().getDepartment(), userInfoForm);
        }
        model.addAttribute("userInfoForm", userInfoForm);
        return "system/user/edit";
    }

    *//**
     * 校验
     *
     * @param username
     * @param response
     * @throws java.io.IOException
     *//*

    @RequestMapping("/checkUsername.do")
    public void checkCode(String username, HttpServletResponse response) throws IOException {
        response.reset();
        response.setContentType("text/html;charset=UTF-8");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("username", username);
        int count = userService.countByCondition(map);
        response.getWriter().print(count > 0 ? false : true);
    }

    *//**
     * 保存用户信息
     *
     * @param userInfoForm
     * @param errors
     * @param response
     * @throws java.io.IOException
     *//*

    @RequestMapping("/userInfoEdit.do")
    public void userInfoEdit(@Valid @ModelAttribute("userInfoForm") UserInfoForm userInfoForm, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws IOException {
        SecurityContext sc = (SecurityContext) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        User u = (User) sc.getAuthentication().getPrincipal();

        response.reset();
        response.setContentType("text/html;charset=UTF-8");
        if (errors.hasErrors()) {
        }
        if(userInfoForm.getPassword().equals(null)||"".equals(userInfoForm.getPassword())){
        Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
        	userInfoForm.setPassword(md5PasswordEncoder.encodePassword(userInfoForm.getUsername(), ""));
        }
        userInfoService.editUser(userInfoForm,u);
        response.getWriter().print("编辑用户成功");
    }

    *//**
     * 删除用户信息
     *
     * @param userinfo_id
     * @return
     *//*

    @RequestMapping("/userDelete.do")
    public String userDelete(String userinfo_id,HttpServletRequest request) {
        SecurityContext sc = (SecurityContext) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        User u = (User) sc.getAuthentication().getPrincipal();
        UserInfo userInfo = userInfoService.selectByPk(userinfo_id);
        userInfoService.deleteUser(userinfo_id,u,userInfo.getUser().getUser_id());
        return "redirect:/user/query.do";
    }

    *//**
     * 用户角色
     *
     * @param user_id
     * @param model
     * @return
     *//*

    @RequestMapping("/userRole.do")
    public String userRole(String user_id, ModelMap model) {
    	User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	RoleForm roleForm = new RoleForm();
    	if(!"120000000000".equals(user.getDepartment().getDepartment_id())){
    		roleForm.setDepartment_id(user.getDepartment().getDepartment_id());
    	}
    	Map<String, Object> map = roleService.selectByConditionA(roleForm);
        List<Role> roleList = (List<Role>) map.get("list");
        Set<Role> userRoleList = userService.selectByPk(user_id).getUserRoles();//查询用户下的角色
        for (Role r : roleList) {
            for (Role userRole : userRoleList) {
                if (userRole.getRole_id() != null) {
                    if (userRole.getRole_id().equals(r.getRole_id())) {
                        r.setChecked(true);
                    }
                }
            }
        }
        model.addAttribute("roleList", roleList);
        model.put("user_id", user_id);
        return "system/user/userRole";
    }

    *//**
     * 保存用户角色
     *
     * @param ids
     * @param user_id
     * @param response
     * @throws java.io.IOException
     *//*

    @RequestMapping("/saveUserRole.do")
    public void editUserRole(String ids, String user_id, HttpServletResponse response) throws IOException {
        response.reset();
        response.setContentType("text/html;charset=UTF-8");
        userRoleService.delete(user_id);//先删除角色
        UserRole userRole = new UserRole();
        userRole.setUser_id(user_id);
        ids = ids.substring(0, ids.length());
        String[] idss = ids.split(",");
        for (int i = 0; i < idss.length; i++) {
            userRole.setRole_id(idss[i]);
            userRoleService.insert(userRole);
        }
        response.getWriter().print("保存用户角色成功");
    }
    *//**
	 * 修改密码
	 * @param userinfo_id
	 * @param model
	 * @return
	 *//*
	@RequestMapping("/editPassword.do")  
	public String editPassword(ModelMap model){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String user_id=user.getUser_id();
		UserInfoForm userInfoForm = new UserInfoForm();
		model.addAttribute("userInfoForm", userInfoForm);
		model.addAttribute("user_id", user_id);
		return "system/user/editPassword";
	}
	*//**
	 * 校验输入密码是否正确
	 * @param user_id
	 * @param passWord
	 * @param response
	 * @throws IOException
	 *//*
	@RequestMapping("/checkPassWord.do")
	public void checkPassWord(String user_id,String passWord,HttpServletResponse response) throws IOException{
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		User user = userService.selectByPk(user_id);
		String str=md5.encodePassword(passWord, null);
		response.reset();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(user.getPassword().equals(str)?true:false);
	}
	*//**
	 * 保存密码
	 * @param userInfoForm
	 * @param model
	 * @return
	 * @throws IOException
	 *//*
	@RequestMapping("/savePassword.do")  
	public String savePassword(UserInfoForm userInfoForm,ModelMap model) {
		User user1 = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = new User();
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		user.setUser_id(userInfoForm.getUser_id());
		user.setPassword(md5.encodePassword(userInfoForm.getNewPassWord(),null));
		userService.update(user);
		SecurityContextHolder.clearContext();  
		CloseableHttpClient httpclient = HttpClients.createDefault();
		
		HttpGet httpGet = new HttpGet("http://10.93.8.33:7000/Easy7/rest/user/updateUserByUserName?userName="+user1.getUsername()+"&password="+user.getPassword());
		
		try {
			HttpResponse httpResponse = httpclient.execute(httpGet);
			String response = EntityUtils.toString(httpResponse.getEntity());
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "redirect:/";
	
	}
	
	@RequestMapping("/departmentForUserQuery.do")
    public String departmentForUserQuery(String departmentId, ModelMap model, HttpServletRequest request) {
    	UserInfoForm userInfoForm=new UserInfoForm();
		
    		userInfoForm.setDepartment_id(departmentId);
    	
        Map<String, Object> map = userInfoService.selectByCondition(userInfoForm);
        model.addAttribute("page", map.get("page"));
        model.addAttribute("pageUrl", request.getServletPath());
        model.addAttribute("list", map.get("list"));
        model.addAttribute("departmentId", departmentId);
        return "system/user/query1";
    }
	
	*//**
	 * 照片上传
	 * @param btnFile
	 * @param request
	 * @param response
	 * @return
	 *//*
	@RequestMapping(value = "/upload", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String saveUpload(@RequestParam MultipartFile[] btnFile, HttpServletRequest request, HttpServletResponse response) {

        try {
            for (MultipartFile multipartFile : btnFile) {
                if (!multipartFile.isEmpty()) {

                    byte[] picture;

                    picture = multipartFile.getBytes();
                    String wjsource = "user";
                    Upload upload = new Upload(btnFile[0].getOriginalFilename(), picture, wjsource);
                    upload.setYwlsh(UUIDGenerator.getUUID());
                    Upload u1 = uploadRepository.save(upload);
                    request.setCharacterEncoding("UTF-8");
                    response.setContentType("text/html;charset=utf-8");
                    response.setHeader("Cache-Control", "no-cache");
                    return u1.getYwlsh();
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "err";
    }
	
	*//**
	 * 查看图片
	 * @param ywlsh
	 * @param response
	 * @throws IOException
	 *//*
	@RequestMapping(params = "cmd=showimg", produces = "text/html;charset=UTF-8")

    public void downUpload(String ywlsh, HttpServletResponse response) throws IOException {

		Upload upload = uploadRepository.findOne(ywlsh);
        //设置response的编码方式
        response.setContentType("image/*");
        OutputStream myout = response.getOutputStream();
        //将b中的数据写到客户端的内存
        myout.write(upload.getContent());
        //将写入到客户端的内存的数据,刷新到磁盘
        myout.flush();
    }*/

}
