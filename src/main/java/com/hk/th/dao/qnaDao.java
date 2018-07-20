package com.hk.th.dao;


import java.util.List;

import com.hk.th.vo.qnaVo;

public interface qnaDao {
	//qna select
	public List<qnaVo> selectqnaList();
	
	public List<qnaVo> selectqnaListpaging(int offset,int noOfRecords);
	
	public List<qnaVo> selectqnareList();
	
	public qnaVo noticeList();
	//qna insert
	public int insertqna(qnaVo qnaVo);
	
	//qna detail
	public qnaVo detailqna(int num);
	
	//qna delete
	public int deleteqna(int num);
	
	//qna update
	public int updateqna(qnaVo qnaVo);
	public qnaVo selectqnaBynum(int num);
	//qna update hits
	public int updatecount(int num,int q_hits);
	
	//qna search
	public List<qnaVo> searchId(String id,String stype);
	
	//qna reply
	public int insertReply(qnaVo qnaVo);
	
	//qna page
	public int pageGetCount();
	
	public List<qnaVo> selectpageList(int offset, int noOfRecords);

	public qnaVo relistbyQnum(String n);

	
}
