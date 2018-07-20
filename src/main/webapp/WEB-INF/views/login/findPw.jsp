<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>PW찾기</title>
  <script>
  function success(frm) {
	  if(!document.getElementById("name").value){
		  alert("이름을 입력하세요.");
		  return false;
	  }
	  if(!document.getElementById("uid").value){
		  alert("아이디를 입력하세요.");
		  return false;
	  }
	  
	  var email = document.getElementById("email").value;
	  var arrUrl=[".co.kr",".com",".net",".or.kr",".go.kr"];
	  var check1=false;
	  var check2=false;
	  
	  if(!email) {
		    alert("이메일을 입력하세요.");
		    return false;
	  }
	  
	  if(email.indexOf("@")>0){check1=true;}
	  for(var i=0;i<arrUrl.length;i++){
		  if(email.indexOf(arrUrl[i])>0){check2=true};
	  }
	  
	  if(check1&&check2){
	  }else{
		  alert("잘못된 이메일 형식입니다.");
		  return false;
	  }	  
	  if(confirm("이메일을 전송 하시겠습니까?"))
		  return true;
	  else 
		  return false;
  }
  
  </script>
  <style media="screen">
  .find{
    margin-top: 30px;
    margin-left: 30px;
  }
  .find_btn{
    margin: 15px 0 0 40px;
    padding: 10px;
    background-color: #7d7d7d;
    color:#fff;
    border-style: none;
    border-radius:4px;
  }
  .findinput{
    border:1px solid #d6d6d6;
    border-radius:4px;
    margin-bottom: 10px;
    height: 40px;
    padding-left: 10px;
    box-sizing: border-box;
  }
  
  </style>
</head>
<body style="width:200px;">
  <div class="find">
   <form action="sendmailPw.do" method="get"  onsubmit="return success(this);">
    <input class="findinput" type="text" id="name" name="name" value="" placeholder="이름"><br>
    <input class="findinput" type="text" id="uid" name="uid" value="" placeholder="아이디"><br>
    <input class="findinput" type="text" id="email" name="email" value="" placeholder="이메일"><br>
    <button class="find_btn" type="submit">비밀번호찾기</button>
    <c:if test="${id eq 1 }">
    	<p style="color:red; width:200px;" >등록된 아이디가 없습니다.</p>
    </c:if>
    <c:if test="${id eq 2 }">
    	<p style="color:red; width:200px;" >이메일이 전송되었습니다.</p>
    </c:if>
  </form>
  </div>
</body>
</html>
