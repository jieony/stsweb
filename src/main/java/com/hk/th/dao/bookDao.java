package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

public interface bookDao {

	ArrayList<resVo> reslist();

	ArrayList<resVo> searchlist(String line,String theme,String location,String res_name,String res_addr);

	List<resVo> resinfo(String res_code);

	ArrayList<bookVo> booklistbyid(String userid);

	ArrayList<bookVo> bookdetail(String bo_code);

	int updatebook(bookVo bvo);

	int delbook(String bo_code);

	int insertbook(bookVo bvo);

	int pageGetCount();

	List<resVo> pageList(int offset, int noOfRecords);

	int mybook_pageGetCount(String userid);

	List<bookVo> mybook_pageList(int offset, int noOfRecords, String userid);

	List<reviewVo> selectReview();

	List<resVo> selectpiclist();

	int searchpagingCount(String line, String theme, String location, String res_name, String res_addr);

	List<resVo> searchpaging(String line, String theme, String location, String res_name, String res_addr, int offset,
			int noOfRecords);


}
