package com.hk.th;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.th.service.loginService;
//import com.hk.th.service.EmailService;
import com.hk.th.vo.MembersVo;
     @Controller
     public class EmailController {
   
     @Autowired
     private EmailSender emailSender;
     
     @Resource(name="loginService")
     private loginService lsv;
     
     @RequestMapping(value="sendmailId.do",method=RequestMethod.GET)
       public String submit(MembersVo memvo,Model model) throws Exception{
        String id = lsv.getId(memvo);
        if(id==null){
        	model.addAttribute("id",1);
        	return "/findId";
        }else{
        	memvo.setUid(id);
        	emailSender.sendEmailId(memvo);
        	model.addAttribute("id",2);
            return "/findId";
          }
     }
     
     @RequestMapping(value="sendmailPw.do",method=RequestMethod.GET)
     public String sendmailPw(MembersVo memvo,Model model) throws Exception{
      String pw = lsv.getPw(memvo);
      if(pw==null){
      	model.addAttribute("id",1);
      	return "/login/findPw";
      }else{
	    memvo.setPw(pw);
        emailSender.sendEmailPw(memvo);
    	model.addAttribute("id",2);
        return "/login/findPw";
      }
     }
}