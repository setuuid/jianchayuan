package com.dkd.business.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dkd.business.bo.Sbb;
import com.dkd.business.service.SbbService;



/**
 * 出入库记录表Contoller
 * @author lyj
 *
 */
@Controller
@RequestMapping(value = "/xls")
public class PoiContoller {

	@Resource
	private SbbService sbbService ;
	
	//请求上传的文件,会自动封装到file类型属性中
	private File xls; 
		
	private static Log log = LogFactory.getLog(Sbb.class);

	 @RequestMapping(value = "importX.do", method = RequestMethod.POST)
	 public String batchimport(@RequestParam(value="xls") MultipartFile file,
	         HttpServletRequest request,HttpServletResponse response) throws IOException{
	     log.info("AddController ..batchimport() start");
	     //判断文件是否为空
	     if(file==null) return null;
	     //获取文件名
	     String name=file.getOriginalFilename();
	     //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
	     long size=file.getSize();
	     if(name==null || ("").equals(name) && size==0) return null;
	     
	     //批量导入。参数：文件名，文件。
	     boolean b = sbbService.batchImport(name,file);
	     if(b){
	          String Msg ="批量导入EXCEL成功！";
	          request.getSession().setAttribute("msg",Msg);    
	     }else{
	          String Msg ="批量导入EXCEL失败！";
	          request.getSession().setAttribute("msg",Msg);
	     } 
	    return "sbb/sblist";
	 }
	 
	 @RequestMapping( value = "/excelOut")
     public void excelStandardTemplateOut(HttpServletRequest request,
            HttpServletResponse response) throws IOException{
         java.net.URL save = Thread.currentThread().getContextClassLoader().getResource("");
         String str =     save.toString();
         str=str.substring(6,str.length());
         str=str.replaceAll("%20", " ");  
         int num = str.lastIndexOf("warehouse");
         //warehouse 为项目名，应用到不同的项目中，这个需要修改！
         str=str.substring(0, num+"warehouse".length());
         //Excel模板所在的路径。
         str = str +"/demo/template.xlsx";
         File f = new File(str);
          // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        try {
        	//下载文件的名称
            response.setHeader("Content-Disposition", "attachment;filename="+ new String(("设备信息标准模板2003" + ".xlsx").getBytes(), "iso-8859-1"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(new FileInputStream(f));
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
 }

	    
	     
	 	public File getXls() {
			return xls;
		}

		public void setXls(File xls) {
			this.xls = xls;
		}
	     
 }
