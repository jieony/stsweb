<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/mainpage.css">
<jsp:include page="../../resources/common/nav/nav.jsp"></jsp:include>
<title>메인페이지</title>
<script>

	$(function(){
	    $('div ul li a').removeClass('active');
	    $('div ul li:nth-child(1) a').addClass('active');
	});

	$(function() {
		var num=${map_num};
		if(num>=100 && num<=118){
			 area="south";
	    }
		else if(num>=119 && num<=142){
			 area="north";
		}
		else{
			 area="north";
		}
		
		$("#map").empty();
	
		var area;
    	var south = new Array('가로수길','강남역','관악/신림','구로','노량진','목동/강서','반포/서래마을','방배/사당','서초/교대', 
			'신논현/영동시장','신사/잠원','압구정/청담','양재/도곡','선릉/삼성/대치','역삼','영등포/여의도','잠실/신천','천호/강동');
   		var north = new Array('서대문','응암/새절',
			'광진/건대입구','광화문/시청','노원/도봉/미아','대학','동대문','부암동/평창동','마포','상암','서촌/경복궁','성동/성수','성북', 
			'숙대/서울역','신촌/이대','안암/고대','연남동/연희동','연신내/불광','이촌동/용산','이태원/한남동','종로/인사','충무로/신당','홍대/상수/합정','회기');
     	var Html = [];
     
		if(area=='south'){
				$('.map_gb').removeClass(' on');
		    	$('.map_gn').addClass(' on');
		    	$('#box_gb').css('display','none');
		        $('#box_gn').css('display','');
			for (var i = 100; i < 118; i++) {
			 Html[i]="<li><a class=location href=main.do?map_num="+i+">"+south[i-100]+"</a></li>";
		    $("#map").append(Html.join(""));
		    Html = [];
			}
		}
		else{
			for (var j = 118; j < 142; j++) {
		      Html[j]="<li><a class=location href=main.do?map_num="+j+">"+north[j-118]+"</a></li>";
		      $("#map").append(Html.join(""));
		         Html = [];
		    }

		}
	});
	
	
	
 
	function fn_list_chgImg(chgimg,loc){
	    document.getElementById(loc).src = chgimg;
	}
  
	function goPage(pages) {
		location.href = "main.do?" + "pages=" + pages+"&map_num="+${map_num};
	}
	
	function backPages(){
		location.href ="main.do?pages="+1+"&map_num="+${map_num};
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
     margin: 74px auto 0px auto;
   }
</style>
</head>
<body>
  <section>
    <div  class="container" id="left-nav">
      <!-- 좌측 지역 nav -->
      <div class="seoul">
        <button id="bu1" class="map_gb on" onclick="area('north',${map_num})">
        </button>
        <button id="bu2" class="map_gn " onclick="area('south',${map_num})" >
        </button>
      </div>
      <div class="red_container">
          <div class="inner-container" id="box_gb">
            <div class="boxing">
            <span>강북</span></div>지역 맛집찾기
          </div>
          
          <div class="inner-container" id="box_gn" style="display:none;">
            <div class="boxing">
            <span>강남</span></div>지역 맛집찾기
          </div>

          <div class="z">
            찾고자 하는 상세 지역명을 클릭해주세요
          </div>
      </div>
      <div class="location-select">
          <table id="map"></table>
      </div>
    </div>
    <!-- 좌측 nav end -->
    <script>
    // 스크롤 따라가기
     var nav = $('.container');
     $(window).scroll(function () {
         if ($(this).scrollTop() > 180) {
             nav.addClass("f-nav");
         } else {
             nav.removeClass("f-nav");
         }
     });
  
  	var c1=document.getElementById("bu1").value;
  	var c2=document.getElementById("bu2").value;
  
    	 $('.map_gn').click(function(){
        $('.map_gb').removeClass(' on');
        $('.map_gn').addClass(' on');
        $('#box_gb').css('display','none');
        $('#box_gn').css('display','');
        
    	 });
        
      	 $('.map_gb').click(function(){
        $('.map_gn').removeClass(' on');
        $('.map_gb').addClass(' on'); 
        
        $('#box_gb').css('display','');
        $('#box_gn').css('display','none');
     }); 
      	 
      	function area(area,num){
      		$("#map").empty();
      		
      		
      		 var south = new Array('가로수길','강남역','관악/신림','구로','노량진','목동/강서','반포/서래마을','방배/사당','서초/교대', 
      					'신논현/영동시장','신사/잠원','압구정/청담','양재/도곡','선릉/삼성/대치','역삼','영등포/여의도','잠실/신천','천호/강동');
      		 var north = new Array('서대문','응암/새절',
      					'광진/건대입구','광화문/시청','노원/도봉/미아','대학','동대문','부암동/평창동','마포','상암','서촌/경복궁','성동/성수','성북', 
      					'숙대/서울역','신촌/이대','안암/고대','연남동/연희동','연신내/불광','이촌동/용산','이태원/한남동','종로/인사','충무로/신당','홍대/상수/합정','회기');
      		     var Html = [];
      		     

      			if(area=='south'){
      				for (var i = 100; i < 118; i++) {
      					 Html[i]="<li><a class=location href=main.do?map_num="+i+">"+south[i-100]+"</a></li>";
      			    $("#map").append(Html.join(""));
      			    Html = [];
      				}
      			}
      			else{
      			 	for (var j = 118; j < 142; j++) {
      				      Html[j]="<li><a class=location href=main.do?map_num="+j+">"+north[j-118]+"</a></li>";
      			     $("#map").append(Html.join(""));
      			         Html = [];
      			 	 }
      			}
      			
      		}
    </script>
    <!-- 우측 nav start -->
   <div class="container2" id="detail-cont">
    <table>
    <c:set value="0" var="co"/>
    <c:forEach var="list" items="${list}" varStatus="status">
      <tr>
        <td width="400px">
          <img class="sp" src="image_main/number/one.png" alt="${list.res_code }">
          ${list.res_name } |
          <img class="sp" src="image_main/icon/hansik.gif">
        </td>
      </tr>
      <tr>
        <td>
          <div class="zoom">
             <img id="zoomimg_${co+1}" src="resImg/${list.res_code }/${piclist[co*3] }" width="200" height="200" alt="" style="overflow: hidden;border-radius:3px;">
          </div>
          <ul class="zoomimg_list">          
            <div class="box1">
           	 <c:forEach var="box1" varStatus="j" begin="1" end="3" step="1">
	              <li>
	                <a href="javascript:;" onmouseover="fn_list_chgImg('resImg/${list.res_code }/${piclist[(j.index-1)+(co*3)]}', 'zoomimg_${co+1}')">
	                <img src="resImg/${list.res_code }/${piclist[(j.index-1)+(co*3)]}" width="60" height="60" style="border-radius:3px;" alt="1"></a> 
	              </li>
	        </c:forEach>
            </div>         
            <div class="box2">
            <c:forEach var="box2" varStatus="j" begin="4" end="6" step="1">
            	<li>
                	<a href="javascript:;" onmouseover="fn_list_chgImg('resImg/${list.res_code }/${piclist[(j.index-1)+(co*3)]}', 'zoomimg_${co+1}')">
                	<img src="resImg/${list.res_code }/${piclist[(j.index-1)+(co*3)]}" width="60" height="60" style="border-radius:3px;" alt="2"></a>
            	</li>
            </c:forEach>
            </div>
         </ul>
        </td>
        <td>
          <p><strong>${list.res_addr }</strong></p>
          <hr>
          <p>${list.contents }</p>
          <hr>
          <a href="/detail.do?res_code=${list.res_code }" class="detail_btn">상세정보</a>
        </td>
      </tr>
     <c:forEach var="z" begin="0" end="2">
      	<c:if test="${z ne 1}">
      		<c:set var="co" value="${co+1}"/>
      	</c:if>
      </c:forEach> 
 	</c:forEach> 
    </table>
  </div>

		<!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div>
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											  
					<li><a href="javascript:backPages();"><</a></li>
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  											 
					<li><a href="javascript:goPage(${paging.prevPageNo})"><</a></li> 
				</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i})">${i}</a></li> 
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
	  </section>
</body>
<jsp:include page="../../resources/common/footer/footer.jsp"></jsp:include>
</html>
