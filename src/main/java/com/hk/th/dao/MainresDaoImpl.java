package com.hk.th.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hk.th.vo.resVo;

@Repository("MainresDao")
public class MainresDaoImpl implements MainresDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns ="Mainres.";

	@Override
	public List<resVo> selectResByMap(int num) {
		List<resVo> list = sqlsession.selectList(ns+"selectResByMap",num);
			
		return list;
	}

	@Override
	public List<resVo> searchRes(String res_name) {
		
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("res_name", res_name);
			List<resVo> dbres = sqlsession.selectList(ns+"searchRes", map);
		return  dbres;
	}

	@Override
	public int resCount(int map_num) {
		int dbres=sqlsession.selectOne(ns+"resCount",map_num);
		return dbres;
	}

	@Override
	public List<resVo> pageresList(int offset, int noOfRecords, int map_num) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("map_num", map_num);
		
		List<resVo> dbres=sqlsession.selectList(ns+"pageresList",params);
		noOfRecords=sqlsession.selectOne(ns+"resCount",map_num);
		return dbres;
	}

	@Override
	public int searchResName(String res_name) {
		int dbres=sqlsession.selectOne(ns+"searchResName",res_name);
		return dbres;
	}

	@Override
	public List<resVo> pageResName(int offset, int noOfRecords, String res_name) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("res_name", res_name);
		
		List<resVo> dbres=sqlsession.selectList(ns+"pageResName",params);
		noOfRecords=sqlsession.selectOne(ns+"searchResName",res_name);
		return dbres;
	}



}
