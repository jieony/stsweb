package com.hk.th.dao;

import java.util.List;

import com.hk.th.vo.MembersVo;

public interface loginDao {

	public List<MembersVo> SelectMemberlist(); //등록된 회원
	public int LoginCheck(MembersVo vo); // 로그인 체크
	public int InsertMember(MembersVo vo); // 회원가입
	public int Checkid(String uid); // 아이디 중복체크
	
	public String selectId(MembersVo vo);
	public String selectPw(MembersVo vo);
}
