package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

public interface detailService {
	public int getCateCount(int code);
	public ArrayList<String> getCate(int code);
	public ArrayList<menuVo> getMenuByCate(menuVo vo);
	public ArrayList<reviewVo> getReview(int code);
	public int insertReview(reviewVo vo);
	public int getReviewCount(int code);
	public boolean updateScore(resVo vo);
	public boolean deleteReview(int num);
	public ArrayList<Float> getScores(int code);
	//paging count
	public int getdetailcount();
	public ArrayList<reviewVo> getdetailpagelist(int offset, int noOfRecords,int res_code);
}
