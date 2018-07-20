package com.hk.th.dao;

import java.util.List;


import com.hk.th.vo.resVo;

public interface MainresDao {

	public List<resVo> selectResByMap(int num);
	public List<resVo> searchRes(String res_name);
	public int resCount(int map_num);
	public List<resVo> pageresList(int offset, int noOfRecords,int map_num);
	public int searchResName(String res_name);
	public List<resVo> pageResName(int offset, int noOfRecords,String res_name);
}
