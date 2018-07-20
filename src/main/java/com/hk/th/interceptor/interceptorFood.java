package com.hk.th.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class interceptorFood extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		Object obj=request.getSession().getAttribute("loginUid");
		
		if(obj==null){
		//로그인이 안되어 있는 상태인 경우 로그인 폼으로(redirect)
		response.sendRedirect("/login.do");
		return false;//더이상 컨트롤러 요청으로 못가도록 false로 반환
		}
		
		//preHandle의 return은 컨트롤러 요청 uri로 가도 되나 안되나를 허가하는 의미
		//따라서 true로하면 컨트롤러 uri로 이동
		
		return true;
		}
	
}
