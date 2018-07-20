<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/common/common.css">
  <link rel="stylesheet" href="/css/css_mypage/mypage_user.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<script>
	function deletechk(id){
		var x = confirm("회원"+id+"를(을) 정말 삭제 하시겠습니까?")
		if(x==true){
			alert("삭제되었습니다.");
			location.href="manager_mem_delete.do?uid="+id;
		}
	}

	$(function(){
		$('div ul li a').removeClass('active_tab');
		$('div ul li:nth-child(2) a').addClass('active_tab');
	})

    function render_mailchk() {
    var x = document.getElementById("mySelect").value;
    document.getElementById("myselect").value = x;
    }
  </script>
  <style>
  .tab_menu{
	height:923px;
	}
  </style>
  <title>관리자_회원상세정보</title>
</head>
<body>
    <section>
     <!-- 탭메뉴 -->
     <jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>

     <div class="tab_content">
       <form class="" action="manager_mem_update.do" method="get">     
         <p class="first">나의 정보 수정</p>
         <ul class="info">
          <li class="myli">
             <label for="uid">아이디</label>
             <input class="info_input" type="text" id="uid" name="uid" readonly value="${vo.uid }">
           </li>
           <li class="myli">
             <label for="name">이름</label>
             <input class="info_input" type="text" id="name" name="name" value="${vo.name }">
           </li>
           <li class="myli">
             <label for="pw">비밀번호</label>
             <input class="info_input" type="text" id="pw" name="pw" value="${vo.pw }">
           </li>
           <li class="myli">
             <label for="tel">전화번호</label>
             <input class="info_input" type="text" id="tel" name="tel" value="${vo.tel }">
           </li>
           <li class="myli">
             <label for="address">주소</label>
             <input class="info_input" type="text" id="address" name="address" value="${vo.address }">
           </li>
           <li class="myli">
             <label  class="email" for="email">이메일</label>
             <input class="info_input_2" type="text" id="email" name="email" value="${vo.email }">
             @ <input class="info_input_2" type="text" id="myselect" name="email2" value="${email2 }">
             <select class="info_select" id="mySelect"  onchange="render_mailchk();">
               <option value="" selected>직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="nate.com">nate.com</option>
               <option value="daum.net">daum.net</option>
               <option value="gmail.com">gmail.com</option>
               <option value="hanmail.net">hanmail.net</option>
             </select><br>
           </li>
           <li class="myli">
             <label for="penalty">패널티 횟수</label>
             <input class="info_input" type="number" id="penalty" name="penalty" value="${vo.penalty }">
             
           </li>
            <li class="myli">
             <label for="enroll">음식점 등록 상태</label>
             <input class="info_input" type="number" id="enroll" name="enroll" value="${vo.enroll }">
           </li>
         </ul>

         <div class="bt">
           <button type="submit" class="info_bt">수정하기</button>
           <button type="button" class="info_bt" onclick="deletechk('${vo.uid }')">삭제</button>
           <button type="button" class="info_bt" onclick="location.href='manager_memlist.do'">취소</button>
         </div>
       
       </form>
     </div>
   </section>
</body>

</html>