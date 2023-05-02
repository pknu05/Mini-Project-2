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
    <!-- datepicker css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
	<link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/session.css?ver=1"/>

	<style>
	.session-hr > hr {background-color:#75D63F;}
	</style>

</head>

<body class="d-flex flex-column min-vh-100"> 
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
			    </div>
  			</div>
  		</div>
 		<!-- / left menu bar -->
 		
 		<!-- right side -->
 		<div class="col-lg-9 right_side" >
 		
			<form action="write.do" method="post" id="form">
				<h7>일정관리하기 > 일정등록하기</h7>
				<div class="session-hr">
					<hr>
				</div>
		   		<div class="guide">'*' 항목은 반드시 입력해주세요.</div>
		   	   <!-- 일정 상세 입력 영역 -->
			   <div class="row">
			      <div class="form-floating mb-3 col-lg-3">
			          <input type="number" id="min" name="min" class="form-control min" autofocus>
			          <label for="min" class="form-label">* 최소인원</label>
			      </div>
			      <div class="form-floating mb-3 col-lg-3">
			          <input type="number" id="max" name="max" class="form-control max" required>
			          <label for="max" class="form-label">* 최대인원</label>
			      </div>	
			   </div>
			   <div class="row">
			      <div class="form-floating mb-3 col-lg-3">
			          <input id="date" name="date" class="form-control datepicker date">
			          <label for="date" class="form-label">* 날짜</label>
			      </div>
			      <div class="form-floating mb-3 col-lg-3">
			          <input type="time" id="start" name="start" class="form-control start">
			          <label for="start" class="form-label">* 시작시각</label>
			      </div>
			      <div class="form-floating mb-3 col-lg-3">
			          <input type="time" id="end" name="end" class="form-control end">
			          <label for="end" class="form-label">* 종료시각</label>
			      </div>
			      <div class="form-floating mb-3 col-lg-3">
			      	<input type="hidden" name="day" id="day">
			      </div>
			      <div>
			      	<input type="hidden" name="classcode" value="${param.classcode}">
			      </div> 
			   </div>
			    
			   <!-- 계산영역 -->
			   <div class="row cal">
				   	<div class="form-floating mb-3 col-lg-3">
				      <input type="text" id="default" name="default" class="form-control" value="${price}" disabled readonly>
				      <label for="default" class="form-label">기본가격</label>
				   </div>
				   <div class="form-floating mb-3 col-lg-6 align-self-center" >
				      <div class="form-check form-check-inline">
					  <input class="form-check-input radio-value level-value-detail" type="radio" name="level" id="inlineRadio1" value="1" checked>
					  <label class="form-check-label" for="inlineRadio1">입문자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input radio-value" type="radio" name="level" id="inlineRadio2" value="2">
					  <label class="form-check-label" for="inlineRadio2">경험자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input radio-value" type="radio" name="level" id="inlineRadio3" value="3">
					  <label class="form-check-label" for="inlineRadio3">숙련자</label>
					</div>	
				   </div>
			   </div>
			   
			   <div class="row">
				   <div class="form-floating mb-3 col-lg-3">
				     <input type="number" id="addprice" name="addprice" class="form-control radio-value-detail ">
				     <label for="addprice" class="form-label">추가금액</label>
				   </div>		   
				   <div class="form-floating mb-3 col-lg-3">
				       <input type="number" id="rate" name="rate" class="form-control rate-value-detail">
				       <label for="rate" class="form-label">할인률(%)</label>
				   </div>		   
				   <div class="form-floating mb-3 col-lg-3 align-self-center">
				      <input type="button" value="계산하기" class ="btn btn-secondary" onclick="showPrice()"/>
				   </div>		   
				   <div class="form-floating mb-3 col-lg-3">
				        <input type="number" id="total" name="total" class="form-control sale-value-detail" readonly> 
				       <label for="total" class="form-label">판매금액</label>
				   </div>	
			   </div>   
			  	<br><br>
			  	<hr>    
			   <div>
			         <input type="button" value="등록하기" class="btn btn-success register-btn" disabled="disabled" onclick="registerSession()" />
			         <a href="select.do" class="btn btn-secondary register-btn">뒤로가기</a>  
			   </div>   
			</form> 
		</div>
		<!-- / right side -->
	</div>
	
	<!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
    
    
    <!-- datepicker js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/session.js?ver=5"></script>
    
    <script>
    
    
    </script>

</body>
</html>
      