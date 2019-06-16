package com.dkd.system.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class downloadFile {
	public void download(String path, String fileName, String ContentType,HttpServletResponse response,HttpServletRequest request) throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;  
		BufferedOutputStream bos = null;  
 
		long fileLength = new File(path+fileName).length();  
		response.setContentType(ContentType);  
		
		String explore = request.getHeader("user-agent");//判断是不是火狐浏览器
        boolean type = explore.toLowerCase().indexOf("firefox")>0?true:false;
        if(type==true){
     	   response.setHeader("Content-disposition","attachment;filename=\""+ new String(fileName.getBytes("GB2312"),"ISO-8859-1") + "\"");  
        }else{
        	response.setHeader("Content-disposition", "attachment; filename=\"" + java.net.URLEncoder.encode(fileName, "UTF-8").replace("+","%20") + "\"");  
        }
        
		
		
		response.setHeader("Content-Length", String.valueOf(fileLength));  
		
		bis = new BufferedInputStream(new FileInputStream(path+fileName));  
		bos = new BufferedOutputStream(response.getOutputStream());  
		byte[] buff = new byte[2048];  
		int bytesRead;  
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
		bos.write(buff, 0, bytesRead);  
		}  
		bis.close();  
		bos.close();
    }
}
