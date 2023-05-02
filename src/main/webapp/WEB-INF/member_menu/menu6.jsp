<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원탈퇴</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<div>
	<form action ="mypage.do?menu=6" method ="post">
	
		<input class="form-control w-25 mb-3" type ="text" placeholder ="비밀번호를 입력하세요" name ="password" value ="${obj.password}"/>
		<input type ="button" class="btn btn-outline-success" value ="회원탈퇴" onclick ="deleteMemberOne()"/>
	</form>
</div>