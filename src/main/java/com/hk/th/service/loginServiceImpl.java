package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hk.th.dao.loginDao;
import com.hk.th.vo.MembersVo;

@Repository("loginService")
public class loginServiceImpl implements loginService {

	@Resource(name="lD")
	private loginDao lD;
	public ArrayList<MembersVo> getSelectMember() {
		ArrayList<MembersVo> memlist =null;
		memlist = (ArrayList<MembersVo>)lD.SelectMemberlist();
		return memlist;
	}

	@Override
	public int LoginCheck(MembersVo vo) {
	 int result = lD.LoginCheck(vo);
		return result;
	}

	@Override
	public int InsertMemberDo(MembersVo vo) {
		int reg = lD.InsertMember(vo);
		return reg;
	}

	@Override
	public int Memcheckid(String uid) {
		int result = lD.Checkid(uid);
		return result;
	}

	@Override
	public String getId(MembersVo vo) {
		String id = lD.selectId(vo);
		return id;
	}

	@Override
	public String getPw(MembersVo vo) {
		String pw = lD.selectPw(vo);
		return pw;
	}

}
