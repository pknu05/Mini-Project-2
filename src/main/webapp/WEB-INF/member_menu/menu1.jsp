<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<div>
	<form action ="mypage.do?menu=1"method ="post">
	<input type ="text"placeholder ="이름" name ="name" value ="${obj.name}" /><br />
	<input type ="text"placeholder ="이메일" name ="email" value ="${obj.email}"/><br />
	<input type ="text"placeholder ="전화번호" name ="phone" value ="${obj.phone}"/><br />
	<input type ="button" value ="정보변경" onclick ="updateMember()"/>
	</form>
</div>