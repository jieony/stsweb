<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation_info.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script>


    function render_mailchk() {
    var x = document.getElementById("mySelect").value;
    document.getElementById("myselect").value = x;
    }
    
    function bookingOK(){
    	var name = document.getElementById("name").value;
    	var datepicker = document.getElementById("datepicker").value;
    	var selectTimeS = document.getElementById("selectTimeS").value;
    	var selectTimeC = document.getElementById("selectTimeC").value;
    	var phone = document.getElementById("phone").value;
    	var email = document.getElementById("email").value;
    	var mySelect = document.getElementById("mySelect").value;
    	
    	var lozic = name!="" && datepicker!="" && selectTimeS !="" && selectTimeC !="" && phone!="" && email!="" &&mySelect!="";
   
    	var resOK = confirm("ㄹㅇ루예약?");
    	if(resOK==true){
    		if(lozic){
    			alert("예약됨 ㅇㅇ");
    			document.getElementById("boooking").submit();
    		}else{
    			alert("입력 똑바로하셈 ㅇㅅㅇ");
    			return;
    		}

    	}else if(resOK == false){
    		alert("ㅋㅋ");
    		return;
    	}
    }

   $(function() {
     $("#datepicker").datepicker({
     dateFormat: 'yymmdd',
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
      changeMonth: true, //월변경가능
        changeYear: true, //년변경가능
      showMonthAfterYear: true, //년 뒤에 월 표시
      minDate:0
     });
  });

  $(function() {
      var Html = [];
      var values="";
      for (var i = 10; i < 22; i++) {
        for(var j = 0; j < 60; j=j+10){
          if(j==0){
            value=i+"시 0"+j+"분";
          }else {
            value=i+"시 "+j+"분";
          }
          Html[i]="<option value="+value+">"+value+"</option>";
          $("#selectTimeS").append(Html.join(""));
          Html = [];
        }
      }
  });

  $(function() {
      var Html = [];
      var values="";
      for (var i = 1; i < 21; i++) {
          value=i
          Html[i]="<option value="+value+">"+value+"</option>";

      }
      $("#selectTimeC").append(Html.join(""));
  });
</script>
  <title>예약정보</title>
</head>
<body>
  <div class="center">
  <jsp:include page="../../../resources/common/nav/nav.jsp"/>
    

    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span class="active_tab">
            <li class="res icon_res" onclick="location.href='resv.do'">
              <p><a href="resv.do">예약하기</a></p>
            </li>
          </span>
          <span class="">
            <li class="res icon_my" onclick="location.href='resv_my.do'">
              <p><a href="resv_my.do">나의예약</a></p>
            </li>
          </span>
        </ul>
      </div>

      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">예약정보작성</p>
         <c:forEach var="res" items="${res}">
        <form action="resv_book.do" method="get" id="boooking">
          <div class="info">
            <div class="info_div">
           	 <!-- 라벨 네글자로 바꿀거면 라벨 넓이 지정하고하셈ㅋ -->
              <label for="name_res">음식점</label>
              <input class="info_input" type="text" id="name_res" name="res_name" value="${res.res_name }" readonly>
            </div>
            <div class="info_div">
              <label for="id">예약자</label>
              <input class="info_input" type="text" id="name" value="" name="bo_name">
            </div>
            <div class="info_div">
              <label for="datepicker">예약일</label>
              <input class="info_input" type="text" id="datepicker" name="bo_date" value=""/>
            </div>
            <div class="info_div">
              <label for="selectTimeS">예약시간</label>
              <select id="selectTimeS" class="info_select" name="bo_time" value="">
              </select>
            </div>
            <div class="info_div">
              <label for="selectTimeC">예약인원</label>
              <select id="selectTimeC" class="info_select" name="bo_human" value="">
              </select>
            </div>
            <div class="info_div">
              <label for="phone">핸드폰</label>
              <input class="info_input" type="text" id="phone" name="bo_tel" value="">
            </div>
            <div class="info_div">
              <label for="email">이메일</label>
              <input class="info_input" type="text" id="email" name="bo_email" value="">
              @ 
              <input class="info_input_2" type="text" id="myselect">

              <select class="info_select" id="mySelect" name="myselect" onchange="render_mailchk();">
  						  <option value="">직접입력</option>
  		       	  <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
  				  	</select><br>
            </div>
            <input type="hidden" name="res_code" value="${res.res_code }"/>
            </c:forEach>
            <p>* 최소 1시간 전에 예약하셔야 예약이 접수됩니다.</p>
            <p>* 잘못된 정보로 예약 시 이용에 제한이 생길수 있습니다.</p>

            <button type="button" class="info_bt" onclick="bookingOK();">예약</button>
            <button type="button" class="info_bt" onclick="location.href='/resv.do'">취소</button>
            <button type="reset" class="info_bt">다시작성하기</button>

          </div>
        </form>
      </div>
    </section>
  </div>
</body>
</html>