<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/review.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <title>Document</title>
  <script type="text/javascript">
  /* 평균 */
    function avg(){
      var avg=0;var sum=0;
      var taste=parseInt($('#taste').text());
      var service=parseInt($('#service').text());
      var atmo=parseInt($('#atmo').text());
      var price=parseInt($('#price').text());

      var arr = [taste,service,atmo,price];
      for(var i=0;i<4;i++){
        sum = sum+arr[i];
      }
      avg=sum/4;
      $('#total').text(avg);
    }
	/*각 항목 별, 점수 바꾸기 */
    function twinkle(num,gab){
      var number = [1,2,3,4,5];
      for (var i = 1; i <= num; i++) {
        $(gab+i).attr('src','../image_detail/ic_star_on.png');
        for(var j=num;j<=5;j++)
          $(gab+number[j]).attr('src','../image_detail/ic_star_off.png');
      }
      $(gab).text(num);
      avg();
    }
  
	function review(code){
		var total=parseFloat($('#total').text());
		var contents=document.getElementById("contents").value;
		if(!(total)){
			alert("별점을 선택해주세요.");
			return false;
		}
		if(!(contents)){
			alert("댓글을 작성해주세요.");
			return false;
		}
		if(confirm("리뷰를 등록하시겠습니까?")){
			location.href="/setReview.do?score="+total+"&contents="+contents+"&res_code="+code;
		}
	}
	function success(){
		alert("등록이 완료되었습니다.");
		opener.location.reload();
		window.close();
	}
	
  </script>
</head>
<body>
  <div class="full">
    <h4>평가하기</h4>
    <p class="ment">맛집 평가는 재평가 가능하나, 최종 평가 내용으로 점수가 반영됩니다.</p>
    <table class="tg">
      <colgroup>
        <col style="width:30%">
        <col style="width:70%">
      </colgroup>
      <tr>
        <th>항목</th>
        <th>별점(각 항목별 5점 만점)</th>
      </tr>
      <tr>
        <td>맛</td>
        <td>
          <span>
	        <c:forEach var="i" begin="1" end="5">
	          <img id="taste${i }" src="../image_detail/ic_star_off.png" onclick="twinkle(${i},'#taste');">
	        </c:forEach>
          </span>
          <span id="taste">0</span><span> 점</span>
        </td>
      </tr>
      <tr>
        <td>서비스</td>
        <td>
          <span>
            <c:forEach var="i" begin="1" end="5">
	          <img id="service${i }" src="../image_detail/ic_star_off.png" onclick="twinkle(${i},'#service');">
	        </c:forEach>
          </span>
          <span id="service">0</span><span> 점</span>
        </td>
      </tr>
      <tr>
        <td>분위기</td>
        <td>
          <span>
            <c:forEach var="i" begin="1" end="5">
	          <img id="atmo${i }" src="../image_detail/ic_star_off.png" onclick="twinkle(${i},'#atmo');">
	        </c:forEach>
          </span>
          <span id="atmo">0</span><span> 점</span>
        </td>
      </tr>
      <tr>
        <td>가격</td>
        <td>
          <span>
            <c:forEach var="i" begin="1" end="5">
	          <img id="price${i }" src="../image_detail/ic_star_off.png" onclick="twinkle(${i},'#price');">
	        </c:forEach>
          </span>
          <span id="price">0</span><span> 점</span>
        </td>
      </tr>
      
      <tr style="background-color:rgba(254, 218, 198, 0.66);">
        <td style="color:#a70101; font-weight:bold;">합계</td>
        <td>
          <span id="total">0</span><span>점 </span><span style="color:#808080;"> / 5점</span>
        </td>
      </tr>
    </table>
    <div class="comment">
      <h5>댓글</h5>
      <textarea id="contents" class="commentarea" rows="10" cols="55"></textarea>
      <button class="btn" type="button" onclick="review(${code})">평가하기</button>
      <c:if test="${result eq 1 }"><script>success();</script></c:if>
    
    </div>
  </div>
</body>
</html>
