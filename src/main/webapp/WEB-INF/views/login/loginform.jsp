<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/loginform.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<script>
function popupFindidpw(){
	   var popURL = "findIdPw.do";
	   var popOption = "width=500px,height=300px,derectories=no,status=no,left=800px,top=400px;";
	   window.open(popURL,"",popOption);
}
function fail(){
	alert("아이디 또는 비밀번호가 틀립니다. 다시 입력해주세요.");
}
function success(){
	alert("로그인 성공!");
	location.href='/';
}

</script>
<style media="screen">
.loginf_content{
  width:600px;
  margin: 60px 0 0 150px;
  height: 400px;
  padding: 60px;
  border: 2px solid #e7e7e7;
}
</style>
<title>예약정보</title>
</head>
<body>
  <div class="center">
    <section>
      <!-- 탭컨텐츠 -->
      <div class="loginf_content">
        <p class="first">로그인</p>
         <form action="loginChk.do" method="get">
          <div class="loginf">
            <div class="loginf_div">
              <label for="id">아이디 &nbsp;&nbsp;</label>
              <input class="loginf_input" type="text" name="uid" id="id" >
            </div>
            <div class="loginf_div">
              <label for="pw">비밀번호</label>
              <input class="loginf_input" type="password" name="pw" id="pw"/>
            </div>
            <c:if test="${result eq 0 }"><script>fail();</script></c:if>
            <c:if test="${result eq 1 }"><script>success();</script></c:if>
            <div class="logindivbtn">
              <button type="submit" class="login_bt">로그인</button>
              <button type="button" class="login_bt" onclick="location.href='/joinform.do'">회원가입</button>
              <button type="button" class="login_bt" onclick="popupFindidpw()">ID/PW 찾기</button>
            </div>
          </div>
          
        </form>
      </div>
    </section>
  </div>
</body>
</html>
