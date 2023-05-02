<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>비밀번호 변경</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<div class="container">
	<div class="row">
		<form action ="mypage.do?menu=4" method ="post">
			<label for="password" class="form-label">현재 비밀번호를 입력하세요.</label>
			<input class="form-control w-25 mb-3" type ="password" placeholder ="현재 비밀번호" id = "password" name ="password" value ="${obj.password}" />
			
			<label for="newpassword" class="form-label">변경할 비밀번호를 입력하세요.</label>
			<input class="form-control w-25 mb-3" type ="password" placeholder ="새 비밀번호" id = "newpassword" name ="newpassword" value ="${obj.newpassword}"/>
			
			<label for="newpassword" class="form-label">변경할 비밀번호를 한 번 더 입력하세요.</label>
			<input class="form-control w-25 mb-3" type ="password" placeholder ="새 비밀번호 확인" id = "newpassword1" name ="newpassword1" value ="${obj.newpassword}"/>
			
			<input type ="button" class="btn btn-outline-success" value ="정보변경" onclick ="updatepassword()"/>
		</form>
	</div>
</div>