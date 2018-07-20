package com.hk.th.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.resVo;

@Repository("themeDao")
public class themeDaoImpl implements themeDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns = "theme.";
	
	
	@Override
	public ArrayList<resVo> searchtheme(String theme) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("theme", theme);
		
		List<resVo> dbres = sqlsession.selectList(ns+"searchtheme",map);
		
		return (ArrayList<resVo>)dbres;
	}

	@Override
	public List<resVo> themelist(int offset, int noOfRecords, String theme) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("theme", theme);
		
		List<resVo> dbres =sqlsession.selectList(ns+"themelist", params);
		noOfRecords =sqlsession.selectOne(ns+"GetCount", theme);
		return dbres;
	}

	@Override
	public int GetCount(String theme) {
		int dbres = sqlsession.selectOne(ns+"GetCount", theme);
		return dbres;
	}
	}


