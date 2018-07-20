<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>음식점상세정보</title>
<link rel="stylesheet" href="css/detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	#map {position:relative; left:110px; bottom:45px;height: 200px;width : 330px;}
</style>
  <script>
  $(document).ready(function(){
      var count=5;
      var score = new Array();

      for (var i = 1; i <= count; i++) {
        score[i]= $("#score"+i).html();
        score[i]=  Math.floor(score[i]);
      }

      
      var img_on='<img src="../image_detail/ic_star_on.png">';
      var img_off='<img src="../image_detail/ic_star_off.png">';

      for (var i = 1; i <= count; i++) {
        for (var j = 1; j <= score[i]; j++)
          $(img_on).appendTo(".star"+i);
	    for(var j=1;j<=5-score[i];j++)
	      $(img_off).appendTo(".star"+i);
     }
      
      var resScore = $(".total").text();
      if($(".count").text().slice(0,1)==0){
      	resScore = 0;  //참여한 사람이 0명이면 점수도 0
      }
      for(var i=1;i<=resScore;i++)
    	  $(img_on).appendTo(".star");
      if(resScore!=5){
    	  for(var j=0;j<5-resScore;j++)
    	   $(img_off).appendTo(".star");
      }
      resScore = Math.floor(resScore * 10)/10;
      
      $(".total").text(resScore);
    });

  
    $(function(){
  	  var uluru = {lat: ${vo.lng }, lng: ${vo.lat }};
  	  var map = new google.maps.Map(
  	      document.getElementById('map'), {zoom: 17, center: uluru});
  	  var marker = new google.maps.Marker({position: uluru, map: map});
  	});
  
  $(function(){
    $('nav li a').click(function(){
      $('nav li a').removeClass('active');
      $(this).addClass('active');

      var idVal=$(this).attr('href');
     
      $('html,body').animate({
        scrollTop:$(idVal).offset().top
      },1000);
    });

      //위로가기 버튼
      //스크롤이벤트(스크롤의 위치에 따라 위로가기버튼 활성화체크)
    $(window).scroll(function(){//브라우저에 스크롤을 움직이면 실행됨
      //스크롤의 위치 구하기
      var windowTop=$(window).scrollTop();//스크롤의 현재위치
      // console.log(windowTop);  //콘솔에 뿌려보자
      if(windowTop>100){
        $('#goTop').addClass('on');
      }else{
        $('#goTop').removeClass('on');
      }
    });

    //위로가기 버튼 누르면 스크롤을 위쪽으로 이동

    $('#goTop').click(function(){
      $('html,body').animate({
        scrollTop:0
      },1000);
    });

  });


   /* 메뉴판  */
    function openCity(evt, cityName,cate) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }


  /* 슬라이드 script */

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("demo");
      var captionText = document.getElementById("caption");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " active";
      captionText.innerHTML = dots[slideIndex-1].alt;
    }
   
    function reDelete(num,code){
    	if(confirm("정말 삭제 하시겠습니까?")){
    		alert("삭제되었습니다.");
    		location.href="reDelete.do?review_num="+num+"&res_code="+code;
    	}else
    		return false;
	}
	  
    
    function popupReview(uid,code){
       if(uid.length==0){
          var log = confirm("로그인 후 사용 가능합니다. 로그인 하시겠습니까?");
          if(log == true){
             return location.href='/login.do';
           }else
              return false;
       }
        var popURL = "review.do?uid="+uid+"&res_code="+code;
        var popOption = "width=538px,height=700px,derectories=no,status=no,left=700px,top=150px;";
        window.open(popURL,"",popOption);
    }
    
    
    /* 페이징 */
    function goPage(pages) {
		location.href = "detail.do?" + "pages=" + pages+"&res_code="+${res_code};
 	}
	  
    function backPages(){
	  alert("처음입니다.");
	  location.href ="detail.do?" +"pages=" + 1+"&res_code="+${res_code};
    }

	  $(function(){
		    $('nav li a').click(function(){
		      $('nav li a').removeClass('active');
		      $(this).addClass('active');
		    });
	  });

  </script>
  <script async defer
  	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOgkxkLnHyjxyWkBgkchizWXYWQlvsZzk&callback=initMap">
  </script>
  
  <style>
  
  /* 적용함. 적용됐는지 확인후 삭제 */
  
.header img.logo{
	position:relative;
	top:8px; right:10px;
	width:30px;height:50px;
	
}
.Top{
height:176px;
}

</style>
  </head>
  <body>
    <!-- 전체 네비게이션 -->
    <div id="Top" class="Top">
      <div class="header">
        <p> <img class="logo" onclick="location.href='/'" src="common/image/logo.gif" alt="logo">${vo.res_name }</p>
        <nav class="jieon">
          <ul>
            <li><a class="active"  href="#Rmap">상세정보</a></li>
            <li><a href="#menu">메뉴</a></li>
            <li><a href="#Review">리뷰&평가</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- 전체 네비게이션 끝 -->

    <!-- 이미지 슬라이드 -->
    <!-- 큰이미지 -->
    <div class="section_basic">
        <div class="container" style="height:410px;">
           <c:forEach var="pics" items="${pics }" varStatus="j">
             <div class="mySlides" style="height:410px;">
               <img src="resImg/${vo.res_code }/${pics }" style="width:410px;height:410px;">
             </div>
         </c:forEach>
        <!-- 이전,다음 버튼 -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

        <!-- 하단썸네일 -->
        <div class="row">
           <c:forEach var="pics" items="${pics }" varStatus="j">
             <div class="column">
               <img class="demo cursor" src="resImg/${vo.res_code }/${pics }" style="height:68px;width:69px;" onclick="currentSlide(${j.count})" alt="메뉴1">
             </div>
           </c:forEach>
        </div>
        </div> <!--슬라이드끝  -->
        <div class="info">
          <ul class="Rname" id="Rname">
            <li class="Rcul">업체명</li>
            <li class="Des"> ${vo.res_name }</li>
          </ul>
          <ul class="Rtype" id="Rtype">
            <li class="Rcul">업종</li>
            <li class="Des">${vo.line }</li>
          </ul>
          <ul class="Rnumber" id="Rnumber">
            <li class="Rcul">전화번호</li>
            <li class="Des">${vo.res_tel }</li>
          </ul>
          <ul class="Rgrade" id="Rgrade">
            <li class="Rcul" id="Rcul">평점</li>
            <li class="Des">
              <p class="point">
                <span class="star">
                </span><!-- ☆☆☆☆☆ //-->
                <span class="total">${vo.score }</span>
                <span class="line">|</span>
                <span class="count">${reCount }명 참여</span>
                <button type="button" onclick="popupReview('${sessionScope.loginUid}',${vo.res_code })"><span>평가하기</span></button>
              </p>
            </li>
          </ul>
          <ul class="Raddress" id="Raddress">
            <li class="Rcul">주소</li>
            <li class="Des">${vo.res_addr }</li>
          </ul>
          <ul class=Rtheme id="Rtheme">
            <li class="Rcul">테마</li>
            <li class="Des"  >
              <span>${vo.theme }</span>
            </li>
          </ul>
          <ul class="Rmap"  id="Rmap">
            <li class="Rcul" >지도</li>
          </ul>
          <div id="map"></div>  
        </div><!-- //정보 -->
      </div><!-- //section_basic -->
      <!--상세정보시작 -->
      <div class="detail">
        <br>
        <h2 >상세정보</h2>
        <form>
          <table>
             <tr>
               <th>영업시간</th>
               <td colspan="3">${vo.res_hourS }~${vo.res_hourE }</td>
             </tr>
             <tr>
               <th>휴일</th>
               <td colspan="3">${vo.holiday }</td>
             </tr>
             <tr>
               <th>좌석</th>
               <td>${vo.seats }</td>
             </tr>
             <tr>
               <th>예약정보</th>
               <td id="menu" colspan="3">${vo.information_bo }</td>
             </tr>
             <tr>
               <th>맛집소개</th>
               <td colspan="3">
                   <br>${vo.contents }<br><br>
               </td>
             </tr>
          </table>
          </form>
        </div> 
      <!--//상세정보-->
      <!--메뉴판-->
      <div   class="menupang" >
        <h2>메뉴판</h2>
        <div class="tab">
          <h5>분류</h5>
          <c:forEach var="cate" items="${cate }" varStatus="status" >
             <c:if test="${status.count eq 1}">
                <button class="tablinks active" onclick="openCity(event, 'menu${status.count}','${cate }')" >${cate }</button>
           </c:if>
           <c:if test="${status.count ne 1}">
                <button class="tablinks" onclick="openCity(event, 'menu${status.count}')" >${cate }</button>
           </c:if>
          </c:forEach>
        </div>
        <div class="menu">
        <!--메뉴 1시작 -->
         <c:forEach var="i" begin="1" end="${count }" varStatus="status" >
            <c:set var="b" value="li${status.count}" />
            <div id="menu${status.count}" class="tabcontent">
               <table>
                 <colgroup>
                   <col style="width:80%">
                   <col style="width:20%">
                 </colgroup>
                 <tr>
                   <th>메뉴</th>
                   <th>가격</th>
                 </tr>
                 <c:forEach var="data" items="${requestScope[b] }" varStatus="status2" >
                 <tr class="mainmenu">
                   <td>${data.menu_fname }</td>
                   <td class="Rprice">${data.price }</td>
                 </tr>
                </c:forEach>
               </table>
                <p class="ic_notice">가격 정보는 업체의 사정에 의해 변동이 있을 수 있습니다.</p>
             </div>
         </c:forEach>
        </div><!-- //class menu -->
      </div><!--//메뉴판 -->
	  <!-- 리뷰평가 시작 -->
	  <div class="Review" id="Review">
	    <h2>리뷰&평가 </h2>
	    <button type="button" onclick="popupReview('${sessionScope.loginUid}',${vo.res_code })"><span>평가하기</span></button>
	    <!-- 리뷰평가 ul 시작 -->
	    <div class="W_ul">
	      <ul>
	      <c:if test="${fn:length(re) eq 0 }">
	      	<h3 class="noReview">등록된 댓글이 없습니다.</h3>
	      </c:if>
	      <c:forEach var="re" items="${re }" varStatus="s">
	        <li>
	          <dl>
	            <dt>
	              <img class="img_profile" src="image_detail/dog_icon.png" alt="">
	              <span class="nick">${re.uid }</span>
	            </dt>
	            <dd class="re_date">${re.reg_date }</dd>
	          </dl>
	          <p class="reply ">${re.contents }
	            <c:if test="${sessionScope.loginUid == re.uid && sessionScope.loginUid == 'admin'}">
          			<a href="#" onclick="reDelete(${re.review_num},${vo.res_code })" style="margin-left:5px;color:#a70101"> | 삭제</a>
	          	</c:if>
	          </p>
	          <div class="star${s.count}">
            	<p id="score${s.count}">${re.score }</p>
	          </div><!-- ☆☆☆☆☆ //-->
	        </li>
	        </c:forEach>
	      </ul>
	    </div><!--리뷰평가 ul끝 -->
	   </div>
	   <!--메뉴판끝-->
	   <button type="button" id="goTop">Top</button>	 
	      <!-- 페이징  -->
	  <c:if test="${fn:length(re) > 0 }">
      <nav>
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo lt 6}">  											
					<li><a href="javascript:backPages();"><</a></li>
				</c:if>
				<c:if test="${paging.currentPageNo gt 5}">  			
					<li><a href="javascript:goPage(${paging.prevPageNo}">이전</a></li>
				</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> 
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li><a class="active" href="javascript:goPage(${i}">${i}</a></li>
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i}">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage < finalPage}"> 
					<li><a href="javascript:goPage(${paging.nextPageNo}">></a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
	   </c:choose>
	  </nav>
	  </c:if>
  </body>
  
    <jsp:include page="../../resources/common/footer/footer.jsp"></jsp:include>
</html>