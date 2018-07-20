package com.hk.th.service;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hk.th.dao.themeDao;
import com.hk.th.vo.resVo;

@Repository("themeService")
public class themeServiceImpl implements themeService {
	
	@Resource(name="themeDao")
	private themeDao themedb;
	
	@Override
	public ArrayList<resVo> getsearchtheme(String theme) {
		
		ArrayList<resVo> list =(ArrayList<resVo>)themedb.searchtheme(theme);
		return list;
	}

	@Override
	public List<resVo> getthemelist(int offset, int noOfRecords, String theme) {
		List<resVo> svres = themedb.themelist(offset, noOfRecords, theme);
		
		return svres;
	}

	@Override
	public int GetCount(String theme) {
		int svres = themedb.GetCount(theme);
		return svres;
	}



}
