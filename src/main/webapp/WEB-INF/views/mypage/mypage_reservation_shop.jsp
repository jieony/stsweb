<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_mypage/mypage_reservation_shop.css">
  <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
  
  <script>

  function goPage(pages) {
	
		location.href = "mypage_reservation_shop2.do?" + "pages=" + pages+"&res_code="+"${res_code}";
		
  }
/*   $(function(){
	    $('nav li a').click(function(){
	      $('nav li a').removeClass('active');
	      $(this).addClass('active');
	    });
  }); */
 
  function goPage2(){
	  alert("처음입니다.");
	  location.href ="mypage_reservation_shop2.do?" +"pages=" + 1+"&res_code="+${res_code};
  }
  

  $(function(){
 		if(res_code==0){
 			alert("새로운 음식점을 등록 한 후 사용 가능합니다.");
 	 		location.href="mypage_user_info.do";
 		
 		}else{
 			location.href="mypage_reservation_shop.do?res_code="+${res_code};
 		}
 		
 }); 

  
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
              <p><a href="mypage_user_myres_path.do?res_code=${res_code }">나의음식점</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="#">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div><!--//탭메뉴 -->


      <div class="tab_content">
        <div class="searchlist">
          <p class="first">(음식점) 예약 내역</p>
          <table class="reserv_list"  >
            <colgroup>
              <col style="width:10%;">
              <col style="width:15%;">
              <col style="width:20%;">
              <col style="width:10%;">
              <col style="width:10%;">
              <col style="width:15%;">
            </colgroup>
            <tr>
              <th>예약번호</th>
              <th>예약자</th>
              <th>예약일/시간</th>
              <th>인원</th>
              <th>처리결과</th>
              <th>보기</th>
            </tr>
       	<c:forEach var="lists" items="${lists }">
            <tr>
              <td><p>${lists.bo_code }</p></td>
              <td>${lists.bo_name }</td>
              <td>
                <p>${lists.bo_date }</p>
                <p>${lists.bo_time }</p>
              </td>
              <td><p>${lists.bo_member }</p></td>
              <td><p>${lists.bo_conf }</p></td>
              
              <td><a href="reservation_shop_detail.do?bo_code=${lists.bo_code}">자세히보기</a></td>
            </tr>
        </c:forEach>		 
          </table>
        </div> <!-- //searchlist  -->
        <!-- 페이징  -->
      <nav>
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											  <!-- 현재 페이지가 6보다 작다면(즉, 6페이지 이하이라면) -->
					<li><a href="javascript:goPage2();">&lt;</a></li> <!-- 처음페이지 표시 -->
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  											  <!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
					<li><a href="javascript:goPage(${paging.prevPageNo})">&lt;</a></li> <!-- 이전페이지 표시 -->
				</c:if>
				<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> <!-- 변수선언 (var="i"), 조건식, 증감식 -->
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li><a class="active" href="javascript:goPage(${i})">${i}</a></li> <!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i})">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 파란색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
				<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
										
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage < finalPage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:goPage(${paging.nextPageNo})">&gt;</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
	   </c:choose>
	  </nav>         	
      </div>      
    </section>
			
  </div>
 
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>