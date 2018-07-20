package com.hk.th.dao;

import java.util.List;

import com.hk.th.vo.MembersVo;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;

public interface ManaDao {
	public List<bookVo> selectNoShowList();
	public boolean updatePenalty(String id);
	public boolean updateConf(String code);
	public List<resVo> selectResList();
	public resVo selectResDetail(int code);
	public List<resVo> selectUnList();
	public boolean updateRes(resVo vo);
	public boolean deleteMem(String id);
	public boolean deleteRes(int code);
	public boolean updateEnrollBack(String uid);
	public List<menuVo> selectMenu(int code);
	public boolean updateMenu(menuVo mvo);
	//paging
	public int countBook();
	public List<bookVo> BookpageList(int offset, int noOfRecords);
	//paging
	public int countMember();
	public List<MembersVo> MemberpageList(int offset, int noOfRecords);
	//paging
	public int countres();
	public List<resVo> RespageList(int offset, int noOfRecords);
	//paging
	public int countunres();
	public List<resVo> UnrespageList(int offset, int noOfRecords);
}
