<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="common/common.css">
  <link rel="stylesheet" href="css/Q&A-detail.css">

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <title>qna_manyanswer</title>
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
      <form action="qna_manyanswer.do" method="get">
        <table class="Q_table">
          <colgroup>
            <col style="width:20%">
            <col style="width:40%">
          </colgroup>
          <tr class="Q_first">
            <th>SUBJECT</th>
            <td colspan="3" >${list.q_title }</td>
          </tr>
          <tr>
            <th>NAME</th>
            <td colspan="3">${list.q_id }</td>
          </tr>
          <tr>
            <th>DATE</th>
            <td>${list.q_date }</td>
            <th>VIEW</th>
            <td>${list.q_hits }</td>
          </tr>
          <tr>
            <td  colspan="4">
             	${list.q_contents }
          </tr>
        </table>
        <button type="button" class="Q_button" onclick="location.href='qna.do'">글목록</button>

       <%--  <button type="button" class="Q_button" onclick="location.href='javascript:delqna(${list.q_num });'">글삭제</button --%>
        <!-- <button type="button" class="Q_button" id="btn_master">답글달기</button> -->
      </form>
    </div>
  </div>
</section>
</div>
</body>
</html>