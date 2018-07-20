package com.hk.th;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.internal.matchers.SubstringMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.MainresService;
import com.hk.th.service.ManaService;
import com.hk.th.service.MypageUserService;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.menuVo;
import com.hk.th.vo.resVo;
import com.hk.th.vo.MembersVo;
import com.hk.th.vo.Paging;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	
	@Resource(name="MypageUserService")
	private MypageUserService mysvs;

	@Resource(name="MainresService")
	private MainresService Mrs;
	

	
	Paging pagemaker;	//페이징을 사용하기 위한 것.

	

	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int map_num=120;
		
		//int map_num = Integer.parseInt(request.getParameter("map_num"));//100
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages에있는 string 타입 변수를 int형으로 바꾸어서 currentPageNo에 담는다.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java에있는 currentPAgeNo, maxPost를 paging변수에 담는다.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml에서 select를 할때 사용하기위한 offset 변수의 선언. 
		// 현재 3페이지 이고, 그 페이지에 게시물이 10개가 있다면 offset값은 (3-1) * 10 = 20이 된다.
			

		paging.setNumberOfRecords(Mrs.getrescount(map_num)); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		
		paging.makePaging(); 
		
	
		ArrayList<resVo> page = new ArrayList<resVo>(); 
		page = (ArrayList<resVo>) Mrs.getpagereslist(offset, paging.getmaxPost(), map_num);
		ArrayList<String> piclist = new ArrayList<String>();
		String[] arr = null;
	    for(int i =0; i<page.size(); i++) {
	    	String temp = page.get(i).getPics();
	    	
	    	for(int a=0;a<6;a++){
	    		arr = temp.split("/");
	    		piclist.add(arr[a]);
	    	}

	    }
	   
	    model.addAttribute("piclist",piclist);
		model.addAttribute("map_num",map_num);
		model.addAttribute("list",page);
		model.addAttribute("paging",paging);
		
		
		
		return "main";
		
	
	}
	
	@RequestMapping(value = "/form_myres.do", method = RequestMethod.GET)
	public String form_myres(Model model ){
	
		
		
		return "/mypage/form_myres";
		
	
	}
	
	@RequestMapping(value = "/mypage_reservation_shop.do", method = RequestMethod.GET)
	public String mypage_reservation_shop(Model model,HttpServletRequest request,resVo resvo ){
		
		String uid=request.getParameter("uid");
		MembersVo membervo=mysvs.getdetailmembers(uid);
		String enroll_str=membervo.getEnroll();
		int enroll=Integer.valueOf(enroll_str);
		resvo=mysvs.getselectRes_code(uid);
				
		
		
	
		
		if(enroll==0){
			return "/mypage/form_myres";
		}
			
		int res_code=resvo.getRes_code();
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages에있는 string 타입 변수를 int형으로 바꾸어서 currentPageNo에 담는다.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java에있는 currentPAgeNo, maxPost를 paging변수에 담는다.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml에서 select를 할때 사용하기위한 offset 변수의 선언. 
		// 현재 3페이지 이고, 그 페이지에 게시물이 10개가 있다면 offset값은 (3-1) * 10 = 20이 된다.
			
		
		ArrayList<bookVo> page = new ArrayList<bookVo>(); // WriteInfo에 있는 변수들을 ArrayList 타입의 배열로 둔 다음 이를 page라는 변수에 담는다.
		page = (ArrayList<bookVo>) mysvs.getpageList(offset, paging.getmaxPost(),res_code); 
		//writeService.java에 있는 writeList 함수를 이용하여 offset값과 maxPost값을 ArrayList 타입의 배열로 담고, 이 배열 자체를 page 변수에 담는다.																							
		
		paging.setNumberOfRecords(mysvs.getpageGetCount(res_code)); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		
		paging.makePaging(); 
		
		model.addAttribute("res_code",res_code);
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		
		
		
		

		
		return "/mypage/mypage_reservation_shop";
		
	
	}
	
	@RequestMapping(value = "/mypage_reservation_shop2.do", method = RequestMethod.GET)
	public String mypage_reservation_shop2(Model model,HttpServletRequest request,resVo resvo ){
		
		
		String res_code1=request.getParameter("res_code");
		
		int res_code=Integer.valueOf(res_code1);
		
	
		
		if(res_code==0){
			return "redirect: mypage_user_info.do";
		}
			
		
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)//게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(request.getParameter("pages")); //pages에있는 string 타입 변수를 int형으로 바꾸어서 currentPageNo에 담는다.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java에있는 currentPAgeNo, maxPost를 paging변수에 담는다.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); // query.xml에서 select를 할때 사용하기위한 offset 변수의 선언. 
		// 현재 3페이지 이고, 그 페이지에 게시물이 10개가 있다면 offset값은 (3-1) * 10 = 20이 된다.
			
		
		ArrayList<bookVo> page = new ArrayList<bookVo>(); // WriteInfo에 있는 변수들을 ArrayList 타입의 배열로 둔 다음 이를 page라는 변수에 담는다.
		page = (ArrayList<bookVo>) mysvs.getpageList(offset, paging.getmaxPost(),res_code); 
		//writeService.java에 있는 writeList 함수를 이용하여 offset값과 maxPost값을 ArrayList 타입의 배열로 담고, 이 배열 자체를 page 변수에 담는다.																							
		
		paging.setNumberOfRecords(mysvs.getpageGetCount(res_code)); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		
		paging.makePaging(); 
		
		model.addAttribute("res_code",res_code);
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		
		
		
		

		
		return "/mypage/mypage_reservation_shop";
		
	
	}
	
	@RequestMapping(value = "/mypage_user_info.do", method = RequestMethod.GET)
	public String mypage_user_info(Model model,HttpServletRequest request,MembersVo memvo,resVo resvo ){
		
		HttpSession session = request.getSession();
		//song_ga를 값으로 가져가서 list들을 뿌려준다.
		String uid=(String) session.getAttribute("loginUid");
		
		//String id=request.getParameter("uid");	
		MembersVo list= mysvs.getdetailmembers(uid);	
		model.addAttribute("uid",uid);
		
		
		//email를 짤라서 넣어준다.
		String email=list.getEmail();
		String email2=email.substring(email.indexOf("@")+1,email.length());//뒤
		email=email.substring(0,email.indexOf("@"));//앞
		list.setEmail(email);  
		String enroll=list.getEnroll();
		model.addAttribute("list",list);
		model.addAttribute("email2",email2);
		model.addAttribute("enroll",enroll);
	
	
		
		return "/mypage/mypage_user_info";
		
	
	}
	
	@RequestMapping(value = "/mypage_user_info2.do", method = RequestMethod.GET)
	public String mypage_user_info2(Model model,HttpServletRequest request,MembersVo membersvo ){
		
		
		//수정버튼을 눌러서 온 값들을(이메일) 정리한다.	
		//이메일값을 가져온다
		String email=membersvo.getEmail();				
		String email2=request.getParameter("email2");
		membersvo.setEmail(email+"@"+email2);//song+ @+naver.com
		
		//수정한 이메일들을 넣어준다.
		int list=mysvs.getupdatemembers(membersvo);
		
		return "redirect:mypage_user_info.do";
		
	
	}
	

	
	@RequestMapping(value = "/mypage_user_myres.do", method = RequestMethod.GET)
	public String mypage_user_myres(Model model, HttpServletRequest request,resVo vo,MembersVo memvo){
		
		String res_uid=request.getParameter("uid");
		
		resVo vo1=mysvs.getselectRes_code(res_uid);
		
		model.addAttribute("vo",vo1);
		
		
		//등록여부를 확인한다.(아이디를 넣어준다)
		String uid=request.getParameter("uid");		
		String check=mysvs.getcheckmembers(uid);
		int check2=Integer.valueOf(check);
		model.addAttribute("check",check);
		model.addAttribute("uid",uid);
		
		
		if(check2!=0){
			int res_code=vo1.getRes_code();
			ArrayList<menuVo> list=mysvs.getselectmenu(res_code);			
			model.addAttribute("list",list);
			return "/mypage/mypage_user_myres";
			
		}else{
		
			return "/mypage/form_myres";
		}
		
		
		
		
		
	
	}
	
	@RequestMapping(value = "/mypage_user_myres2.do", method = RequestMethod.GET)
	public String mypage_user_myres2(Model model, HttpServletRequest request,resVo resvo,menuVo menuvo){
		
			
		mysvs.getupdateres(resvo);		
		String res_uid=request.getParameter("res_uid");
		resvo=mysvs.getselectRes_code(res_uid);				
		model.addAttribute("vo",resvo);
		
		mysvs.getupdatemenu(menuvo);
		String code=request.getParameter("res_code");
		int res_code=Integer.valueOf(code);		
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		return "/mypage/mypage_user_myres";
		

	}
	
	@RequestMapping(value = "/user_menu_update.do", method = RequestMethod.GET)
	public String user_menu_update(Model model, HttpServletRequest request,resVo resvo,menuVo menuvo){		
		
		mysvs.getupdatemenu(menuvo);
		String code=request.getParameter("res_code");
		int res_code=Integer.valueOf(code);		
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		String res_uid=request.getParameter("res_uid");		
		resVo vo1=mysvs.getselectRes_code(res_uid);
		
		model.addAttribute("vo",vo1);
		return "/mypage/mypage_user_myres";
		
	}
	
	@RequestMapping(value = "/mypage_user_myres_path.do", method = RequestMethod.GET)
	public String mypage_user_myres_path(Model model, HttpServletRequest request,resVo resvo){
		//음식점예약에서 나의 음식점으로 가는 경유지
		
		String res_code1=request.getParameter("res_code");
		int res_code=Integer.valueOf(res_code1);			
		ArrayList<menuVo> list=mysvs.getselectmenu(res_code);
		model.addAttribute("list",list);
		
		resvo=mysvs.getAllRescode(res_code);
		model.addAttribute("vo",resvo);
		

		return "/mypage/mypage_user_myres";
		

	}
	

	
	@RequestMapping(value = "/delete_myres.do", method = RequestMethod.GET)
	public String delete_myres(Model model, HttpServletRequest request,resVo resvo){
		
		String res_uid=request.getParameter("res_uid");
		
		
		mysvs.getdelete(res_uid);
		
		int res_code=resvo.getRes_code();
		if(res_code==0){
			
			mysvs.getupdateenroll(res_uid);
			
		}
		return "redirect:mypage_user_info.do";
		
		
		
		

	}
	
	@RequestMapping(value = "/mypage_user_check.do", method = RequestMethod.GET)
	public String mypage_user_check(Model model,resVo resvo,MembersVo memvo,HttpServletRequest request ){
		
		String uid="song_ga";
		int insert=mysvs.getinsertres(resvo,uid);
		
		
		//String check=mysvs.getcheckmembers(uid);
		
		//check="1";
		//MembersVo list= mysvs.getdetailmembers(uid);
		//list.setEnroll(check);
		
		return "redirect:mypage_user_info.do";
		
	
	}
	
	@RequestMapping(value = "/reservation_shop_detail.do", method = RequestMethod.GET)
	public String reservation_shop_detail(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
		
		String bo_code1=request.getParameter("bo_code");
		int bo_code=Integer.valueOf(bo_code1);
		
		
		
		bookvo=mysvs.getdetailbook(bo_code);
		String email=bookvo.getBo_email();
		String email2=email.substring(email.indexOf("@")+1,email.length());//뒤
		email=email.substring(0,email.indexOf("@"));//앞
		
		
		
		bookVo detail=mysvs.getdetailbook(bo_code);
		detail.setBo_email(email);
		
		model.addAttribute("detail",detail);
		model.addAttribute("email2",email2);
	
		return "/mypage/reservation_shop_detail";
		
	
	}
	
	@RequestMapping(value = "/reservation_shop_detail2.do", method = RequestMethod.GET)
	public String reservation_shop_detail2(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
			
			
			int bo_code=bookvo.getBo_code();			
			String bo_conf=bookvo.getBo_conf();
			
			
			mysvs.getupdateconf(bookvo);
			bookvo=mysvs.getdetailbook(bo_code);
			String email2=request.getParameter("email2");			
			String email=bookvo.getBo_email();
			email=email.substring(0,email.indexOf("@"));
			bookvo.setBo_email(email);
			
			model.addAttribute("detail",bookvo);
			model.addAttribute("email2",email2);
			
		
		return "/mypage/reservation_shop_detail";
		
	
		
	}
	

	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(Model model,bookVo bookvo,resVo resvo,HttpServletRequest request ){
		String uid=request.getParameter("uid");
		mysvs.getdeleteUser(uid);
		
		return "redirect:logout.do";
		
		
	}
	
		
	
			
	
}

