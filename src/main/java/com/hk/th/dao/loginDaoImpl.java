package com.hk.th.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.MembersVo;

@Repository("lD")
public class loginDaoImpl implements loginDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String ns="lD.";
	@Override
	public List<MembersVo> SelectMemberlist() {
		
		List<MembersVo> list = sqlsession.selectList(ns+"SelectMemberlist");
		return list;
	}

	@Override
	public int LoginCheck(MembersVo vo) {
		 int check = sqlsession.selectOne(ns+"LoginCheck",vo);
		return check;
	}

	@Override
	public int InsertMember(MembersVo vo) {
	 
		int reg = sqlsession.insert(ns+"InsertMember",vo);
		return reg;
	}

	@Override
	public int Checkid(String uid) {
		int result = sqlsession.selectOne(ns+"Checkid",uid);
		return result;
	}

	@Override
	public String selectId(MembersVo vo) {
		String id = sqlsession.selectOne(ns+"selectId",vo);
		return id;
	}

	@Override
	public String selectPw(MembersVo vo) {
		String pw = sqlsession.selectOne(ns+"selectPw",vo);
		return pw;
	}

}
