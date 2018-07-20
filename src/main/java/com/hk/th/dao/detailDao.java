package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

public interface detailDao {
	public int getCateCount(int code);
	public List<String> getCate(int code);
	public List<menuVo> getMenuByCate(menuVo vo);
	public List<reviewVo> getReview(int code);
	public int insertReview(reviewVo vo);
	public int getReviewCount(int code);
	public boolean updateScore(resVo vo);
	public boolean deleteReview(int num);
	public List<Float> getScores(int code);
	//paging count
	public int detailcount();
	public List<reviewVo> detailpagelist(int offset, int noOfRecords,int res_code);
}
