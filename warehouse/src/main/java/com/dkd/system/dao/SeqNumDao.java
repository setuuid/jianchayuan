package com.dkd.system.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SeqNumDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	public  int getSequenceNum(String seqName){
		String sql="select "+seqName +".nextval from dual";
		int seqNum=this.jdbcTemplate.queryForInt(sql);
		return seqNum;
	}
}
