package com.hk.th.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.bookDao;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

@Service("bookService")
public class bookServiceImpl implements bookService{

	@Resource(name="bookDao")
	private bookDao boDao;

	@Override
	public ArrayList<resVo> reslist() {
		ArrayList<resVo> svres = boDao.reslist();
		return svres;
	}

	@Override
	public ArrayList<resVo> searchlist(String line,String theme,String location,String res_name,String res_addr) {
	
		ArrayList<resVo> svres = boDao.searchlist(line,theme,location,res_name,res_addr);
		
		return svres;
	}

	@Override
	public List<resVo> resinfo(String res_code) {
		List<resVo> svres = boDao.resinfo(res_code);
		return svres;
	}

	@Override
	public ArrayList<bookVo> booklistbyid(String userid) {
		ArrayList<bookVo> svres = boDao.booklistbyid(userid);
		return svres;
	}

	@Override
	public ArrayList<bookVo> bookdetail(String bo_code) {
		ArrayList<bookVo> svres = boDao.bookdetail(bo_code);
		return svres;
	}

	@Override
	public int updatebook(bookVo bvo) {
		int svres = boDao.updatebook(bvo);
		return svres;
	}

	@Override
	public int delbook(String bo_code) {
		int svres = boDao.delbook(bo_code);
		return svres;
	}

	@Override
	public int insertbook(bookVo bvo) {
		int svres = boDao.insertbook(bvo);
		return svres;
	}
	
	@Override
	public int getpageCount() {
		int svres = boDao.pageGetCount();
		return svres;
	}

	@Override
	public List<resVo> getpageList(int offset, int noOfRecords) {
		List<resVo> svres = boDao.pageList(offset,noOfRecords);
		return svres;
	}
	
	@Override
	public int mybook_getpageCountByid(String userid) {
		int svres = boDao.mybook_pageGetCount(userid);
		return svres;
	}


	@Override
	public List<bookVo> mybook_getpageListbyId(int offset, int noOfRecords, String userid) {
		List<bookVo> svres = boDao.mybook_pageList(offset,noOfRecords,userid);
		return svres;
	}

	@Override
	public ArrayList<reviewVo> selectReview() {
		List<reviewVo> svres = boDao.selectReview();
		return (ArrayList<reviewVo>) svres;
	}

	@Override
	public ArrayList<resVo> selectpiclist() {
		List<resVo> svres= boDao.selectpiclist();
		return (ArrayList<resVo>) svres;
	}

	@Override
	public ArrayList<resVo> searchpaging(String line, String theme, String location, String res_name, String res_addr,
			int offset, int noOfRecords) {
		List<resVo> svres = boDao.searchpaging(line,theme,location,res_name,res_addr,offset, noOfRecords);
		return (ArrayList<resVo>) svres;
	}

	@Override
	public int searchpagingCount(String line, String theme, String location, String res_name, String res_addr) {
		int svres = boDao.searchpagingCount(line,theme,location,res_name,res_addr);
		return svres;
	}

	


	
	
	
}
