<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_reservation/reservation_shop_detail.css">
  <title>예약정보_상세_사용자</title>
  <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
  <script>
  	function cancel(){
  		alert("취소하였습니다.");
  		location.href="mypage_reservation_shop.do?res_code="+${detail.res_code};
  	}
  	
  	function Update(){
  		var ok=confirm("수정을 완료하시겠습니까?");
  		if(ok==true){
  			alert("수정되었습니다.");
  			
  		}else{
  			alert("수정을 취소하였습니다");
  			return false;
  		}
  	}
  	
  	
  
  </script>
  <style>
footer{
     border-top: 1px solid #e0e0e0;
     min-width: 1000px;
     line-height: 25px;
     padding: 35px 0;
     text-align: center;
     position: relative;
     bottom: 0;
     font-size: 12px;
     color: #808080;
     margin: 227px auto 0px auto;
   }
</style>
</head>
<body>
<div class="center">
    <section>
      <!-- 탭메뉴 -->
      <div class="tab_menu">
        <ul>
          <span>
            <li class="res icon_res" >
              <p><a href="mypage_user_info.do">나의정보</a></p>
            </li>
          </span>
          <span class="">
            <li class="res icon_my" >
              <p><a href="mypage_user_myres_path.do">나의음식점</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="mypage_reservation_shop2.do?res_code=${detail.res_code }">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div>

      <!-- 탭컨텐츠 -->
    
      <div class="tab_content">
        <p class="first">상세 예약정보 수정</p>
        <form action="reservation_shop_detail2.do" method="get" onsubmit="return Update();" name="update">
          <input class="info_input" type="hidden" id="res_code" name="res_code" value="${detail.res_code}" readonly>
          <div class="info">
            <div class="info_div">
              <label for="r_code">예약코드</label>
              <input class="info_input" type="number" id="bo_code" name="bo_code" value="${detail.bo_code }" readonly>
            </div>
            <div class="info_div">
              <label for="name">예약자</label>
              <input class="info_input" type="text" id="bo_name" name="bo_name" value="${detail.bo_name }" readonly>
            </div>
            <div class="info_div">
              <label for="datepicker">예약일</label>
              <input class="info_input" type="text" id="bo_date" name="bo_date" value="${detail.bo_date }" readonly/>
            </div>
            <div class="info_div">
              <label for="bo_time">예약시간</label>
              <select id="bo_time" class="info_select" name="bo_time" disabled>
                <option value="${detail.bo_time }">10시 30분</option>
              </select>
            </div>
            <div class="info_div">
              <label for="bo_member">예약인원</label>
              <select id="bo_member" class="info_select" name="bo_member" disabled>
                <option value="${detial.bo_member }" selected>4명</option>
              </select>
            </div>
            <div class="info_div">
              <label for="bo_tel">핸드폰</label>
              <input class="info_input" type="text" id="bo_tel" name="bo_tel" value="${detail.bo_tel }" readonly>
            </div>
            <div class="info_div">
              <label for="email">이메일</label>
              <input class="info_input" type="email" id="bo_email"  name="bo_email" value="${detail.bo_email }" readonly>
              @ <input class="info_input_2" type="email" id="email2" name="email2" value="${email2 }" readonly>


            </div>

            <div class="info_div">
              <label for="bo_conf">처리결과</label>
          <c:choose> 
              <c:when test="${detail.bo_conf eq '처리완료' }">
              	<select class="info_select" name="bo_conf" id="bo_conf2" disabled="disabled">
                <option value="${detail.bo_conf }" selected>${detail.bo_conf }</option>                             
              </select>
            </c:when>
            <c:when test="${detail.bo_conf ne '처리완료' }">             
              <select class="info_select" name="bo_conf" id="bo_conf2">
                <option value="${detail.bo_conf }" selected>${detail.bo_conf }</option>               
                 <option value="방문">방문</option>
                <option value="미방문" >미방문</option>               
              </select>
            </c:when>
          </c:choose>
             
              
            </div>
            <p>* 이외 수정사항은 음식점에 전화 문의 바랍니다.</p><br>
            <p>* 예약 취소 2회시 패널티 1회 부여됩니다.</p>

            <button type="submit" class="info_bt">수정하기</button>
            <button type="button" class="info_bt" onclick="cancel();">취소</button>

          </div>
        </form>
      </div>
    
    </section>
  </div>
</body>

	<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>

</html>