package com.dkd.business.bo;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.dkd.utils.tree.Tree;
import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 出入库记录表
 * @author lyj
 *
 */
@Alias("Crkjlb")
public class Crkjlb implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	private String crkid;// 出入库自增id UUID
	


	private String sbid;//设备id

	
	private String hjxxid;// 货架id
	
	private String zt;   // 状态（入库-1；出库-2；报废-7））
	
	private String lydw; // 领用单位  入库单位
	
	private String lx;   // 类型（1表示设备 2表示耗材）
	
	private int    lysl; //领用数量  入库数量
	
	private String czr;  // 操作人
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   czsj; // 操作时间
	
	private String isdel;	//是否删除
	
	//出库form字段
	private String sbmc;	//设备名称
	
	private String hjmc;	//货架名称
	
	private String lydwmc; 	//领用单位名称
	
	private String sccs;	//生产厂商名称
	
	private String ckmc;	//仓库名称
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date scrq;	//生产日期
	
	private String yws;	//运维商
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date yxq;	//维保有效期至
	
	
	
	

	
	public String getCkmc() {
		return ckmc;
	}

	public void setCkmc(String ckmc) {
		this.ckmc = ckmc;
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

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public String getSbmc() {
		return sbmc;
	}

	public void setSbmc(String sbmc) {
		this.sbmc = sbmc;
	}

	public String getHjmc() {
		return hjmc;
	}

	public void setHjmc(String hjmc) {
		this.hjmc = hjmc;
	}

	public String getLydwmc() {
		return lydwmc;
	}

	public void setLydwmc(String lydwmc) {
		this.lydwmc = lydwmc;
	}

	public String getCrkid() {
		return crkid;
	}

	public void setCrkid(String crkid) {
		this.crkid = crkid;
	}

	

	

	public String getSbid() {
		return sbid;
	}

	public void setSbid(String sbid) {
		this.sbid = sbid;
	}

	public String getHjxxid() {
		return hjxxid;
	}

	public void setHjxxid(String hjxxid) {
		this.hjxxid = hjxxid;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getLydw() {
		return lydw;
	}

	public void setLydw(String lydw) {
		this.lydw = lydw;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public int getLysl() {
		return lysl;
	}

	public void setLysl(int lysl) {
		this.lysl = lysl;
	}

	public String getCzr() {
		return czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

	public Date getCzsj() {
		return czsj;
	}

	public void setCzsj(Date czsj) {
		this.czsj = czsj;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
}
