package com.dkd.business.bo;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 货架信息表
 * @author lyj
 *
 */
@Alias("Hjxxld")
public class Hjxxld implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	private String hjxxid;// 货架ID UUID
	
	private String ckmc;//仓库id(字典)
	
	private String name;// 名称
	
	private String hjbm;// 货架编号（随机32位）

	private String isdel;// 是否删除
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cjsj;// 创建时间

	//临时字段
	private String ckmcName;//仓库名称
	
	

	public String getCkmcName() {
		return ckmcName;
	}

	public void setCkmcName(String ckmcName) {
		this.ckmcName = ckmcName;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public String getHjxxid() {
		return hjxxid;
	}

	public void setHjxxid(String hjxxid) {
		this.hjxxid = hjxxid;
	}

	public String getCkmc() {
		return ckmc;
	}

	public void setCkmc(String ckmc) {
		this.ckmc = ckmc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHjbm() {
		return hjbm;
	}

	public void setHjbm(String hjbm) {
		this.hjbm = hjbm;
	}

	public Date getCjsj() {
		return cjsj;
	}

	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
