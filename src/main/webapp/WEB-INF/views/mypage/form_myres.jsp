<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/css_mypage/form_myres.css">
 <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
  <script>

    function render_mailchk() {
      var x = document.getElementById("mySelect").value;
      document.getElementById("myselect").value = x;
    }
    
     $(function(){
    	var ok = confirm("새로운 음식점을 등록하시겠습니까?");
    	if(ok==true){
    		
    	}else{
    		alert("등록을 취소하셨습니다.")
    		location.href="mypage_user_info.do";
    	}
    }); 

    $(function() {
        var Html = [];
        var values="";
        for (var i = 0; i < 25; i++) {
          for(var j = 0; j < 60; j=j+30){
            if(j==0){
            	  value=i+":0"+j+"";
            }else {
              value=i+":"+j+"";
            }
            Html[i]="<option value="+value+">"+value+"</option>";
            $("#selectTimeS").append(Html.join(""));
            $("#selectTimeS2").append(Html.join(""));

            Html = [];
          }
        }
    });

    $(function() {
        var Html = [];
        var values="";
        for (var i = 1; i < 21; i++) {
            value=i
            Html[i]="<option value="+value+">"+value+"</option>";

        }
        $("#selectTimeC").append(Html.join(""));
    });


  		function register(){
  			var r=document.reg;
  			if(r.res_name.value==""){
  				alert("업체명을 입력해 주세요");
  				return false;
  			}else if(r.line.value==""){
  				alert("업종을 입력해 주세요");
  				return false;
  			}else if(r.res_addr.value==""){
  				alert("주소을 입력해 주세요");
  				return false;
  			}else if(r.res_tel.value==""){
  				alert("전화번호를 입력해 주세요");
  				return false;
  			}else if(r.res_hourS.value=="" || r.res_hourE==""){
  				alert("영업시간을 입력해 주세요");
  				return false;
  			}else if(r.holiday.value==""){
  				alert("휴일을 입력해 주세요");
  				return false;
  			}else if(r.seats.value==""){
  				alert("좌석을 입력해 주세요");
  				return false;
  			}else if(r.contents.value==""){
  				alert("소개를 입력해 주세요");
  				return false;
  			}else if(r.information_bo.value==""){
  				alert("예약정보를 입력해 주세요");
  				return false;
  			}else if(r.theme.value==""){
  				alert("테마를을 체크해 주세요");
  				return false;
  			}
  			
  			
  			alert("등록이 완료되었습니다")
  			return true
  		}
  		
  		function cancel(){
  			alert("취소했습니다.");
  			location.href="mypage_user_info.do";
  		}
  		
  		function info(){
  			if(confirm("나의정보로 돌아가시겠습니까?")){
  				location.href="mypage_user_info.do";
  			}else{
  				alert("취소하였습니다.");
  			}
  			
  		}
  		
  		function back(){
  			alert("음식점 등록을 완료해주세요");
  		}
  		function reg(){
  			alert("음식점 등록을 완료해주세요");
  			
  		}
  </script>
  <title>음식점 등록</title>
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
          <span>
            <li class="res icon_res" >
              <p><a href="javascript:info();">나의정보</a></p>
            </li>
          </span>
          <span class="active_tab">
            <li class="res icon_my" >
              <p><a href="javascript:reg();">나의음식점</a></p>
            </li>
          </span>
           <span>
            <li class="res icon_res" >
              <p><a href="javascript:back();">음식점예약</a></p>
            </li>
          </span>
        </ul>
      </div>
		
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
        <p class="first">등록접수</p>
          <div class="info">
            <form action="mypage_user_check.do" method="get" onsubmit="return register();" name="reg">
              <ul class="form">
                <li class="li">
                  <label for="res_name">
                    <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업체명</label>
                  <input type="text" id="res_name" name="res_name">
                </li>
                <li class="li">
                  <label for="line">
                    <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 업종</label>
                  <input type="text" id="line" name="line" />
                </li>
                <li class="li">
                  <label for="res_addr">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 주소</label>
                  <input type="text" id="res_addr" name="res_addr">
                </li>
                <li class="li">
                  <label for="res_tel">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 전화번호</label>
                  <input type="text" id="res_tel" name="res_tel">
                </li>
                <li class="li">
                  <label for="selectTimeSE">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 영업시간</label>
                  <select id="selectTimeS" name="res_hourS">                 
                  </select>
                  <label for="selectTimeS2">~</label>
                  <select id="selectTimeS2" name="res_hourE">                 
                  </select>
                </li>
                <li class="li">
                  <label for="holiday">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 휴일</label>
                  <input type="text" id="holiday" name="holiday" >
                </li>
                <li class="li">
                  <label for="seats">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 좌석</label>
                  <input type="text" id="seats" name="seats" >
                </li>
                <li class="li">
                  <label for="contents">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 소개</label>
                  <input type="text" id="contents" name="contents" >
                </li>
                <li class="li">
                 <label >
                 <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 예약정보</label>
                   <select name="information_bo">                      
                        <option value="가능">예약 가능</option>
                        <option value="불가능">예약 불가능</option>
                   </select>
                </li>
                <li class="li">
                  <label class="la_theme">
                  <img claas="reddot" src="common/image/ico_reddot.gif" alt="reddot"> 테마</label>
                   <div class="div_theme">
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="가족모임">
                       <span>가족모임</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme"  value="연인과함께">
                       <span>연인과함께</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme"  value="친구와함께">
                       <span>친구와함께</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="날씨에따라">
                       <span>날씨에따라</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="치맥/피맥">
                       <span>치맥/피맥</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="달콤후식">
                       <span>달콤후식</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="건강식">
                       <span>건강식</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="tv맛집">
                       <span>tv맛집</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="돼지고기">
                       <span>돼지고기</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);" name="theme" value="소고기">
                       <span>소고기</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="닭">
                       <span>닭</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="해산물">
                       <span>해산물</span></label><br>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="면요리">
                       <span>면요리</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"  name="theme" value="분식/즉석">
                       <span>분식/즉석</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"   name="theme" value="무한뷔페">
                       <span>무한뷔페</span></label>
                     <label><input type="checkbox" onClick="count_ck(this);"   name="theme" value="무한리필">
                       <span>무한리필</span></label><br>
                   </div>
                </li>
                  <li class="li">
                  <label for="res_uid">                 
                  <input type="hidden" id="res_uid" name="res_uid" value="${uid }">
                </li>
              </ul>
              <button type="submit">등록</button>
              <button type="reset">다시작성하기</button>
              <button type="button" onclick="cancel();">취소</button>
            </form>
          </div><!-- //info  -->
      </div>
    </section>
  </div>
</body>
<jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>
</html>