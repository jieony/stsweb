package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.resVo;

public interface MainresService {

	public ArrayList<resVo> getResByMap(int num);
	public ArrayList<resVo> getsearchRes(String res_name);
	public int getrescount(int res_code);
	public int getcount(int map_num);
	public ArrayList<resVo> getpagereslist(int offset, int noOfRecords,int map_num);
	public int getsearchResName(String res_name);
	public ArrayList<resVo> getpageResName(int offset, int noOfRecords,String res_name);
}
