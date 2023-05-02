<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>알림메세지</title>
</head>
<body>
	<script>
	alert('${message}'); //알림을 표시
	window.location.href ='${url}'; //주소창을 바꾸고 enter키
	</script>

</body>
</html>