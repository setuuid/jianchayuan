package com.dkd.business.bo;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 二维码交互Form
 * @author jsp
 *
 */
@Alias("EwmForm")
public class EwmForm implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 设备id
	 */
	private String sb_id;
	
	/**
	 * 设备名称
	 */
	private String sb_name;
	
	/**
	 * 设备分类
	 */
	private String sb_fl;
	
	/**
	 * 设备型号
	 */
	private String sb_xh;
	
	/**
	 * 生产厂商
	 */
	private String sb_sccs;
	
	/**
	 * 运维商
	 */
	private String sb_yws;
	
	/**
	 * 维保有效期
	 */
	private String sb_yxq;
	
	/**
	 * 维保电话
	 */
	private String sb_wbdh;
	
	/**
	 * 领用单位id
	 */
	private String lydw_id;
	
	/**
	 * 领用单位名称
	 */
	private String lydw_name;
	
	/**
	 * 货架id
	 */
	private String hj_id;
	/**
	 * 仓库名称
	 */
	private String hj_ckname;
	
	/**
	 * 货架名称
	 */
	private String hj_hjname;
	
	/**
	 * 货架编码
	 */
	private String hj_bm;

	public String getSb_id() {
		return sb_id;
	}

	public void setSb_id(String sb_id) {
		this.sb_id = sb_id;
	}

	public String getSb_name() {
		return sb_name;
	}

	public void setSb_name(String sb_name) {
		this.sb_name = sb_name;
	}

	public String getSb_fl() {
		return sb_fl;
	}

	public void setSb_fl(String sb_fl) {
		this.sb_fl = sb_fl;
	}

	public String getLydw_id() {
		return lydw_id;
	}

	public void setLydw_id(String lydw_id) {
		this.lydw_id = lydw_id;
	}

	public String getLydw_name() {
		return lydw_name;
	}

	public void setLydw_name(String lydw_name) {
		this.lydw_name = lydw_name;
	}

	public String getHj_id() {
		return hj_id;
	}

	public void setHj_id(String hj_id) {
		this.hj_id = hj_id;
	}

	public String getHj_ckname() {
		return hj_ckname;
	}

	public void setHj_ckname(String hj_ckname) {
		this.hj_ckname = hj_ckname;
	}

	public String getHj_hjname() {
		return hj_hjname;
	}

	public void setHj_hjname(String hj_hjname) {
		this.hj_hjname = hj_hjname;
	}

	public String getSb_xh() {
		return sb_xh;
	}

	public void setSb_xh(String sb_xh) {
		this.sb_xh = sb_xh;
	}

	public String getSb_sccs() {
		return sb_sccs;
	}

	public void setSb_sccs(String sb_sccs) {
		this.sb_sccs = sb_sccs;
	}

	public String getSb_yws() {
		return sb_yws;
	}

	public void setSb_yws(String sb_yws) {
		this.sb_yws = sb_yws;
	}

	

	public String getSb_yxq() {
		return sb_yxq;
	}

	public void setSb_yxq(String sb_yxq) {
		this.sb_yxq = sb_yxq;
	}

	public String getSb_wbdh() {
		return sb_wbdh;
	}

	public void setSb_wbdh(String sb_wbdh) {
		this.sb_wbdh = sb_wbdh;
	}

	public String getHj_bm() {
		return hj_bm;
	}

	public void setHj_bm(String hj_bm) {
		this.hj_bm = hj_bm;
	}
	
	
	
}
