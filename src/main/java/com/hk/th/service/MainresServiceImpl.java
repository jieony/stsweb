package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hk.th.dao.MainresDao;
import com.hk.th.vo.resVo;

@Repository("MainresService")
public class MainresServiceImpl implements MainresService {

	@Resource(name="MainresDao")
	private MainresDao mainresdb;

	@Override
	public ArrayList<resVo> getResByMap(int num) {
		ArrayList<resVo> list = (ArrayList<resVo>)mainresdb.selectResByMap(num);
		return list;
	}

	@Override
	public ArrayList<resVo> getsearchRes(String res_name) {
		ArrayList<resVo> list = (ArrayList<resVo>)mainresdb.searchRes(res_name);
		
		return list;
	}

	@Override
	public int getrescount(int res_code) {
		int svres=mainresdb.resCount(res_code);
		return svres;
	}

	@Override
	public int getcount(int map_num) {
		int svres=mainresdb.resCount(map_num);
		return svres;
	}

	@Override
	public ArrayList<resVo> getpagereslist(int offset, int noOfRecords, int map_num) {
		ArrayList<resVo> svres=(ArrayList<resVo>) mainresdb.pageresList(offset, noOfRecords, map_num);
		return svres;
	}

	@Override
	public int getsearchResName(String res_name) {
		int svres=mainresdb.searchResName(res_name);
		return svres;
	}

	@Override
	public ArrayList<resVo> getpageResName(int offset, int noOfRecords, String res_name) {
		ArrayList<resVo> svres=(ArrayList<resVo>) mainresdb.pageResName(offset, noOfRecords, res_name);
		return svres;
	}

}
