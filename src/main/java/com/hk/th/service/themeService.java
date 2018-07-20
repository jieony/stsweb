package com.hk.th.service;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.resVo;

public interface themeService {

	ArrayList<resVo> getsearchtheme(String theme);
	
	List<resVo> getthemelist(int offset, int noOfRecords, String theme);
	
	int GetCount(String theme);
	
	
}
