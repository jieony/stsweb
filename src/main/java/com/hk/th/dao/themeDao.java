package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.resVo;

public interface themeDao {

	public ArrayList<resVo> searchtheme(String theme);
	public List<resVo> themelist(int offset, int noOfRecords, String theme);
	public int GetCount(String theme);
	
	
}
