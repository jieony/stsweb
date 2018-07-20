package com.hk.th;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.ManaService;
import com.hk.th.service.detailService;
import com.hk.th.vo.Paging;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.reviewVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class detailController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Resource(name="ManaService")
	private ManaService mnsv;
	@Resource(name="detailService")
	private detailService desv;
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int code = Integer.parseInt(request.getParameter("res_code"));
		
		resVo vo = mnsv.getResDetail(code);//가게 정보
		
		String pics = vo.getPics();
		String[] picArr = null;
		
		for(int i=0;i<6;i++){
			picArr=pics.split("/");
		}
		
		ArrayList<menuVo> list = mnsv.getMenu(code);
		ArrayList<String> cate = desv.getCate(code);//점심 저녁
		
		int count = desv.getCateCount(code);
		int recount = desv.getReviewCount(code);
		//ArrayList<reviewVo> re = desv.getReview(code);
		
		menuVo vocate = new menuVo();
		
		for(int i = 0;i<cate.size();i++){
			
			ArrayList<menuVo> li = new ArrayList<menuVo>();			
			vocate.setMenu_cate(cate.get(i));
			vocate.setRes_code(code);
			
			li= (ArrayList<menuVo>) desv.getMenuByCate(vocate);
			
			String arg = "li" + (i+1);
			
			model.addAttribute(arg, li);
			
		}
		
		
		
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages에있는 string 타입 변수를 int형으로 바꾸어서 currentPageNo에 담는다.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java에있는 currentPAgeNo, maxPost를 paging변수에 담는다.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml에서 select를 할때 사용하기위한 offset 변수의 선언. 
		// 현재 3페이지 이고, 그 페이지에 게시물이 10개가 있다면 offset값은 (3-1) * 10 = 20이 된다.
			
		
		ArrayList<reviewVo> page = new ArrayList<reviewVo>(); // WriteInfo에 있는 변수들을 ArrayList 타입의 배열로 둔 다음 이를 page라는 변수에 담는다.
		page = (ArrayList<reviewVo>) desv.getdetailpagelist(offset, paging.getmaxPost(), code);
		//writeService.java에 있는 writeList 함수를 이용하여 offset값과 maxPost값을 ArrayList 타입의 배열로 담고, 이 배열 자체를 page 변수에 담는다.																							
		
		paging.setNumberOfRecords(desv.getdetailcount()); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		
		paging.makePaging(); 
		
		model.addAttribute("res_code",code);
		model.addAttribute("re",page);
		model.addAttribute("paging",paging);
	
		model.addAttribute("reCount",recount);//리뷰갯수
		//model.addAttribute("re",re);//리뷰
		model.addAttribute("pics",picArr);//음식점 사진들
		model.addAttribute("cate",cate);//음식점 메뉴 분류
		model.addAttribute("count",count);
		model.addAttribute("vo",vo);//디테일
		model.addAttribute("list",list);//전체 메뉴

		return "detail";
	}

	@RequestMapping(value = "/setReview.do", method = RequestMethod.GET)
	public String setReview(Locale locale, Model model,reviewVo revo,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Object obj=request.getSession().getAttribute("loginUid");
		revo.setUid((String)obj);
		int code = revo.getRes_code();
		System.out.println(revo.getScore());
		int result = desv.insertReview(revo);
		
		resVo vo = mnsv.getResDetail(code);//가게 정보
		
		ArrayList<Float> list = desv.getScores(code);//가게리뷰 점수 목록
		int count =desv.getReviewCount(code);//가게 리뷰 갯수

		float avg = 0;float sum = 0;
		
		for(int i=0;i<list.size();i++){
			sum=sum+list.get(i);
		}
		
		
		if(count==0){
			avg=0;
		}else{
			avg = (float)sum/count;//평균내기
		}
		vo.setScore(avg);//점수 저장
		
		desv.updateScore(vo);	//업뎃	
		
		if(result==0){
			model.addAttribute("result",0);
			return "review";
		}else{
			model.addAttribute("result",1);
			return "review";
		}
		
		
	}
	

	@RequestMapping(value = "/reDelete.do", method = RequestMethod.GET)
	public String reDelete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		int code=Integer.parseInt(request.getParameter("res_code"));
		int num=Integer.parseInt(request.getParameter("review_num"));
		resVo vo = mnsv.getResDetail(code);//가게 정보
		
		desv.deleteReview(num);
		
		ArrayList<Float> list = desv.getScores(code);
		float avg = 0;float sum = 0;
		int count = desv.getReviewCount(code);
		
		for(int i=0;i<list.size();i++){
			sum=sum+list.get(i);
		}
		
		avg = (float)sum/count;
		
		vo.setScore(avg);
		
		desv.updateScore(vo);	
		
		return "redirect:detail.do?res_code="+code;
	}
	
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		int code=Integer.parseInt(request.getParameter("res_code"));
		model.addAttribute("code",code);
		
		return "review";
	}
	
	
	
}

