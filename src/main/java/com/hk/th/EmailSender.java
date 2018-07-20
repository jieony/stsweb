package com.hk.th;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.hk.th.vo.MembersVo;


@Component
public class EmailSender {

@Autowired
private JavaMailSender mailSender;



//이름이랑 이메일
public void sendEmailId(MembersVo memvo) throws Exception{
   //메일 발송 기능 제공
	  MimeMessage msg=mailSender.createMimeMessage();
   
	 
	   msg.setSubject("'서울맛집찾기'에서 보낸 메일입니다.");      
	   msg.setText(memvo.getName()+"님의 아이디는 '"+memvo.getUid()+"' 입니다.");
	   msg.setRecipient(RecipientType.TO, new InternetAddress(memvo.getEmail()));
	   msg.setFrom(new InternetAddress("songwlsgur@gmail.com"));
	   mailSender.send(msg);

	}

public void sendEmailPw(MembersVo memvo) throws Exception{
	   //메일 발송 기능 제공
		  MimeMessage msg=mailSender.createMimeMessage();
	   
		 
		   msg.setSubject("'서울맛집찾기'에서 보낸 메일입니다.");      
		   msg.setText(memvo.getName()+"님의 비밀번호는 '"+memvo.getPw()+"' 입니다.");
		   msg.setRecipient(RecipientType.TO, new InternetAddress(memvo.getEmail()));
		   msg.setFrom(new InternetAddress("songwlsgur@gmail.com"));
		   mailSender.send(msg);

		}

}
