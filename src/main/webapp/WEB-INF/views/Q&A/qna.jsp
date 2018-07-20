<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/common/common.css">
<link rel="stylesheet" href="/css/Q&A.css">	
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<title>Q&A</title>
 <script>
 	$(function(){
 		$('div ul li a').removeClass('active');
		$('div ul li:nth-child(4) a').addClass('active');
 	});
 
 	function goPage(pages) {
	 	if(pages == 0){
	 	}else{
	 		location.href = "qna.do?pages=" + pages;	
	 	}
	}
 	
	function backPages(){
		location.href="qna.do?pages="+1;
	}
	
	function qnaLog(login){
		if(login.length == 0){
			var log = confirm("로그인 후 작성가능합니다. 로그인하시겠습니까?");
			if(log == true){
				location.href='/login.do';
			}
		}else if(login.length != 0){
			location.href='/qna_write.do';
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
     margin: 140px auto 0px auto;
   }
</style>
</head>
<body>
<div class="center">
       <section>
      <!-- 탭메뉴 -->
      <div class="p">
      <form action="qnasearch.do" method="get">
        <div class="Q_search">
          <select name="stype">
            <option value="q_title">제목</option>
            <option value="q_id">작성자</option>
          </select>
          <input type="text" name="id" id="id">
          <button type="submit">검색</button>
        </div>
       </form>
	
        <div class="Q_btndiv" >
          <button type="button" class="Q_btn" onclick="qnaLog('${sessionScope.loginUid}')">글작성</button>
        </div>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <table class="Q_table">
          <colgroup>
            <col style="width:10%">
            <col style="width:60%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
          </colgroup>
          <tr>
            <th>No</th>
            <th>SUBJECT</th>
            <th>NAME</th>
            <th>DATE</th>
            <th>VIEW</th>
          </tr>
          <tr class="T_notice">
            <td></td>
            <td class="Q_left" onclick="location.href='qna_manyanswer.do?q_num=${notice.q_num }'">${notice.q_title }</td>
            <td>${notice.q_id }</td>
            <td>${notice.q_date }</td>
            <td>${notice.q_hits }</td>
          </tr>
          		    
		          <c:forEach var="list" items="${lists }" varStatus="num">
		          <c:if test="${list.q_lev==0}">
			          <tr>
			          <td>${list.q_ref }</td>
			            <td class="Q_left" onclick="location.href='qna_detail.do?q_num=${list.q_num }'">${list.q_title }</td>
			            <td>${list.q_id }</td>
			            <td>${list.q_date }</td>
			            <td><c:out value="${list.q_hits }"/></td>
			          </tr>
			      </c:if>
	          	  <c:forEach var="relist" items="${relist }" varStatus="n">
	          		<c:if test="${list.q_num ==relist.q_ref}">
			          <tr>
			          <td></td>
			            <td class="Q_left" onclick="location.href='qna_detail.do?q_num=${relist.q_num }'">${relist.q_title }</td>
			            <td>${relist.q_id }</td>
			            <td>${relist.q_date }</td>
			            <td><c:out value="${relist.q_hits }"/></td>
			          </tr>
	          		 </c:if>    		
	       		 </c:forEach>
		   		</c:forEach>
			<c:if test="${total==0}">
	          	<tr>
	          		<td colspan="5" rowspan="5">조회된결과가없습니다.</td>
	          	</tr>
			</c:if>
        </table>
        <nav>
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo < 6}">  	
					<!-- 5보다 작을 땐 1 페이지로 -->										  
					<li><a href="javascript:backPages();">&lt;</a></li> 
				</c:if>
				<c:if test="${paging.currentPageNo > 5}"> 
					<!-- 5보다 클 땐 이전 앞 5개중 마지막으로 (7에서 5)--> 											  
					<li><a href="javascript:goPage(${paging.prevPageNo})">&lt;</a></li> 
				</c:if>
				<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                    <li><a class="active_P" href="javascript:goPage(${i})">${i}</a></li>
		                </c:when>
	                	<c:otherwise>
	                    	<li><a href="javascript:goPage(${i})">${i}</a></li> 
						</c:otherwise>
					</c:choose>
				</c:forEach>						
				
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
  </div>
</section>
</div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>