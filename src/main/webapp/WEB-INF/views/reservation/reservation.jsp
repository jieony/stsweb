<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>예약맛집</title>
<link rel="stylesheet" href="common/common.css">
<link rel="stylesheet" href="css/css_reservation/reservation.css">
<jsp:include page="../../../resources/common/nav/nav.jsp"/>
<script type="text/javascript">
  $(function(){
      $('div ul li a').removeClass('active');
      $('div ul li:nth-child(3) a').addClass('active');
   });

  function goPage(pages) {
	if(pages ==0){
	}else{
		location.href="resv.do?pages="+pages;
	}
  }
  
  function backPages(){
	  location.href ="resv.do?pages="+1
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

      <div class="tab_content">
        <p class="first">예약 맛집 찾기</p>
        <div class="search_res">
          <form action="resv_find.do" method="get">
            <div class="select">
              <label for="foodcode" class="ml">업종</label>
              <select id="foodcode" name="foodcode" class="sd">
                <option value="" selected>--업종선택--</option>
                <option value="한식">한식</option>
                <option value="양식">양식</option>
                <option value="일식">일식</option>
                <option value="중식">중식</option>
              </select>
            </div>
            <div class="select">
              <label for="">테마</label>
              <select id="themacode" name="themacode" class="sd">
                <option value="" selected>--테마선택--</option>
                <option value="가족">가족모임</option>
                <option value="연인">연인과함께</option>
                <option value="친구">친구와함께</option>
                <option value="날씨">날씨에따라</optio분식n>
                <option value="치맥/피맥">치맥/피맥</option>
                <option value="후식">달콤후식</option>
                <option value="건강식">건강식</option>
                <option value="TV맛집">TV맛집</option>
                <option value="돼지">돼지고기</option>
                <option value="소">소고기</option>
                <option value="닭">닭</option>
                <option value="해산물">해산물</option>
                <option value="면요리">면요리</option>
                <option value="분식/즉석">분식/즉석</option>
                <option value="무한뷔페">무한뷔페</option>
                <option value="무한리필">무한리필</option>
              </select>
            </div>
            <div class="select">
              <label for="locationcode">지역</label>
              <select id="locationcode" name="locationcode" class="sd">
                <option value="" selected>--지역선택--</option>
                <option value="100" >가로수길</option>
                <option value="101" >강남역</option>
                <option value="102" >관악/신림</option>
                <option value="103" >구로</option>
                <option value="104" >노량진</option>
                <option value="105" >목동/강서</option>
                <option value="106" >반포/서래마을</option>
                <option value="107" >방배/사당</option>
                <option value="108" >서초/교대</option>
                <option value="109" >신논현/영동시장</option>
                <option value="110" >신사/잠원</option>
                <option value="111" >압구정/청담</option>
                <option value="112" >양재/도곡</option>
                <option value="113" >선릉/삼성/대치</option>
                <option value="114" >역삼</option>
                <option value="115" >영등포/여의도</option>
                <option value="116" >잠실/신천</option>
                <option value="117" >천호/강동</option>
                <option value="120" >광진/건대입구</option>
                <option value="121" >광화문/시청</option>
                <option value="122" >노원/도봉/미아</option>
                <option value="123" >대학</option>
                <option value="124" >동대문</option>
                <option value="125" >부암동/평창동</option>
                <option value="126" >마포</option>
                <option value="127" >상암</option>
                <option value="128" >서촌/경복궁</option>
                <option value="129" >성동/성수</option>
                <option value="130" >성북</option>
                <option value="131" >숙대/서울역</option>
                <option value="132" >신촌/이대</option>
                <option value="133" >안암/고대</option>
                <option value="134" >연남동/연희동</option>
                <option value="135" >연신대/불광</option>
                <option value="136" >이촌동/용산</option>
                <option value="137" >이태원/한남동</option>
                <option value="138" >종로/인사</option>
                <option value="139" >충무로/신당</option>
                <option value="140" >홍대/상수/합정</option>
                <option value="141" >회기</option>
              </select>

            </div>
            <div class="select">
              <label for="mat_name">맛집이름</label>
              <input class="res_name" type="text" id="mat_name" name="mat_name">
            </div>
            <div class="select">
              <label for="mat_loca">하위주소</label>
              <input class="addr" type="text" id="mat_loca" name="mat_loca">
            </div>
            <button class="sbutton" type="submit">검색</button>
          </form>
        </div>
        <div class="searchlist">
          <h5>예약가능 맛집 리스트</h5>
          <table >
            <colgroup>
              <col style="width:50%;">
              <col style="width:30%;">
              <col style="width:10%;">
              <col style="width:10%;">
            </colgroup>
        		<tr>
        			<th>상호/주소</th>
        			<th>영업시간/휴일</th>
              		<th>후기</th>
        			<th>선택</th>
        		</tr>
        		<c:set value="0" var="cont"/>
        		<c:forEach var="list" items="${lists}" varStatus="statusnum">
        		<tr>
	              <td>
	              
	                  <a href="/detail.do?res_code=${list.res_code }">
	                  	<img class="food_img" id="zeroimg_${cont }" src="" alt="음식점사진"></a>
	                  <a href="/detail.do?res_code=${list.res_code }" class="food_a">${list.res_name}</a>
	                  <p class="food_p">${list.res_addr}</p>
					
					<!-- 이미지 split --> 
				      <script type="text/javascript">
				        var strArray = "${list.pics}".split('/');
				        var str = strArray[0];
				        var text = "resImg/${list.res_code}/";
				        var result= text.concat(str);
				        document.getElementById("zeroimg_${cont}").src = result;
				      </script>
	              </td>
	              <td>
	                <p>${list.res_hourS}~${list.res_hourE}</p>
	                <p>${list.holiday}</p>
	              </td>
	              <c:set var="cntt" value="0"/>
	              <c:forEach var="review" items="${review }" varStatus="m" begin="0">
		              <c:if test="${list.res_code == review.res_code}">
		              	<c:set var="temp" target="cntt" value="${cntt=cntt+1}"/>
		              </c:if>
	              </c:forEach>
	              <td>${cntt }개</td>
	              <c:set var="cntt" value="0"/>
	              <td><a class="food_a_re" href="resv_info.do?res_code=${list.res_code }">예약</a></td>
            	</tr>
            	<c:forEach var="z" begin="0" end="1">
			      	<c:if test="${z ne 1}">
			      		<c:set var="cont" value="${cont=cont+1}"/>
			      	</c:if>
			    </c:forEach>
            	</c:forEach>
      
      
          </table>
        </div>
        <!-- paging -->
        <c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div>
			<ul class="pagination">
				<c:if test="${paging.currentPageNo < 6}">  											  <!-- 현재 페이지가 6보다 작다면(즉, 6페이지 이하이라면) -->
					<li><a href="javascript:backPages();"><</a></li> <!-- 처음페이지 표시 -->
				</c:if>				
				<c:if test="${paging.currentPageNo > 5}">  											  
					<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})"><</a></li>
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
					
				<c:if test="${currentPage < finalPage}">
					<li><a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">&gt;</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>   
      </div><!-- //탭 컨탠츠 1-->
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>