<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/css_theme/theme.css">
<link rel="stylesheet" href="common/common.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
<title>테마맛집</title>
<script>
	$(function(){
	    $('div ul li a').removeClass('active');
	    $('div ul li:nth-child(2) a').addClass('active');
	});
	
	
	$(function(){
		$('.themelist li').removeClass('active_t');
		$('.themelist li a.${theme}').parent().addClass('active_t'); 
 	});
	
 	$(function(){
		var src=$('li.active_t img').attr('src');
		src=src.slice(0,-5)+".png";
		$('li.active_t img').attr('src',src);
	});
 	
	$(function(){
		$('.themelist li a img').not($('li.active_t a img')).mouseover(
				function(){
					var src = $(this).attr('src');
					src=src.slice(0,-5)+".png";
					$(this).attr('src',src);
				}
		);
		$('.themelist li a img').not($('li.active_t a img')).mouseleave(
				function(){
					var src = $(this).attr('src');
					src=src.slice(0,-4)+"_.png";
					$(this).attr('src',src);
				}
		);
	});

	$(document).ready(function(){
      var count=8;
      var score = new Array();
      
      for (var i = 1; i <= count; i++) {
        score[i]= $(".score"+i).html();
        score[i]=  Math.floor(score[i]);
      }

      var img_on='<img src="image_detail/ic_star_on.png">';
      var img_off='<img src="image_detail/ic_star_off.png">';
   
      for (var i = 1; i <= count; i++) {
        for (var j = 1; j <= score[i]; j++)
          $(img_on).appendTo("#stars"+i);
        for(var j=1;j<=5-score[i];j++)
          $(img_off).appendTo("#stars"+i);
     }
    });
  
	function callTheme(theme){
		  location.href="/mtheme.do?theme="+encodeURI(theme);
	}

	function goPage(pages) {
		 location.href = "/mtheme.do?pages="+pages+"&theme="+encodeURI("${theme}")
	 }

	function backPages(){
		  location.href ="mtheme.do?pages="+1+"&theme="+encodeURI("${theme}")
	}
	$(document).ready(function(){
		  if ($(".limit").text().length > 14)
		        $(".limit").html($(".limit").text().substr(0,14)+"...");

	})
	$(document).ready(function(){
		var count = 8;
		var limit = new Array();
		
		for(var i =1; i<=count;i++){
			  limit[i] = $(".limit"+i).html();
			 
		}
		 
			  for (var i = 1; i <= count;i++){
				 
				  if (limit[i].length>14){
				        limit[i]= limit[i].substr(0,14)+"...";
						
				$(".limit"+i).text(limit[i]);
		}
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
     margin: 74px auto 0px auto;
     
   }
</style>
</head>
<body>
    <!-- 내용 -->
    <section>
      <!-- 테마 리스트 -->
     <div class="themelist">
        <ul>
          <li class="active_t">
            <a class="가족모임" onclick="callTheme('가족모임');">
              <img src="image_theme/family_.png" alt="가족모임">
              <p>가족모임</p>
            </a>
          </li>
          <li>
            <a class="연인과함께" onclick="callTheme('연인과함께');">
              <img src="image_theme/couple_.png" alt="연인과함께">
              <p>연인과함께</p>
            </a>
          </li>
          <li>
            <a class="친구와함께" onclick="callTheme('친구와함께');">
              <img src="image_theme/friend_.png" alt="친구와함께">
              <p>친구와함께</p>
            </a>
          </li>
          <li>
            <a class="날씨에따라" onclick="callTheme('날씨에따라');">
              <img src="image_theme/weather_.png" alt="날씨에따라">
              <p>날씨에따라</p>
            </a>
          </li>
          <li>
            <a class="치맥/피맥" onclick="callTheme('치맥/피맥');">
              <img src="image_theme/withbeer_.png" alt="치맥/피맥">
              <p>치맥/피맥</p>
            </a>
          </li>
          <li>
            <a class="달콤후식" onclick="callTheme('달콤후식');">
              <img src="image_theme/dessert_.png" alt="달콤후식">
              <p>달콤후식</p>
            </a>
          </li>
          <li>
            <a class="건강식" onclick="callTheme('건강식');">
              <img src="image_theme/fresh_.png" alt="건강식">
              <p>건강식</p>
            </a>
          </li>
          <li>
            <a class="tv맛집" onclick="callTheme('tv맛집');">
              <img src="image_theme/tv_.png" alt="tv맛집">
              <p>tv맛집</p>
            </a>
          </li>
          <li>
            <a class="돼지고기" href="#" onclick="callTheme('돼지고기');">
              <img src="image_theme/pork_.png" alt="돼지고기">
              <p>돼지고기</p>
            </a>
          </li>
          <li>
            <a class="소고기" onclick="callTheme('소고기');">
              <img src="image_theme/beef_.png" alt="소고기">
              <p>소고기</p>
            </a>
          </li>
          <li>
            <a class="닭" onclick="callTheme('닭');">
              <img src="image_theme/chicken_.png" alt="닭">
              <p>닭</p>
            </a>
          </li>
          <li>
            <a class="해산물" onclick="callTheme('해산물');">
              <img src="image_theme/fish_.png" alt="해산물">
              <p>해산물</p>
            </a>
          </li>
          <li>
            <a class="면요리" onclick="callTheme('면요리');">
              <img src="image_theme/noodle_.png" alt="면요리">
              <p>면요리</p>
            </a>
          </li>
          <li>
            <a class="분식/즉석" onclick="callTheme('분식/즉석');">
              <img src="image_theme/fastfood_.png" alt="분식/즉석">
              <p>분식/즉석</p>
            </a>
          </li>
          <li>
            <a class="무한뷔페" onclick="callTheme('무한뷔페');">
              <img src="image_theme/buffet_.png" alt="무한뷔페">
              <p>무한뷔페</p>
            </a>
          </li>
          <li>
            <a class="무한리필" onclick="callTheme('무한리필');">
              <img src="image_theme/infinite_.png" alt="무한리필">
              <p>무한리필</p>
            </a>
          </li>
        </ul>
      </div>
      <!-- 테마리스트 -->
      <!-- 음식점 리스트 -->
      <div class="reslist">
      <span style="margin-left:15px;padding-bottom:8px;border-bottom: 2px solid #a70101;">테마명 > ${theme }</span>
      <c:set value="0" var="co"/>
        <ul style="margin-top:20px;">  
         <c:forEach var="list" items="${lists}" varStatus="status">
          <li>
            <a href="/detail.do?res_code=${list.res_code }"><img class="foodimg" src="resImg/${list.res_code }/${piclist[co*1] }" alt="음식"></a>
            <div class="one"><!-- 음식점 정보 -->
              <a href="/detail.do?res_code=${list.res_code }" style="color:#000000;">${list.res_name }</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
               <p class ="limit${status.count }">${list.res_addr }</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>${list.res_tel}</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p>
              <span id="stars${status.count }"></span>
              <span class="score${status.count }">${list.score }</span>
              </p>
           	  <c:forEach var="z" begin="0" end="1">
	      		<c:if test="${z ne 1}">
	      			<c:set var="co" value="${co+1}"/>
	        	</c:if>
     		  </c:forEach>
      		</div><!-- //음식점 정보 -->
          </li>
         </c:forEach>
        </ul>              
      </div><!-- //음식점 리스트-->
       <!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div>
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 8}">  											
					<li><a href="javascript:backPages();"><</a></li>
				</c:if>
				<c:if test="${paging.currentPageNo gt 7}">  
					<li><a href="javascript:goPage(${paging.prevPageNo})">&lt;</a></li>
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
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
				
				<c:if test="${currentPage < finalPage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:goPage(${paging.nextPageNo})">&gt;</a></li>
				</c:if>
			</ul>
		</div>
		</c:when>
	   </c:choose>
	</section>      
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>