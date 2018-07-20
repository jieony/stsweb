package com.hk.th.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.MembersVo;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

@Repository("ManaDao")
public class ManaDaoImpl implements ManaDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns="Mana.";
	
	@Override
	public List<bookVo> selectNoShowList() {
		List<bookVo> list = sqlsession.selectList(ns+"selectNoShowList");
		
		return list;
	}

	@Override
	public boolean updatePenalty(String id) {
		sqlsession.update(ns+"updatePenalty",id);
		return true;
	}

	@Override
	public boolean updateConf(String id) {
		sqlsession.update(ns+"updateConf",id);
		return true;
	}

	@Override
	public List<resVo> selectResList() {
		List<resVo> list = sqlsession.selectList(ns+"selectResList");
		return list;
	}

	@Override
	public resVo selectResDetail(int code) {
		resVo vo = sqlsession.selectOne(ns+"selectResDetail",code);
		return vo;
	}

	@Override
	public List<resVo> selectUnList() {
		List<resVo> list = sqlsession.selectList(ns+"selectUnList");
		return list;
	}

	@Override
	public boolean updateRes(resVo vo) {
		sqlsession.update(ns+"updateRes",vo);
		return true;
	}

	@Override
	public boolean deleteMem(String id) {
		sqlsession.delete(ns+"deleteMem",id);
		return true;
	}
	

	@Override
	public boolean deleteRes(int code) {
	
		sqlsession.delete(ns+"deleteRes",code);
		return true;
	}

	@Override
	public boolean updateEnrollBack(String uid) {
		sqlsession.delete(ns+"updateEnrollBack",uid);
		return true;
	}

	@Override
	public List<menuVo> selectMenu(int code) {
	
		List<menuVo> list = sqlsession.selectList(ns+"selectMenu",code);
		return list;
	}

	@Override
	public boolean updateMenu(menuVo mvo) {
		sqlsession.update(ns+"updateMenu",mvo);
		return true;
	}

	@Override
	public int countBook() {
		int dbres=sqlsession.selectOne(ns+"countBook");
		return dbres;
	}

	@Override
	public List<bookVo> BookpageList(int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		List<bookVo> dbres=sqlsession.selectList(ns+"BookpageList",params);
		noOfRecords=sqlsession.selectOne(ns+"countBook");
		return dbres;
	}

	@Override
	public int countMember() {
		int dbres=sqlsession.selectOne(ns+"countMember");
		return dbres;
	}

	@Override
	public List<MembersVo> MemberpageList(int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		List<MembersVo> dbres=sqlsession.selectList(ns+"MemberpageList",params);
		noOfRecords=sqlsession.selectOne(ns+"countMember");
		return dbres;
	}

	@Override
	public int countres() {
		int dbres=sqlsession.selectOne(ns+"countres");
		return dbres;
	}

	@Override
	public List<resVo> RespageList(int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		List<resVo> dbres=sqlsession.selectList(ns+"RespageList",params);
		noOfRecords=sqlsession.selectOne(ns+"countres");
		return dbres;
	}

	@Override
	public int countunres() {
		int dbres=sqlsession.selectOne(ns+"countunres");
		return dbres;
	}

	@Override
	public List<resVo> UnrespageList(int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		List<resVo> dbres=sqlsession.selectList(ns+"UnrespageList",params);
		noOfRecords=sqlsession.selectOne(ns+"countunres");
		return dbres;
	}
	
	
	

}
