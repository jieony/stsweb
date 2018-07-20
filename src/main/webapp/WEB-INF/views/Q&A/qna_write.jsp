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
  <title>Q&A_write</title>
  <script>
  
  $(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
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
	    //전송버튼(content 내용을 쓰지 않아도 입력되는거 수정하자)
	    $("#btnSave").click(function(){
	    	var title = $("#title").val();
  			var content = $("#content").val();
  	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
  			if(title ==""){
  				alert("제목을 입력하세요");
  				document.getElementById("qna_insert").title.focus();
  				return false;
  			}
  			if(content =="<p><br></p>"){
  				alert("내용을 입력하세요");
  				document.getElementById("qna_insert").content.focus();
  				return false;
  			}
  			
	        //폼 submit
	        document.getElementById("qna_insert").submit();
  			
	    })
	})

  /* 	function writebtn(){
  			var title = $("#title").val();
  			var content = $("#content").val();
  			
  			if(title ==""){
  				alert("제목을 입력하세요");
  				document.getElementById("qna_insert").title.focus();
  				return;
  			}
  			if(content == ""){
  				alert("내용을 입력하세요");
  				document.getElementById("qna_insert").content.focus();
  				return;
  			}
   			document.getElementById("qna_insert").submit();
  		}; */
  </script>
  
</head>

<body>
<div class="center">
    <jsp:include page="../../../resources/common/nav/nav.jsp"/>
    
    <section>
      <!-- 탭메뉴 -->
      <div class="p">
        <h3>Q&A</h3>
      <!-- 탭컨텐츠 -->
      <div class="tab_content">
      <form name="form1" action="qna_insert.do" method="get" id="qna_insert">
        <table class="Q_table">
          <colgroup>
            <col style="width:20%">
            <col style="width:40%">
          </colgroup>
          <tr class="Q_first">
            <th>SUBJECT</th>
            <td colspan="3"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." value=""></td>  	
          </tr>
          <tr>
            <th>NAME</th>
            <td colspan="3">${userid }<input type="hidden" name="writer" id="writer" value="${userid }"></td>
          </tr>
           <tr>
            <th>DATE</th>
            <td>${qnavo.q_date }</td>
            <th>VIEW</th>
            <td><c:out value="${qnavo.q_hits }"/></td>
          </tr>
          <tr>
            <td colspan="4">
	            <textarea style="width:800px; height:412px;" name="content" id="content" placeholder="내용을 입력해주세요." value="">
	            </textarea>
            </td>
          </tr>
        </table>
        <button type="button" class="Q_button"onclick="location.href='qna.do'">글목록</button>
        <!-- <button type="reset" class="Q_button">다시쓰기</button> -->
        <button type="button" class="Q_button" id="btnSave">글쓰기</button>
      </form>
    </div>
  </div>
</section>
</div>
</body>
</html>