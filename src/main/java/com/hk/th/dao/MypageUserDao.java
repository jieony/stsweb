package com.hk.th.dao;

import java.util.List;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;

public interface MypageUserDao {
	//members select
	public List<MembersVo> selectmembers();
	//members update
	public int updatemembers(MembersVo songvo);

	//members detail
	public MembersVo detailmembers(String id);
	
	
	//book detail res_code
	public  bookVo detailbook(int bo_code);
	
	
	//members enroll 상태 확인
	public String checkmembers(String uid);
	
	//res insert
	public int insertres(resVo resvo);
	//enroll 1
	public boolean updateEnroll(String enroll);
	//enroll 0
	public boolean updateEnrollZero(String uid);
	
	//res res_code 검색
	public resVo selectRes(String res_uid);
	public resVo selectRescode(int res_code);
	
	//res update
	public boolean updateMyRes(resVo resvo);
	
	//update book conf
	public boolean updateConf(bookVo bookvo);
	
	//myres delete
	public boolean deleteRes(String res_uid);
	
	//menu select
	public List<menuVo> selectmenu(int res_code);
	
	//menu update
	public boolean updatemenu(menuVo menuvo);
	
	//page count
	public List<bookVo> pageList(int offset, int noOfRecords,int res_code);
	
	public int pageGetCount(int res_code);
	
	//delete
	public boolean deleteUser(String uid);

}
