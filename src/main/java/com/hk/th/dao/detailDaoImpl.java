package com.hk.th.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

@Repository("detailDao")
public class detailDaoImpl implements detailDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private String ns = "detail.";

	@Override
	public int getCateCount(int code) {
		int result = sqlsession.selectOne(ns+"getCateCount",code);
		return result;
	}

	@Override
	public List<String> getCate(int code) {
		List<String> cate = sqlsession.selectList(ns+"getCate",code);
		return cate;
	}

	@Override
	public List<menuVo> getMenuByCate(menuVo vo) {
		List<menuVo> menu = sqlsession.selectList(ns+"getMenuByCate",vo);
		return menu;
	}

	@Override
	public List<reviewVo> getReview(int code) {
		List<reviewVo> re = sqlsession.selectList(ns+"getReview",code);
		return re;
	}

	@Override
	public int insertReview(reviewVo vo) {
		int result = sqlsession.insert(ns+"insertReview", vo);
		return result;
	}

	@Override
	public int getReviewCount(int code) {
		int result=sqlsession.selectOne(ns+"getReviewCount",code);
		return result;
	}

	@Override
	public boolean updateScore(resVo vo) {
		sqlsession.update(ns+"updateScore",vo);
		return true;
	}

	@Override
	public int detailcount() {
		int dbres=sqlsession.selectOne(ns+"detailcount");
		return dbres;
	}

	@Override
	public List<reviewVo> detailpagelist(int offset, int noOfRecords, int res_code) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("res_code", res_code);
		List<reviewVo> dbres=sqlsession.selectList(ns+"detailpagelist",params);
		noOfRecords=sqlsession.selectOne(ns+"detailcount");
		return dbres;
	}

	@Override
	public boolean deleteReview(int num) {
		sqlsession.delete(ns+"deleteReview",num);
		return true;
	}

	@Override
	public List<Float> getScores(int code) {
		List<Float> list = sqlsession.selectList(ns+"getScores", code);
		return list;
	}
}
