<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>아이디/비밀번호 찾기</title>
  <style media="screen">
    .find{
      margin-top: 60px;
      margin-left: 145px;
    }
    .find_btn{
      height: 50px;
      border-style: none;
      border-radius:4px;
      background-color: #7d7d7d;
      color:#fff;
      padding: 10px;

    }
  </style>

</head>
<body>
  <div class="find">
    <button class="find_btn" onclick="location.href='findId.do'">아이디찾기</button>
    <button class="find_btn" onclick="location.href='findPw.do'">비밀번호찾기</button>
  </div>
</body>
</html>
