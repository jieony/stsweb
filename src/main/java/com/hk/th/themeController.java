package com.hk.th;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.themeService;

import com.hk.th.vo.Paging;

import com.hk.th.vo.resVo;

@Controller
public class themeController {
	@Resource(name="themeService")
	private themeService the;
	
	@RequestMapping(value="/mtheme.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String theme(Model model, HttpServletRequest request, resVo resvo) throws UnsupportedEncodingException{		
		String theme = request.getParameter("theme");
		theme = java.net.URLDecoder.decode(theme, "UTF-8");
		ArrayList<resVo> themelist =the.getsearchtheme(theme);
	    
		int currentPageNo=1;
		int maxPost=8;
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages")); 
		Paging paging = new Paging(currentPageNo, maxPost); 
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); 
		ArrayList<resVo> page = new ArrayList<resVo>(); 
		page = (ArrayList<resVo>)the.getthemelist(offset, paging.getmaxPost(), theme); 
		ArrayList<String> piclist = new ArrayList<String>();
		
		String[] arr = null;
	   
		for(int i =0; i<page.size(); i++) {
	    	String temp = page.get(i).getPics();
	    	for(int a=0;a<1;a++){
	    		arr = temp.split("/");
	    		piclist.add(arr[a]);
	    	}
	    }

	    model.addAttribute("piclist",piclist);
		model.addAttribute("lists",page);
		model.addAttribute("paging",paging);
		model.addAttribute("list", themelist);	
		model.addAttribute("theme", theme);
		
		paging.setNumberOfRecords(the.GetCount(theme)); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		paging.makePaging(); 
		
		return "/theme/mtheme";
	}

}
