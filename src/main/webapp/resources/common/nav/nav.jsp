<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script>
function bookLog(login){
	if(login.length == 0){
 		var log = confirm("회원전용 페이지 입니다. 로그인하시겠습니까?");
		if(log == true){
			location.href='/resv.do';
	    } 
    }else{
    	location.href='/resv.do';
    } 
}
function whoRU(login){
	if(login == 'admin'){
 		//alert("관리자 페이지로 이동.");
		location.href='/manager_penalty.do';
	}else{
		//alert(login+"의 마이페이지로 이동.");
		location.href='/mypage_user_info.do';
	}
}
function gotheme(){
	location.href="mtheme.do?theme="+encodeURI("가족모임");
}

 $(document).ready(function(){
	    $(".btn_search").click(function(){
	    
	    var input = $(".searchtext").val();
	    if(input.length == 0){
	    	 alert("검색어를 입력해주세요")
	    	   return false;
	    }else
	    	location.href='/search.do?res_name='+input;
	    });
	    
	    $(".title").click(function(){
	    	location.href='/';
	    });
  });

</script>

	<header class="header ">
    <div class="top">
       <!-- 로고와 제목 -->
       <div class="title">
       <img class="logo" src="common/image/logo.gif" alt="logo">
       <h2>서울맛집찾기</h2>
       </div>
       <!-- 검색창 -->
       <div class="search">
	       <input class="searchtext" type="text" name="res_name" placeholder="찾으실 음식점 이름을 입력해주세요."/>
	       <button title="검색" class="btn_search">검색</button>
       </div>
    </div>
     <!-- 공통 네비게이션 -->
     <nav>
       <div class="nav">
         <ul class="">
           <li><a href="/">지역별맛집</a></li>
           <li><a href="javascript:gotheme();">테마별맛집</a></li>
           <li><a href="#" onclick="bookLog('${sessionScope.loginUid}')">예약맛집</a></li>
           <li><a href="#" onclick="location.href='qna.do'">Q & A</a></li>
           <c:if test="${not empty sessionScope.loginUid}">
           <button type="button" class="login" onclick="location.href='logout.do'">로그아웃</button>
           <button type="button" class="login" onclick="whoRU('${sessionScope.loginUid}')">마이페이지</button>
           </c:if>
           <c:if test="${empty sessionScope.loginUid}">
           <button type="button" class="login" onclick="location.href='login.do'">로그인</button>
           <button type="button" class="login" onclick="location.href='joinform.do'">회원가입</button>
           </c:if> 
         </ul>
       </div>
     </nav>

   </header>
