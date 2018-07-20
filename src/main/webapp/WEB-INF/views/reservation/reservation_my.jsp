<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>나의예약</title>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_reservation/reservation_my.css">
<script type="text/javascript">
  function goPage(pages) {
		var pages;
		if(pages ==0){
			
		}else{	
		location.href = "resv_my.do?" + "pages=" + pages;
		}
	}
  function goPage2(pages) {
		location.href = "resv_my.do?" + "pages=" + 1;
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
     margin: 63px auto 0px auto;
   }
  </style>
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
      </div> <!-- //탭메뉴  -->

      <div class="tab_content">
        <div class="searchlist">
          <p class="first">나의 예약 내역</p>
          <table class="reserv_list"  >
            <colgroup>
              <col style="width:10%;">
              <col style="width:20%;">
              <col style="width:20%;">
              <col style="width:10%;">
              <col style="width:10%;">
              <col style="width:10%;">
            </colgroup>
            <tr>
              <th>예약번호</th>
              <th>상호</th>
              <th>예약일/시간</th>
              <th>인원</th>
              <th>처리결과</th>
              <th>상세</th>
            </tr>
            <c:forEach var="list" items="${lists }">
            
	            <tr>
	              <td><p>${list.bo_code }</p></td>
	              <td>
	              <c:forEach var="res" items="${res }" >
	              <a href="/detail.do?res_code=${res.res_code }">
              		<c:if test="${list.res_code == res.res_code }">${res.res_name }
              		</c:if>
              		</a>
	              </c:forEach>
	              	</td>
	              <td>
	                <p>${list.bo_date }</p>
	                <p>${list.bo_time }</p>
	              </td>
	              <td><p>${list.bo_member }</p></td>
	              <c:choose>
	              	<c:when test="${list.bo_conf=='처리완료' }">
	              		<td><p>미방문</p></td>
	              	</c:when>
	              	<c:otherwise>
	              		<td><p>방문</p></td>
	              	</c:otherwise>
	              </c:choose>
	              <td><a href="resv_detail.do?bo_code=${list.bo_code }">보기</a></td>
	            </tr>
            </c:forEach>
          </table>
        </div> <!-- //searchlist  -->
        
        <!-- paging -->
        <c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											  <!-- 현재 페이지가 6보다 작다면(즉, 6페이지 이하이라면) -->
					<li><a href="javascript:goPage2();">&lt;</a></li> <!-- 처음페이지 표시 -->
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  											  
					<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li>
				</c:if>
				
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li>
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
										
				<!-- 소수점 제거 -->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage <= finalPage}">
					<li><a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">&gt;</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>  
      </div>
    </section>

  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>