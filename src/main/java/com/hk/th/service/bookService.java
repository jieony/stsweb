package com.hk.th.service;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

public interface bookService {

	ArrayList<resVo> reslist();

	ArrayList<resVo> searchlist(String line,String theme,String location,String res_name,String res_addr);

	List<resVo> resinfo(String res_code);

	ArrayList<bookVo> booklistbyid(String userid);

	ArrayList<bookVo> bookdetail(String bo_code);

	int updatebook(bookVo bvo);

	int delbook(String bo_code);

	int insertbook(bookVo bvo);

	
	//resvlist paging
	List<resVo> getpageList(int offset, int noOfRecords);

	int getpageCount();

	
	//resv_my paging
	List<bookVo> mybook_getpageListbyId(int offset, int noOfRecords, String userid);

	int mybook_getpageCountByid(String userid);

	ArrayList<reviewVo> selectReview();

	ArrayList<resVo> selectpiclist();

	ArrayList<resVo> searchpaging(String line, String theme, String location, String res_name, String res_addr,
			int offset, int noOfRecords);

	int searchpagingCount(String line, String theme, String location, String res_name, String res_addr);


}
