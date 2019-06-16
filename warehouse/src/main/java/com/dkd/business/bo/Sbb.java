package com.dkd.business.bo;

import java.io.Serializable;
import java.util.Date;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 设备表
 * @author jsp
 *
 */
@Alias("Sbb")
public class Sbb implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/*设备id*/
	private String sbid;
	
	/*品名*/
	private String pm;
	
	/*到货日期*/
	 @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dhrq;
	
	/*一级分类*/
	private String yjfl;
	
	/*二级分类*/
	private String ejfl;
	
	/*三级分类*/
	private String sjfl;
	
	/*生产厂商名称*/
	private String sccs;
	
	/*生产日期*/
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date scrq;
	
	/*运维商*/
	private String yws;
	
	/*维保有效期至*/
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date yxq;
	
	/*维保电话*/
	private String wbdh;
	
	/*资产型号*/
	private String zcxh;
	
	/*资产规格*/
	private String zcgg;
	
	/*详细规格参数附件*/
	private String xxcs;
	
	/*资产编号（随机32位）*/
	private String zcbm;
	
	/*当前状态*/
	private String dqzt;
	
	/*物品来源(1、自产 2、暂存)*/
	private String wply;
	
	/*物品来源单位*/
	private String wplydw;
	
	/*创建时间*/
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date cjsh;
	
	/*1表示设备 2表示耗材*/
	private String lx;
	
	/*货架id*/
	private String hjid;
	
	/*数量*/
	private int sl;
	
	/*数量类型*/
	private String dw;
	
	private MultipartFile btn;
	
	private String isdel;
	
	/**
	 * 是否领用
	 */
	private String isly;



	public String getSbid() {

		return sbid;
	}

	public void setSbid(String sbid) {
		this.sbid = sbid;
	}

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public Date getDhrq() {
		return dhrq;
	}

	public void setDhrq(Date dhrq) {
		this.dhrq = dhrq;
	}

	public String getYjfl() {
		return yjfl;
	}

	public void setYjfl(String yjfl) {
		this.yjfl = yjfl;
	}

	public String getEjfl() {
		return ejfl;
	}

	public void setEjfl(String ejfl) {
		this.ejfl = ejfl;
	}

	public String getSjfl() {
		return sjfl;
	}

	public void setSjfl(String sjfl) {
		this.sjfl = sjfl;
	}

	public String getSccs() {
		return sccs;
	}

	public void setSccs(String sccs) {
		this.sccs = sccs;
	}

	public Date getScrq() {
		return scrq;
	}

	public void setScrq(Date scrq) {
		this.scrq = scrq;
	}

	public String getYws() {
		return yws;
	}

	public void setYws(String yws) {
		this.yws = yws;
	}

	public Date getYxq() {
		return yxq;
	}

	public void setYxq(Date yxq) {
		this.yxq = yxq;
	}

	public String getWbdh() {
		return wbdh;
	}

	public void setWbdh(String wbdh) {
		this.wbdh = wbdh;
	}

	public String getZcxh() {
		return zcxh;
	}

	public void setZcxh(String zcxh) {
		this.zcxh = zcxh;
	}

	public String getZcgg() {
		return zcgg;
	}

	public void setZcgg(String zcgg) {
		this.zcgg = zcgg;
	}

	public String getXxcs() {
		return xxcs;
	}

	public void setXxcs(String xxcs) {
		this.xxcs = xxcs;
	}

	public String getZcbm() {
		return zcbm;
	}

	public void setZcbm(String zcbm) {
		this.zcbm = zcbm;
	}

	public String getDqzt() {
		return dqzt;
	}

	public void setDqzt(String dqzt) {
		this.dqzt = dqzt;
	}

	public String getWply() {
		return wply;
	}

	public void setWply(String wply) {
		this.wply = wply;
	}

	public String getWplydw() {
		return wplydw;
	}

	public void setWplydw(String wplydw) {
		this.wplydw = wplydw;
	}

	public Date getCjsh() {
		return cjsh;
	}

	public void setCjsh(Date cjsh) {
		this.cjsh = cjsh;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	

	public String getHjid() {
		return hjid;
	}

	public void setHjid(String hjid) {
		this.hjid = hjid;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public MultipartFile getBtn() {
		return btn;
	}

	public void setBtn(MultipartFile btn) {
		this.btn = btn;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public String getIsly() {
		return isly;
	}

	public void setIsly(String isly) {
		this.isly = isly;
	}
	
}
