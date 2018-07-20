package com.hk.th;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.th.service.MainresService;
import com.hk.th.vo.Paging;
import com.hk.th.vo.bookVo;
import com.hk.th.vo.regionVo;
import com.hk.th.vo.resVo;


@Controller
public class MainController {

	@Resource(name="MainresService")
	private MainresService Mrs;
	
	Paging pagemaker;	//페이징을 사용하기 위한 것.
	
	@RequestMapping(value="/main.do",method = {RequestMethod.GET , RequestMethod.POST})
	public String main(Model model, HttpServletRequest request,resVo resvo,		
		@RequestParam(value="fileload",required=false)MultipartFile fileload) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String newFileName = resvo.getPics()+ ".jpg";
		resvo.setPics(newFileName);
		int map_num = Integer.parseInt(request.getParameter("map_num"));//100
		int currentPageNo=1;
		int maxPost=3;
		
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost); 
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost(); 

		paging.setNumberOfRecords(Mrs.getrescount(map_num)); 
		
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
	@RequestMapping(value="/search.do",method = {RequestMethod.GET , RequestMethod.POST})
	public String search(Model model, HttpServletRequest request){
		
		String res_name = request.getParameter("res_name");
		int currentPageNo=1;
		int maxPost=5;
		
		if(request.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		int offset = (paging.getCurrentPageNo() -1) * paging.getmaxPost();
		paging.setNumberOfRecords(Mrs.getsearchResName(res_name));
		paging.makePaging(); 
		ArrayList<resVo> page = (ArrayList<resVo>) Mrs.getpageResName(offset, paging.getmaxPost(), res_name);
		ArrayList<String> piclist = new ArrayList<String>();
		String[] arr = null;
		
	    for(int i =0; i<page.size(); i++) {
	    	String temp = page.get(i).getPics();
	    	
	    	for(int a=0;a<2;a++){
	    		arr = temp.split("/");
	    		piclist.add(arr[a]);
	    	}
	    }
	    model.addAttribute("max",paging.getNumberOfRecords());
	    model.addAttribute("count",paging.getNumberOfRecords());
	    model.addAttribute("piclist",piclist);
		model.addAttribute("res_name",res_name);
		model.addAttribute("list",page);
		model.addAttribute("paging",paging);
		
	    return "total_search";
	}
	
	
	
	
}
