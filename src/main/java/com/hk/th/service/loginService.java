package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.MembersVo;

public interface loginService {

	public ArrayList<MembersVo> getSelectMember();
	public int LoginCheck(MembersVo vo);
	public int InsertMemberDo(MembersVo vo);
	public int Memcheckid(String uid);
	
	public String getId(MembersVo vo);
	public String getPw(MembersVo vo);
}
