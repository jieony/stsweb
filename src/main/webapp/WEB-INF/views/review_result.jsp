<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title></title>
<script>
	function bye(){
		window.clse();
	}
</script>
	
</head>
<body>
	<c:if test="result ne 0">
		bye();
	</c:if>
</body>
</html>