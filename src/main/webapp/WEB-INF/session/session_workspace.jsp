<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>세션관리페이지</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/home.css"/>
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/session.css?ver=1"/>
</head>


<body class="d-flex flex-column min-vh-100"> <!-- d-flex flex-column min-vh-100는 footer고정용 -->
	<!-- header -->
    <jsp:include page="../header.jsp"></jsp:include>
    
    <div class="container body row">
    
    	<!-- left menu bar -->
    	<div class="col-lg-3">
			<div class="col-9">
		    	<div id="list-example" class="list-group">
			      <h5 class="text-center">일정 작업실</h5>
			      <a class="list-group-item list-group-item-action" href="select.do?menu=1">일정관리하기</a>
			      <a class="list-group-item list-group-item-action" href="select.do?menu=2">신청자관리하기</a>
			      <a class="list-group-item list-group-item-action" href="select.do?menu=3">문의하기</a>
			      <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/member/mypage.do?menu=2">뒤로가기</a>
			    </div>
  			</div>
  		</div>
  		<!-- / left menu bar -->
  		
  		<!-- right side -->
  		<div class="col-lg-9 right_side" >
  			<c:if test="${param.menu == 1}">
				<jsp:include page="./session_menu/menu1.jsp"></jsp:include>
			</c:if>
			<c:if test="${param.menu == 2}">
				<jsp:include page="./session_menu/menu2.jsp"></jsp:include>
			</c:if>
  		</div>
  		<!-- / right side -->
	</div>
    
    <!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/session.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js?ver=1"></script>
</body>
</html>