package com.hk.th.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.regionVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

@Repository("bookDao")
public class bookDaoImpl implements bookDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "book.";

	@Override
	public ArrayList<resVo> reslist() {
		List<resVo> dbres = sqlSession.selectList(ns+"selectresList");
		return (ArrayList<resVo>) dbres;
	}

	@Override
	public ArrayList<resVo> searchlist(String line,String theme,String location,String res_name,String res_addr) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("line", line);
		map.put("theme", theme);
		map.put("res_addr", res_addr);
		map.put("res_name", res_name);
		map.put("map_num", location);
		
		List<resVo> dbres = sqlSession.selectList(ns+"selectsearchresList",map);
		

		return (ArrayList<resVo>)dbres;
	}
	
	@Override
	public int searchpagingCount(String line, String theme, String location, String res_name, String res_addr) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("line", line);
		params.put("theme", theme);
		params.put("res_addr", res_addr);
		params.put("res_name", res_name);
		params.put("map_num", location);
		
		int dbres = sqlSession.selectOne(ns+"searchpageingCount",params);
		return dbres;
	}

	@Override
	public List<resVo> searchpaging(String line, String theme, String location, String res_name, String res_addr,
			int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("line", line);
		params.put("theme", theme);
		params.put("res_addr", res_addr);
		params.put("res_name", res_name);
		params.put("map_num", location);
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		List<resVo> dbres = sqlSession.selectList(ns+"searchpageinglist",params);
		noOfRecords=sqlSession.selectOne(ns+"searchpageingCount",params);
		
		return dbres;
	}

	@Override
	public List<resVo> resinfo(String res_code) {
		List<resVo> dbres = sqlSession.selectList(ns+"selectresinfo",res_code);
		return dbres;
	}

	@Override
	public ArrayList<bookVo> booklistbyid(String userid) {
		
		List<bookVo> dbres = sqlSession.selectList(ns+"selectbooklistByid",userid);
		return (ArrayList<bookVo>) dbres;
	}

	@Override
	public ArrayList<bookVo> bookdetail(String bo_code) {
		List<bookVo> dbres = sqlSession.selectList(ns+"selectbookdetail",bo_code);
		return (ArrayList<bookVo>) dbres;
	}

	@Override
	public int updatebook(bookVo bvo) {
		int dbres = sqlSession.update(ns+"updatebooking",bvo);
		return dbres;
	}

	@Override
	public int delbook(String bo_code) {
		int dbres = sqlSession.delete(ns+"deletebook",bo_code);
		return dbres;
	}

	@Override
	public int insertbook(bookVo bvo) {
		int dbres = sqlSession.insert(ns+"insertbook",bvo);
		return dbres;
	}

	@Override
	public int pageGetCount() {
		int dbres = sqlSession.selectOne(ns+"pageGetCount");
		return dbres;
	}

	@Override
	public List<resVo> pageList(int offset, int noOfRecords) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		List<resVo> dbres = sqlSession.selectList(ns+"pageList",params);
		noOfRecords=sqlSession.selectOne(ns+"pageGetCount");
		
		return dbres;
	}

	@Override
	public int mybook_pageGetCount(String userid) {
		int dbres = sqlSession.selectOne(ns+"mybookpageGetCount",userid);
		return dbres;
	}

	@Override
	public List<bookVo> mybook_pageList(int offset, int noOfRecords, String userid) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("userid", userid);
		
		List<bookVo> dbres = sqlSession.selectList(ns+"mybookpageList",params);
		noOfRecords=sqlSession.selectOne(ns+"mybookpageGetCount");
		
		return dbres;
	}

	@Override
	public List<reviewVo> selectReview() {
		List<reviewVo> dbres = sqlSession.selectList(ns+"selectReview");
		return dbres;
	}

	@Override
	public List<resVo> selectpiclist() {
		List<resVo> dbres = sqlSession.selectList(ns+"selectpiclist");
		return dbres;
	}

	




}
