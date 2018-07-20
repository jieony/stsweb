<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../../common/common.css">
<link rel="stylesheet" href="../../css/css_mypage/mypage_manager.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>  
  <title>관리자_회원목록</title>
  <script>
  $(function(){
		$('div ul li a').removeClass('active_tab');
		$('div ul li:nth-child(2) a').addClass('active_tab');
  })
  	function goPage(pages) {
		location.href = "manager_memlist.do?pages=" + pages
  }
 
  function backPages(){
	  location.href ="manager_memlist.do?pages=" + 1
  }
	
  </script>
</head>
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
     margin: -56px auto 0px auto;
   }
</style>
<body>
    <section>
    <!-- 탭메뉴 -->
    <jsp:include page="../../../resources/common/nav/nav_manager.jsp"></jsp:include>
      <div class="ask_list">
        <div class="tab_content">
        <p class="first">회원 목록</p>
        <table class="reserv_list">
    	  <colgroup>
          <col style="width:20%;">
          <col style="width:20%;">
          <col style="width:25%;">
          <col style="width:25%;">
          <col style="width:10%;">
          </colgroup>
           <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>패널티</th>
            <th>맛집보유</th>
            <th>상세</th>
           </tr>
           <c:forEach var="list" items="${list }" varStatus="num">
               <tr>
	            <td>${list.uid }</td>
	            <td>${list.name }</td>
	            <td>${list.penalty }</td>
	            <td>${list.enroll }</td>
	            <td><a href="manager_mem_detail.do?uid=${list.uid }">보기</a></td>
	           </tr>
           </c:forEach>
          </table>
                             <!-- 페이징  -->
      <nav>
				<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											
					<li><a href="javascript:backPages();">&lt;</a></li>
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  											
					<li><a href="javascript:goPage(${paging.prevPageNo})">&lt;</a></li>
				</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li><a class="active" href="javascript:goPage(${i})">${i}</a></li>
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i})">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage < finalPage}">
					<li><a href="javascript:goPage(${paging.nextPageNo})">></a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
	   </c:choose>
	  </nav>
        </div> <!-- //tab_content  -->
      </div> <!-- //ask_list  -->
    </section>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>
