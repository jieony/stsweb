package com.hk.th;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.loginService;
import com.hk.th.vo.MembersVo;


@Controller
public class loginController {

	@Resource(name="loginService")
	private loginService lS;

	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request ){
		request.getSession().invalidate();//세션 무효화 ,삭제
		return "redirect:/";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request ){
		return "/login/loginform";
	}
	
	@RequestMapping(value="/loginChk.do", method = RequestMethod.GET)
	public String loginChk(Model model,MembersVo vo ,HttpServletRequest request ){
		int result= lS.LoginCheck(vo);
		if(result==1){
			request.getSession().setAttribute("loginUid", vo.getUid());
		}
		model.addAttribute("result",result);
		return "/login/loginform";
		
	}
	
	@RequestMapping(value="/checkId.do", method = RequestMethod.GET)
	public String checkId(Model model, HttpServletRequest request ){
		String uid = request.getParameter("id");
		int result = lS.Memcheckid(uid);

		model.addAttribute("result",result);
		model.addAttribute("id", uid);	
		return "/login/joinform";

	}
	@RequestMapping(value="/joinform.do", method = RequestMethod.GET)
	public String joinform(Model model, MembersVo vo){
		return "/login/joinform";
	}
	
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String join(Model model, MembersVo vo, HttpServletRequest request ){
		String addr2 = request.getParameter("address2");
		String addr = vo.getAddress() + addr2;
		vo.setAddress(addr);
		
		int reg = lS.InsertMemberDo(vo);
		
		return "/login/loginform";
	}

	@RequestMapping(value="/findIdPw.do", method = RequestMethod.GET)
	public String findIdPw(Model model){
		return "/login/findIdPw";
	}
	@RequestMapping(value="/findId.do", method = RequestMethod.GET)
	public String findId(Model model){
		return "/findId";
	}
	@RequestMapping(value="/findPw.do", method = RequestMethod.GET)
	public String findPw(Model model){
		return "/login/findPw";
	}
}
