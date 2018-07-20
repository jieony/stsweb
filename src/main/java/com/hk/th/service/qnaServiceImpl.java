package com.hk.th.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.qnaDao;
import com.hk.th.vo.qnaVo;

@Service("qnaService")
public class qnaServiceImpl implements qnaService{

	@Resource(name="qnaDao")
	private qnaDao qDao;
	
	@Override
	public ArrayList<qnaVo> qnaList() {
		ArrayList<qnaVo> list = (ArrayList<qnaVo>) qDao.selectqnaList();
		return list;
	}

	@Override
	public ArrayList<qnaVo> qnaListpaging(int offset, int noOfRecords) {
		ArrayList<qnaVo> list =(ArrayList<qnaVo>)qDao.selectqnaListpaging(offset, noOfRecords);	
		return list;
	}
	
	@Override
	public ArrayList<qnaVo> qnareList(){
		
		ArrayList<qnaVo> list =(ArrayList<qnaVo>)qDao.selectqnareList();	
		return list;
	}
	
	@Override
	public int insert(qnaVo qnaVo){

		int write=qDao.insertqna(qnaVo);
		
		return write;
	}

	@Override
	public qnaVo detailqna(int num) {
		qnaVo svres=qDao.detailqna(num);
		return svres;
	}

	@Override
	public int deleteqna(int num) {
		int svres=qDao.deleteqna(num);
		return svres;
	}

	@Override
	public qnaVo getqnaBynum(int num) {
		qnaVo svres=qDao.selectqnaBynum(num);
		
		return svres;
	}

	@Override
	public int updateqna(qnaVo qnaVo) {
		int svres=qDao.updateqna(qnaVo);
		return svres;
	}

	@Override
	public int updatecount(int num,int q_hits) {
		int svres=qDao.updatecount(num,q_hits);
		return svres;
	}

	@Override
	public ArrayList<qnaVo> searchId(String id, String stype) {
		ArrayList<qnaVo> svres=(ArrayList<qnaVo>) qDao.searchId(id, stype);
		return svres;
	}
	@Override
	public int insertReply(qnaVo qnaVo) {
		int svres=qDao.insertReply(qnaVo);
		return svres;
		
	}

	@Override
	public int pageCount() {
		int svres=qDao.pageGetCount();
		return svres;
	}

	@Override
	public ArrayList<qnaVo> selectpageList(int offset, int noOfRecords) {
		ArrayList<qnaVo> svres=(ArrayList<qnaVo>) qDao.selectpageList(offset, noOfRecords);
		return svres;
	}

	@Override
	public qnaVo noticeList() {
		qnaVo svres=qDao.noticeList();
		return svres;
	}

	@Override
	public qnaVo relistbyQnum(String n) {
		qnaVo svres = qDao.relistbyQnum(n);
		return svres;
	}

	

}
