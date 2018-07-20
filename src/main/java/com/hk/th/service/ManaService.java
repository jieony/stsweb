package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.MembersVo;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

public interface ManaService {
	public ArrayList<bookVo> getNoShow();
	public boolean addPenalty(String id,String code);
	public ArrayList<resVo> getRes();
	public resVo getResDetail(int code);
	public ArrayList<resVo> getUnRes();
	public boolean updateDetailRes(resVo vo);
	public boolean updateDetailMenu(menuVo mvo);
	public boolean deleteMem(String id);
	public boolean deleteRes(int code,String uid);
	public ArrayList<menuVo> getMenu(int code);
	//paging=1
	public int getcountBook();
	public ArrayList<bookVo> getBookpageList(int offset, int noOfRecords);
	//paging=2
	public int countMember();
	public ArrayList<MembersVo> getMemberpageList(int offset, int noOfRecords);
	//paging=4
	public int getcountres();
	public ArrayList<resVo> getRespageList(int offset, int noOfRecords);
	//paging=3
	public int getcountunres();
	public ArrayList<resVo> getUnrespageList(int offset, int noOfRecords);
}
