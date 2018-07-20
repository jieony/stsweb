<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation_detail.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script>


    function render_mailchk() {
    var x = document.getElementById("mySelect").value;
    document.getElementById("myselect").value = x;
    }
	
    function deleteOK(code){
    	var delOK = confirm("ㄹㅇ 지움?");
    	if(delOK==true){
    		alert("삭제 됨 ㅇㅇ");
    		location.href="resv_del.do?bo_code="+code;
    	}else if(delOK==false){
    		return;
    	}
    }
    function updateOK(){
    	var upOK = confirm("ㄹㅇ루 수정?");
    	if(upOK==true){
    		alert("수정됨 ㅇㅇ");
    		document.getElementById("updateGo").submit();
    	}else if(upOK == false){
    		return;
    	}
    }


</script>
  <title>예약정보_상세_사용자</title>
</head>
<body>
  <div class="center">
      <jsp:include page="../../../resources/common/nav/nav.jsp"/>


    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span class="">
            <li class="res icon_res" onclick="location.href='resv.do'">
              <p><a href="resv.do">예약하기</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" onclick="location.href='resv_my.do'">
              <p><a href="resv_my.do">나의예약</a></p>
            </li>
          </span>
        </ul>
      </div>

      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">상세 예약정보 수정</p>
        <c:forEach var="list" items="${list }">
        <form action="resv_modify.do" method="post" id="updateGo">
          <div class="info">
            <div class="info_div">
              <label for="id">예약자ID</label>
              <input class="info_input" type="text" id="id" name="id" value="${list.bo_uid }" readonly>
            </div>
            <div class="info_div">
              <label for="name">예약자</label>
              <input class="info_input" type="text" id="name" name="name" value="${list.bo_name }">
            </div>
            <div class="info_div">
              <label for="datepicker">예약일</label>
              <input class="info_input" type="text" id="datepicker" value="${list.bo_date }" readonly/>
            </div>
            <div class="info_div">
              <label for="selectTimeS">예약시간</label>
              <select id="selectTimeS" name="selectTimeS" class="info_select" disabled>
                <option value="${list.bo_time }">${list.bo_time }</option>
              </select>
            </div>
            <div class="info_div">
              <label for="selectTimeC">예약인원</label>
              <select id="selectTimeC" class="info_select" name="selectTimeC" disabled>
                <option value="${list.bo_member }">${list.bo_member }</option>

              </select>
            </div>
            <div class="info_div">
              <label for="phone">핸드폰</label>
              <input class="info_input" type="text" id="phone" name="phone" value="${list.bo_tel }">
            </div>
            <div class="info_div">
              <label for="email">이메일</label>
              <input class="info_input" type="text" id="email" name="f_email">
              @ <input class="info_input_2" type="text" id="myselect" name="e_email">
				
				<!-- email @로 분리 -->
              <script type="text/javascript"> 
              	var strArray = "${list.bo_email}".split('@');
              	document.getElementById("email").value = strArray[0];
              	document.getElementById("myselect").value = strArray[1];
              </script>

              <select class="info_select" id="mySelect" onchange="render_mailchk();">
  				<option value="" selected>직접입력</option>
  		       	<option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
  					</select><br>
           <input type="hidden" name="bo_code" value="${list.bo_code }"/>
            </div>
            
            </c:forEach>
            <p>* 이외 수정사항은 음식점에 전화 문의 바랍니다.</p><br>
            <p>* 예약 취소 2회시 패널티 1회 부여됩니다.</p>

            <button type="submit" class="info_bt" onclick="updateOK();">수정하기</button>
            <button type="button" class="info_bt" onclick="location.href='/resv_my.do'">취소</button>
            <button type="button" class="info_bt" onclick="deleteOK(${bo_code });">예약 취소</button>

          </div>
        </form>
      </div>
    </section>
  </div>
</body>
</html>