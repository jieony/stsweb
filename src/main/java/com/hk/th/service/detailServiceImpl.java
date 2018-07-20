package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.bookDao;
import com.hk.th.dao.detailDao;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

@Service("detailService")
public class detailServiceImpl implements detailService{
	@Resource(name="detailDao")
	private detailDao dedao;

	@Override
	public int getCateCount(int code) {
		int result = dedao.getCateCount(code);
		return result;
	}

	@Override
	public ArrayList<String> getCate(int code) {
		ArrayList<String> cate = (ArrayList<String>) dedao.getCate(code);
		return cate;
	}

	@Override
	public ArrayList<menuVo> getMenuByCate(menuVo vo) {
		ArrayList<menuVo> menu = (ArrayList<menuVo>) dedao.getMenuByCate(vo);
		return menu;
	}

	@Override
	public ArrayList<reviewVo> getReview(int code) {
		ArrayList<reviewVo> re = (ArrayList<reviewVo>) dedao.getReview(code);
		return re;
	}

	@Override
	public int insertReview(reviewVo vo) {
		int result = dedao.insertReview(vo);
		return result;
	}

	@Override
	public int getReviewCount(int code) {
		int result = dedao.getReviewCount(code);
		return result;
	}

	@Override
	public boolean updateScore(resVo vo) {
		dedao.updateScore(vo);
		return true;
	}

	@Override
	public int getdetailcount() {
		int svres=dedao.detailcount();
		return svres;
	}

	@Override
	public ArrayList<reviewVo> getdetailpagelist(int offset, int noOfRecords, int res_code) {
		ArrayList<reviewVo> svres=(ArrayList<reviewVo>) dedao.detailpagelist(offset, noOfRecords, res_code);
		return svres;
	}

	@Override
	public boolean deleteReview(int num) {
		dedao.deleteReview(num);
		return true;
	}

	@Override
	public ArrayList<Float> getScores(int code) {
		ArrayList<Float> list = (ArrayList<Float>) dedao.getScores(code);
		return list;
	}
}
