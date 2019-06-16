package com.dkd.business.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.service.SbbService;
import com.dkd.business.service.StorageService;
import com.dkd.system.bo.User;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;



/**
 * 出入库记录表Contoller
 * @author lyj
 *
 */
@Controller
@RequestMapping(value = "/storage")
public class StorageContoller {

	@Resource
	private StorageService storageService;
	
	@Resource
	private SbbService sbbService;
    /**
     * 跳转入库查询页
     * @return
     */
    @RequestMapping("/query.do")
    public String query() {
    	return "business/storage/query";
    }
   
    /**
     * 
     * 跳转设备归还页面
     * @return
     */
    @RequestMapping("/sbghquery.do")
    public String sbghquery() {
    	return "business/storage/sbghquery";
    }
    
    
    /**
     * 跳转资产调入页面
     * @return
     */
    @RequestMapping("/zcdrquery.do")
    public String zcdrquery() {
    	return "business/storage/zcdrquery";
    }
    
    
    /**
	 * 根据 类型 状态 查询入库信息
	 * @param start
	 * @param length
	 * @param draw
	 * @param yjfl	一级分类
	 * @param ejfl	二级分类
	 * @param sjfl	三级分类
	 * @param pm	品名
	 * @param czsj	操作时间
	 * @param sldw	申领单位
	 * @param zt	状态 	1.入库 2.出库
	 * @param lx	类型	1.设备 2.耗材
	 * @param wply	物品来源 1.自产 2.暂存
	 * @return
	 */
	@RequestMapping(value = "/querylist.do")
	@ResponseBody
	public JsonResult<Crkjlb> querylist(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String yjfl,
			@RequestParam String ejfl,
			@RequestParam String sjfl,
			@RequestParam String pm,
			@RequestParam String zt,
			@RequestParam String ckmc,
			@RequestParam String wply,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
		JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
		CurrencyPage<Crkjlb> cpage = new CurrencyPage<Crkjlb>();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			cpage.setPageNum(start);
			cpage.setPageSize(length);
			map.put("yjfl", yjfl);
			map.put("ejfl", ejfl);
			map.put("sjfl", sjfl);
			map.put("pm", pm);
			map.put("ckmc", ckmc);
			map.put("zt", zt);
			map.put("wply", wply);
			map.put("beginDate", beginDate);
			map.put("endDate", endDate);
			cpage.setQueryTerms(map);
			CurrencyPage<Crkjlb> cp = storageService.queryPageStorage(cpage);
			js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), cp.getPageInfo().getList());
		} catch(Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult("查询错误,请联系管理员");
		}
		
		return js;
		
	}
   
  
    
    /**
	 * 添加入库信息
	 * @param crkjlb
	 * @return
	 */
	@RequestMapping("/editStorage.do")
    @ResponseBody
    public JsonResult<Crkjlb> editOutwarehouse(@RequestBody Crkjlb crkjlb) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
    	try {
    		//更新设备信息
    		//int resultSbb=sbbService.update(sbb);
			int result = storageService.editOutStorage(crkjlb,user);
			if(result > 0 ) {
				js.createSuccessJsonResult("保存成功");
			}
    	} catch (Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }

   
	
    
    /**
     * 删除入库信息
     * @param id
     * @return
     */
    @RequestMapping("/deleteStorage.do")
    @ResponseBody
    public JsonResult<Crkjlb> deleteUser(@RequestParam(value="id") String id) {
    	JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
    	try {
    		storageService.deleteStorage(id);
    		
    		js.createSuccessJsonResult("删除成功");
    	} catch (Exception e) {
    		e.printStackTrace();
			js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    /**
	 * 编辑查看入库记录
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/editShow.do")
    @ResponseBody
	public JsonResult<Crkjlb> editShow(String crkid) {
		JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
		Crkjlb crkjlb = storageService.selectByPk(crkid);
		js.createSuccessJsonResult(crkjlb);
		return js;
	}
	

	/**
	 * 查看详情数据
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public JsonResult<OutWarehouseForm> show(String crkid,Model model) {
		JsonResult<OutWarehouseForm> js = new JsonResult<OutWarehouseForm>();
		OutWarehouseForm  ohf = storageService.selectShowBycrk(crkid);
		js.createSuccessJsonResult(ohf);
		return js;
	}
    
    
    
    
    @RequestMapping("/searchry")
	public String searchry() {
		return "wf/designer/searchry";
	}
	
	@RequestMapping("/searchdgry")
	public String searchdgry() {
		return "wf/designer/searchdgry";
	}

    /**
     * 
     * 跳转报废
     * @return
     */
    @RequestMapping("/zcbfquery.do")
    public String bfquery() {
    	return "business/zcbf/zcbfquery";
    }
	
}
