package com.dkd.business.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.Sbb;
import com.dkd.business.service.SbbService;
import com.dkd.system.util.downloadFile;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 设备表Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/sbb")
public class SbbContoller {
	
	@Resource
    private SbbService sbbService;
	
	
	
	@RequestMapping("/list.do")
    public String query() {
    	return "sbb/sblist";
    }
	
	
	@RequestMapping("/listpage.do")
    @ResponseBody
   // @WorkOperationLog(module = "部门管理", paramName = "查询", function= "treeGrids" )
    public JsonResult<Sbb> listpage(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam(required = false) String pm,
			@RequestParam(required = false) String yjfl,
			@RequestParam(required = false) String ejfl,
			@RequestParam(required = false) String sjfl,
			@RequestParam(required = false) String cwply,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate
			) {
    	JsonResult<Sbb> js = new JsonResult<Sbb>();
    	CurrencyPage<Sbb> cpage = new CurrencyPage<Sbb>();
    	try {
    		cpage.setPageNum(start);
			cpage.setPageSize(length);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("pm", pm);
			map.put("wply", cwply);
    		map.put("yjfl", yjfl);
    		map.put("ejfl", ejfl);
    		map.put("sjfl", sjfl);
    		map.put("beginDate", beginDate);
    		map.put("endDate", endDate);
    		cpage.setQueryTerms(map);
    		CurrencyPage<Sbb> cp = sbbService.treeGrids(cpage);
    		List<Sbb> list = cp.getPageInfo().getList();
    		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult("查询错误");
    	}
    		return js;
    	  }

	@RequestMapping(method = RequestMethod.POST, params = { "cmd=savesb" })
	@ResponseBody
	public String save(@Valid Sbb sbb,BindingResult br, HttpServletRequest request) {
		try {
			if (!sbb.getBtn().isEmpty()) {

				Date d = new Date();
				// df.format(nowDate);

				String realPath = request.getSession().getServletContext()
						.getRealPath("/");
				String dir = "\\file\\";
				File f1 = new File(realPath + dir);
				f1.mkdir();
				String fileurl = d.getTime()
						+ sbb.getBtn()
								.getOriginalFilename()
								.substring(
										sbb.getBtn().getOriginalFilename()
												.lastIndexOf("."));
					sbb.setXxcs(fileurl);
				File f = new File(realPath + dir + fileurl);
				if (!f.exists()) {
					f.createNewFile();
				}
				FileOutputStream fos = new FileOutputStream(f);
				fos.write(sbb.getBtn().getBytes());
				fos.flush();
				fos.close();

			}
			if(!StringUtils.isEmpty(sbb.getSbid())) {
				sbbService.editSbxx(sbb);
			} else {
				String maxNo = sbbService.selectMaxNo(sbb.getLx());
				sbb.setSbid(maxNo);
				sbb.setZcbm(UUIDGenerator.getUUID());
				sbbService.insert(sbb);
			}
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@RequestMapping(value="show.do",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Sbb> show(@RequestParam(value="id") String id) {
    	JsonResult<Sbb> js = new JsonResult<Sbb>();
    	try {
    		Sbb sbb = sbbService.selectShow(id);
    		js.createSuccessJsonResult(sbb);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }

	@RequestMapping(value="editShow.do",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Sbb> editShow(@RequestParam(value="id") String id) {
    	JsonResult<Sbb> js = new JsonResult<Sbb>();
    	try {
    		Sbb sbb = sbbService.selectByPk(id);
    		js.createSuccessJsonResult(sbb);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }

	
	@RequestMapping("/deleteSb.do")
    @ResponseBody
	public JsonResult<Sbb> deleteSb(String id) {
		JsonResult<Sbb> js = new JsonResult<Sbb>();
		try {
			sbbService.delete(id);
			js.createSuccessJsonResult("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
		}
		return js;
	}

	
	/**
	 * 设备接口
	 * @param wply	物品来源
	 * @param lx	类型
	 * @param dqzt	当前状态
	 * @param gh	归还状态
	 * @param isly	是否领用
	 * @return
	 */
	@RequestMapping("/selectSbCombobox.do")
    @ResponseBody
	public List<Sbb> selectSbCombobox(String wply, String lx,String dqzt,String gh,String isly) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("wply", wply);
		map.put("lx", lx);
		map.put("dqzt", dqzt);
		if(StringUtils.isNotEmpty(gh)) {
			map.put("gh", gh);
		}
		if(StringUtils.isNotEmpty(isly)) {
			map.put("isly", isly);
		}
		return sbbService.selectSbCombobox(map);
	}

	/**
	 * 导出
	 * @param pm
	 * @param yjfl
	 * @param ejfl
	 * @param sjfl
	 * @param beginDate
	 * @param endDate
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 */
	@RequestMapping(value = "/sbxxExport.do")
	public void sbxxExport(
			@RequestParam(required = false) String pm,
			@RequestParam(required = false) String yjfl,
			@RequestParam(required = false) String ejfl,
			@RequestParam(required = false) String sjfl,
			@RequestParam(required = false) String cwply,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
			HttpServletRequest request,HttpServletResponse response
			) throws InvalidFormatException, IOException {
		List<Sbb> findSbList=sbbService.exportfindsbb(pm,beginDate,endDate,yjfl,ejfl,sjfl,cwply);//查询的数据
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String realPath = request.getSession().getServletContext().getRealPath("/");
		Workbook wb = null;
        InputStream inp=null;
        inp = new FileInputStream(realPath+"upfile\\设备信息.xlsx");  
        wb = WorkbookFactory.create(inp);
        Sheet sheet = wb.getSheetAt(0);
        Font font= wb.createFont();
        font.setFontHeightInPoints((short)10);
        font.setFontName("宋体");
        //设置样式
        CellStyle style = wb.createCellStyle(); 
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
        style.setBorderRight(HSSFCellStyle.BORDER_THIN); 
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); 
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //设置样式垂直居中
        style.setFont(font);
	    Cell cell1;
	    Row row;
	   
	    for(int i=0;i<findSbList.size();i++){
	    	row=sheet.createRow(i+2);
	    	
	        cell1 = row.createCell(0);
	        cell1.setCellValue(findSbList.get(i).getPm());
	        cell1.setCellStyle(style);
	    
	        cell1=row.createCell(1);
	        if(null==findSbList.get(i).getDhrq()){
	        	 cell1.setCellValue("");
	        }else{
	        	cell1.setCellValue(format.format(findSbList.get(i).getDhrq()));
	        }
	        cell1.setCellStyle(style);

	        cell1=row.createCell(2);
	        cell1.setCellValue(findSbList.get(i).getYjfl());
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(3);
	        cell1.setCellValue(findSbList.get(i).getEjfl());
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(4);
	        cell1.setCellValue(findSbList.get(i).getSjfl());
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(5);
	        cell1.setCellValue(findSbList.get(i).getSccs());
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(6);
	        if(null==findSbList.get(i).getScrq()){
	        	 cell1.setCellValue("");
	        }else{
	        	cell1.setCellValue(format.format(findSbList.get(i).getScrq()));
	        }
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(7);
	        cell1.setCellValue(findSbList.get(i).getYws());
	        cell1.setCellStyle(style);
	        
	        cell1=row.createCell(8);
	        if(null==findSbList.get(i).getYxq()){
	        	 cell1.setCellValue("");
	        }else{
	        	cell1.setCellValue(format.format(findSbList.get(i).getYxq()));
	        }
	        cell1.setCellStyle(style);
	        
	    }
	    
	    FileOutputStream op = new FileOutputStream(realPath+"upfile\\设备信息管理.xlsx");
        wb.write(op);  
        op.flush();
        op.close();
	    downloadFile df = new downloadFile();
		try {
			df.download(realPath+"upfile/", "设备信息管理"+".xlsx", "application/octet-stream", response, request);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
