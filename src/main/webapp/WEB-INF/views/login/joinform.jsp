<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="../../css/joinform.css">
<link rel="stylesheet" href="../../common/common.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function total_check(frm) {
	var pw=document.getElementById("pw").value;
	var pw2=document.getElementById("pw2").value;
	  if(!document.getElementById("id").value) {
	    alert("아이디를 입력해주세요.");
	    return false;
	  }
	  if(!document.getElementById("pw").value) {
		    alert("비밀번호를 입력해주세요.");
		    return false;
	  }if(!document.getElementById("pw2").value) {
		    alert("비밀번호를 다시한번 입력해주세요.");
		    return false;
	  }if(pw!=pw2){
		  alert("비밀번호가 일치하지 않습니다.");		
		 	return false;
	  }if(!document.getElementById("name").value) {
		    alert("이름를 입력해주세요.");
		    return false;
	  }
	  if(!document.getElementById("birthday").value) {
		    alert("생년월일을 입력해주세요.");
		    return false;
	  }
	  var email = document.getElementById("email").value;
	  var arrUrl=[".co.kr",".com",".net",".or.kr",".go.kr"];
	  var check1=false;
	  var check2=false;
	  
	  if(!email) {
		    alert("이메일을 입력해주세요.");
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
	  
	  if(!document.getElementById("tel").value) {
		    alert("휴대폰 번호를 입력해주세요.");
		    return false;
	  }
	
	  if(confirm("회원 등록하시겠습니까?")) {
		  alert("회원등록이 완료되었습니다.")
		  return true;
	  }
	  else 
		  return false;
	}

	var jenderid;
    function checkGen(jenderid){
      if(jenderid=="manlb"){
        document.getElementById("manlb").className="on";
        document.getElementById("womanlb").className=" ";
        document.getElementById(jenderid).checked=true;
      }
      if(jenderid=="womanlb"){
        document.getElementById("womanlb").className="on";
        document.getElementById("manlb").className=" ";
        document.getElementById(jenderid).checked=true;
      }

    }
    
	function checkId(){
		var id = document.getElementById("id").value;
		if(id.length==0){
			alert("아이디를 입력해주세요.");
		}else{
			location.href="checkId.do?id="+id;
		}
	
	}
	
	/* 주소검색 */
  function execDaumPostcode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }

	
</script>
<style>
div.join_form{
	height:855px;
}
</style>
</head>
<body>
  <section>
      <div class="join_content">
        <h2>간편 회원가입</h2>
        <form  action="join.do" method="get" onsubmit="return total_check(this);">
          <div class="join_form">
              <!--아이디-->
              <div class="join_row">
                <span class="ps_box">
                  <input id="id" class="allinput" type="text" name="uid" value="${id }" maxlength="20" autocomplete="off" placeholder="아이디를 입력해주세요.">
                  <c:if test="${result ne 0 && result ne 1 }">
                  <a class="idcka" href="#" onclick="checkId()">중복체크</a></c:if>
             	  <c:if test="${result eq 1 }">
                  <a class="idcka" href="#" onclick="checkId()">사용불가</a></c:if>
                  <c:if test="${result eq 0 }">
                  <a class="idcka" href="#" onclick="checkId()">사용가능</a></c:if>
                </span>
              </div>
              <!--비밀번호-->
              <div class="join_row">
                <span class="ps_box">
                  <input class="allinput" id="pw" type="password" name="pw" maxlength="30" autocomplete="off" placeholder="비밀번호를 입력해주세요.">
                </span>
              </div>
              <div class="join_row">
                <span class="ps_box">
                  <input class="allinput" id="pw2" type="password" name="pw2" maxlength="30" autocomplete="off" placeholder="다시 한번 입력해주세요.">                                              
                </span>                 			
              </div>
              <!-- <a class="pwcka"  href="javascript:confirm();">확인</a> -->
              
              <!--이름-->
              <div class="join_row">
                <span class="ps_box">
                  <input class="allinput" type="text" id="name" name="name" maxlength="30" autocomplete="off" placeholder="이름을 입력해주세요.">
                </span>
              </div>
              <!--성별-->
              <div id="genderdiv" class="join_row_gender">
                <span class="gender">
                  <span class="jender">
                    <input type="radio" id="man" name="gender" value="남자" onclick="checkGen('manlb')">
                    <label id="manlb" for="man" class=" ">남자</label>
                  </span>
                  <span class="jender">
                    <input type="radio" id="woman" name="gender" value="여자" onclick="checkGen('womanlb')">
                    <label id="womanlb" for="woman" class=" ">여자</label>
                  </span>
                </span>
              </div>
              <!--생년월일-->
              <div class="birdiv">
                <span>
                  <input class="allinput" type="text" id="birthday" name="birthday" maxlength="6" placeholder="생년월일(6자리)">
                </span>
              </div>
              <!--이메일-->
              <div  class="join_row">
                <span class="ps_box_email">
                  <input class="allinput" type="text" id="email" name="email" maxlength="50" value="" placeholder="이메일을 입력해주세요.">
                </span>
              </div>
              <!--전화번호-->
              <div class="join_row">
                <span>
                  <input class="allinput" type="text" name="tel" id="tel" maxlength="11" placeholder="핸드폰번호(-없이입력해주세요 )">
                </span>
              </div>
               <div class="join_row">
                <span>
					<input class="allinput" type="text" name="postcode" id="sample6_postcode" placeholder="우편번호"style="width:286px">
					<input class="allinput" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="color:#ffffff;width:109px;">
					<input class="allinput" type="text" name="address" id="sample6_address" placeholder="주소">
					<input class="allinput" type="text" name="address2" id="sample6_address2" placeholder="상세주소">
               
                </span>
              </div>
          </div>
          <span class="btn_join">
            <input type="submit" id="btnSubmit" value="회원가입" alt="회원가입" class="joinbtn" style="text-align:center; font-weight:bold;">
          </span>
        </form>
      </div>
  </section>
</body>
</html>
