package com.hk.th;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.th.service.bookService;
import com.hk.th.vo.MembersVo;
import com.hk.th.vo.Paging;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;


@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Resource(name="bookService")
	private bookService bosv;
	
	Paging pagemaker;
	
//	예약메인
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String reservation(Model model,Locale locale,HttpServletRequest request){
	
		//ArrayList<resVo> list = bosv.reslist();
		//model.addAttribute("list",list);
		
		ArrayList<reviewVo> reviewlist = bosv.selectReview();
		
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages")); 
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost();
		
		ArrayList<resVo> page = new ArrayList<resVo>();
		page = (ArrayList<resVo>)bosv.getpageList(offset, paging.getmaxPost());
		
		paging.setNumberOfRecords(bosv.getpageCount());
		
		paging.makePaging();
		
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		model.addAttribute("review",reviewlist);
		
		return "/reservation/reservation";
	}
	
//	예약맛집 검색
	@RequestMapping(value = "/resv_find.do", method = RequestMethod.GET)
	public String reservation_find(Model model,Locale locale,HttpServletRequest request){
		
		String line = request.getParameter("foodcode");
		String theme = request.getParameter("themacode");
		String location = request.getParameter("locationcode");
		String res_name = request.getParameter("mat_name");
		String res_addr = request.getParameter("mat_loca");
		
		//ArrayList<resVo> list = bosv.searchlist(line,theme,location,res_name,res_addr);
		
		ArrayList<reviewVo> reviewlist = bosv.selectReview();
		
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages")); 
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost();
		
		ArrayList<resVo> page = new ArrayList<resVo>();
		page = (ArrayList<resVo>)bosv.searchpaging(line,theme,location,res_name,res_addr,offset, paging.getmaxPost());
		
		paging.setNumberOfRecords(bosv.searchpagingCount(line,theme,location,res_name,res_addr));
		
		paging.makePaging();
		
		
		model.addAttribute("foodcode",line);
		model.addAttribute("themacode",theme);
		model.addAttribute("locationcode",location);
		model.addAttribute("mat_name",res_name);
		model.addAttribute("mat_loca",res_addr);
		
		model.addAttribute("list",page);
		model.addAttribute("paging",paging);
		model.addAttribute("review",reviewlist);
		
		return "/reservation/reservation_search";
	}
	
//	예약정보 입력 폼 
	@RequestMapping(value = "/resv_info.do", method = RequestMethod.GET)
	public String reservation_info(Model model,Locale locale,HttpServletRequest request ){
		
		String res_code = request.getParameter("res_code");
		
		List<resVo> resdetail = bosv.resinfo(res_code);
		model.addAttribute("res",resdetail);
		model.addAttribute("res_code",res_code);
		
		return "/reservation/reservation_info";
	}
	
//  예약정보 처리
	@RequestMapping(value = "/resv_book.do", method = RequestMethod.GET)
	public String MYreservation(Model model,Locale locale,MembersVo vo,HttpServletRequest request,bookVo bvo){
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginUid");
		
		
		int res_code = Integer.parseInt(request.getParameter("res_code"));
		String bo_name = request.getParameter("bo_name");		
		String bo_date = request.getParameter("bo_date");
		String bo_time = request.getParameter("bo_time");
		int bo_human = Integer.parseInt(request.getParameter("bo_human"));
		String bo_tel = request.getParameter("bo_tel");
		String bo_email = request.getParameter("bo_email");
		String bo_dotcom = request.getParameter("myselect");
		String mail = bo_email + "@"+ bo_dotcom;
		
		bvo.setBo_uid(userid);
		bvo.setRes_code(res_code);
		bvo.setBo_name(bo_name);
		bvo.setBo_date(bo_date);
		bvo.setBo_time(bo_time);
		bvo.setBo_member(bo_human);
		bvo.setBo_tel(bo_tel);
		bvo.setBo_email(mail);
		
		int result = bosv.insertbook(bvo);
		
		
		return "redirect:resv_my.do";
	}
	
//	나의 예약 정보
	@RequestMapping(value = "/resv_my.do", method = RequestMethod.GET)
	public String reservation_my(Model model,Locale locale,MembersVo vo,HttpServletRequest request ){
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginUid");
		
		ArrayList<resVo> res_list = bosv.reslist();
		
		model.addAttribute("res",res_list);
		
		
		//paging
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages")); 
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost();
		
		ArrayList<bookVo> page = new ArrayList<bookVo>();
		page = (ArrayList<bookVo>)bosv.mybook_getpageListbyId(offset, paging.getmaxPost(),userid);
		
		paging.setNumberOfRecords(bosv.mybook_getpageCountByid(userid));
		
		paging.makePaging();
		
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);


		return "/reservation/reservation_my";
	}
	
//	예약정보 확인	
	@RequestMapping(value = "/resv_detail.do", method = RequestMethod.GET)
	public String reservation_detail(@RequestParam("bo_code") String bo_code, Model model,Locale locale,HttpServletRequest request ){
		
		bo_code = request.getParameter("bo_code");
		
		ArrayList<bookVo> list = bosv.bookdetail(bo_code);	
		
		model.addAttribute("list",list);
		model.addAttribute("bo_code",bo_code);
		
		return "/reservation/reservation_detail";
		
	}
	
// 예약정보 수정
	@RequestMapping(value = "/resv_modify.do", method = RequestMethod.POST)
	public String reservation_modify(RedirectAttributes redirectAttributes,Model model,Locale locale,HttpServletRequest request,bookVo bvo ){
		
		bvo.setBo_code(Integer.parseInt(request.getParameter("bo_code")));
		bvo.setBo_uid(request.getParameter("id"));
		bvo.setBo_name(request.getParameter("name"));
		bvo.setBo_tel(request.getParameter("phone"));
		String f_email = request.getParameter("f_email");
		String e_email = request.getParameter("e_email");
		String email = f_email + "@" + e_email;
		bvo.setBo_email(email);
		
		int result = bosv.updatebook(bvo);
		
		redirectAttributes.addAttribute("bo_code",bvo.getBo_code());

		return "redirect:resv_detail.do";
	}
	
//	예약정보 삭제
	@RequestMapping(value = "/resv_del.do", method = RequestMethod.GET)
	public String reservation_delete(Model model,Locale locale,HttpServletRequest request,bookVo bvo ){
		
		String bo_code = request.getParameter("bo_code");
		
		int result = bosv.delbook(bo_code);

		return "redirect:resv_my.do";
		
	}
	
	
		
	
	


}
