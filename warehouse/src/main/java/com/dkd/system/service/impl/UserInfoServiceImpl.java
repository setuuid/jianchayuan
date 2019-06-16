package com.dkd.system.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.User;
import com.dkd.system.bo.UserInfo;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.UserDao;
import com.dkd.system.dao.UserInfoDao;
import com.dkd.system.form.UserInfoForm;
import com.dkd.system.service.IDepartmentService;
import com.dkd.system.service.IUserInfoService;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 用户信息service
 * @author sy
 *
 */

@Service
@Transactional
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo> implements IUserInfoService{
	
	@Resource
	private UserInfoDao userInfoDao;
	
	@Resource
	private UserDao userDao;

	@Override
	public BaseDao<UserInfo> getDao() {
		return userInfoDao;
	}
	
	@Resource
    private IDepartmentService departmentServiceImpl;
	
	/**
	 * 编辑用户
	 */
	
	@Override
	public void editUser(UserInfoForm userInfoForm,User currentUser) {
		User user=new User();
		UserInfo userInfo=new UserInfo();
		Department department = departmentServiceImpl.selectByPk(userInfoForm.getDepartment_id());
		BeanUtils.copyProperties(userInfoForm,user);
		BeanUtils.copyProperties(userInfoForm,userInfo);
		user.setDepartment(department);
		if(StringUtils.isNotEmpty(userInfoForm.getUserinfo_id())){
			//视音频用户数据同步
			String updateURL = updateUserTemplate.
					replace("{1}",user.getUser_id()).
					replace("{2}",user.getPassword()).
					replace("{3}",currentUser.getUser_id());
			
			//视音频用户数据同步
			String updateURL960111 = null;
			try {
				updateURL960111 = updateUserTemplate960111.
						replace("{1}",user.getUser_id()).
						replace("{2}",userInfo.getUserinfo_id()).
						replace("{3}",user.getPassword()).
						replace("{4}",user.getUsername()).
						replace("{5}",java.net.URLEncoder.encode(java.net.URLEncoder.encode(userInfo.getRealname(),"utf-8"),"utf-8")).
						replace("{6}",java.net.URLEncoder.encode(java.net.URLEncoder.encode(userInfo.getSex(),"utf-8"),"utf-8")).
						replace("{7}",user.getDepartment().getDepartment_id()).
						replace("{8}",user.getIsUse()).
						
						replace("{9}","Y");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			httpInvoker(updateURL);
			System.out.println(httpInvoker(updateURL960111));
			userDao.update(user);
			userInfoDao.update(userInfo);
		}else{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			user.setUser_id(UUIDGenerator.getUUID());
			userInfo.setUserinfo_id(UUIDGenerator.getUUID());
			//user.setUserInfo(userInfo);
		
			userDao.insert(user);
			userInfo.setCreate_time(sdf.format(new Date()));
			userInfo.setUser(user);
			userInfoDao.insert(userInfo);

			//视音频用户数据同步
			String createUserURL = createUserTemplate.
					replace("{1}",user.getUsername()).
					replace("{2}", user.getUser_id()).
					replace("{3}", currentUser.getUser_id()).
					replace("{4}", user.getPassword());
			
			
			//视音频用户数据同步
			String updateURL960111 = null;
			try {
				updateURL960111 = updateUserTemplate960111.
						replace("{1}",user.getUser_id()).
						//replace("{2}",user.getUserInfo().getUserinfo_id()).
						replace("{3}",user.getPassword()).
						replace("{4}",user.getUsername()).
						replace("{5}",java.net.URLEncoder.encode(java.net.URLEncoder.encode(userInfo.getRealname(),"utf-8"),"utf-8")).
						replace("{6}",java.net.URLEncoder.encode(java.net.URLEncoder.encode(userInfo.getSex(),"utf-8"),"utf-8")).
						replace("{7}",user.getDepartment().getDepartment_code()).
						replace("{8}",user.getIsUse()).
						
						replace("{9}","N");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			httpInvoker(createUserURL);
			System.out.println(httpInvoker(updateURL960111));
			
			
			
			
			
		}
	}

	@Override
	public void deleteUser(String primaryID, User currentUser,String user_id) {
		userDao.delete(primaryID);
		String deleteUserURL = deleteUserTemplate.
				replace("{1}", user_id).
				replace("{2}", currentUser.getUser_id());
		String deleteUserURL96011 = deleteUserTemplate960111.
				replace("{1}", primaryID);
		httpInvoker(deleteUserURL);
		httpInvoker(deleteUserURL96011);
	}

	String address = "http://10.93.8.33:7000/Easy7/rest/user/";
	String createUserTemplate = address + "addUserEx?userName={1}&userId={2}&currentUserId={3}&password={4}";
	String updateUserTemplate = address + "updateUser?id={1}&password={2}&currentUserId={3}";
	String deleteUserTemplate = address + "delUser?id={1}&currentUserId={2}";

	String address960111 = "http://10.93.8.50:8080/96011/user/";
	String createUserTemplate960111 = address960111 + "userInfoEdit.do?user_id={1}&userinfo_id={2}&password={3}&user_name={4}&realname={5}&sex={6}&department_code={7}&isUse={8}&ism={9}";
	String updateUserTemplate960111 = address960111 + "userInfoEdit.do?user_id={1}&userinfo_id={2}&password={3}&user_name={4}&realname={5}&sex={6}&department_code={7}&isUse={8}&ism={9}";
	String deleteUserTemplate960111 = address960111 + "userDelete.do?userinfo_id={1}";
	
	public String httpInvoker(String url) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(url);
		try {
			HttpResponse httpResponse = httpclient.execute(httpGet);
			String response = EntityUtils.toString(httpResponse.getEntity());
			return response;
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}
}