<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="/common/common.css">
  <link rel="stylesheet" href="/css/Q&A-modify.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <script type="text/javascript" src="/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <jsp:include page="../../../resources/common/nav/nav.jsp"></jsp:include>
  <title>Q&A_modify(관리자)</title>
  <script>
  $(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "q_contents",
	        sSkinURI: "/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false,
	        }
	    });
	    //전송버튼
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["q_contents"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#qna_reply").submit();
	    })
	})
  </script>
</head>
<body>
<div class="center">
    <section>
      <!-- 탭메뉴 -->
      <div class="p">
        <h3>Q&A</h3>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
      <form action="qna_updatereply.do" method="get" id="qna_reply">
        <table class="Q_table">
          <colgroup>
            <col style="width:20%">
            <col style="width:40%">
          </colgroup>
          <tr class="Q_first">
            <th>SUBJECT</th>
            <td colspan="3">
            <input type="text" id="q_title" name="q_title" value="[RE]${qnaVo.q_title}" ></td>
          </tr>
          <tr>
            <th>NAME</th>
            <input type="hidden" id="q_num" name="q_num" value="${qnaVo.q_num }" >
            <td colspan="3" id="q_id"name="q_id">${qnaVo.q_id }</td>
          </tr>
          <tr>
            <th>DATE</th>
            <td name="q_date" id="q_date">${qnaVo.q_date }</td>
            <th>VIEW</th>
            <td name="q_hits" id="q_hits">${qnaVo.q_hits }</td>
          </tr>
          <tr>
            <td colspan="4"><textarea style="width:800px; height:412px;" id="q_contents" name="q_contents">
            <c:out value="${qnaVo.q_contents }"/><br>
            <c:out value="-------------------------------------------[원본글 내용]-------------------------------------------"/><br>
            </textarea></td>
          </tr>
        </table>
        
        <button type="submit" class="Q_button" id="savebutton">글쓰기</button>
    	
        </form>
        
        <button type="button" class="Q_button"onclick="location.href='qna.do'">글목록</button>
        <!-- <button type="reset" class="Q_button">다시쓰기</button> -->
        
      
    </div>
  </div>
</section>
</div>
</body>
</html>