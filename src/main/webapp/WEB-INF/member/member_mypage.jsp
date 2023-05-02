<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap" rel="stylesheet">
<link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/main.css">
<style>
	html,body {
	height : 100%;
	}
	#wrapper {
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
	}
	footer {
    position: relative; (absolute -> relative)
    transform: translatY(-100%);
	}
</style>
</head>
<body>

	<!-- header 영역 -->
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="wrapper" class="border-top">
		<div class="container">
			<div class="row">
				<div class="col mt-3 text-center">
					<a href="${pageContext.request.contextPath}/home.do" class="btn btn-success">홈</a> 
					<a href="mypage.do?menu=1" class="btn btn-success">회원 정보 수정</a> 
					<a href="mypage.do?menu=2" class="btn btn-success">내 클래스 관리</a> 
					<a href="mypage.do?menu=3" class="btn btn-success">클래스 신청 내역</a> 
					<a href="mypage.do?menu=4" class="btn btn-success">비밀번호 재설정</a> 
					<a href="mypage.do?menu=5" class="btn btn-success">리뷰 내역</a>
					<a href="mypage.do?menu=6" class="btn btn-success">회원 탈퇴</a>
				</div>
			</div>
		
			<hr class="divider">
			
			<c:if test="${param.menu == 1}">
				<jsp:include page="/WEB-INF/member_menu/menu1.jsp"></jsp:include>
			</c:if>
			<c:if test="${param.menu == 2}">
				<jsp:include page="/WEB-INF/member_menu/menu2.jsp"></jsp:include>
			</c:if>
			<c:if test="${param.menu == 3}">
				<jsp:include page="/WEB-INF/member_menu/menu3.jsp"></jsp:include>
			</c:if>
			<c:if test="${param.menu == 4}">
				<jsp:include page="/WEB-INF/member_menu/menu4.jsp"></jsp:include>
			</c:if>
			<c:if test="${param.menu == 5}">
				<jsp:include page="/WEB-INF/member_menu/menu5.jsp"></jsp:include>
			</c:if>
				<c:if test="${param.menu == 6}">
				<jsp:include page="/WEB-INF/member_menu/menu6.jsp"></jsp:include>
			</c:if>
			
		</div>
	</div>
	<!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
    
	<script>
		function updateMemberOne() {
			//유효성 검사
			const name = document.getElementsByName("name")[0];
			const email = document.getElementsByName("email")[0];
			const phone = document.getElementsByName("phone")[0];
			
			if (name.value.length <= 0) {
				alert('이름을 입력해주세요');
				name.focus();
				return false;

			}

			if (email.value.length<= 0) {
				alert('이메일을 입력해주세요');
				email.focus();
				return false;
			}
			
			if(phone.value.length <= 0){
				alert('전화번호를 입력해주세요');
				phone.focus();
				return false;
			}
			
			
			const form = document.getElementsByTagName("form");
			form[0].submit();
		}
		
		function updatepassword() {
			const password = document.getElementById("password");
			const newpassword = document.getElementById("newpassword");
			const newpassword1 = document.getElementById("newpassword1");
			
			if (password.value.length <= 0) {
				alert('비밀번호를 입력해주세요');
				password.focus();
				return false;
			}
			
			if (newpassword.value.length <= 0) {
				alert('새비밀번호를 입력해주세요');
				newpassword.focus();
				return false;

			}
			if(newpassword.value !== newpassword1.value){
				alert('비밀번호가 일치하지않습니다');
				newpassword1.focus();
				return false;
				
			}
			const form = document.getElementsByTagName("form");
			form[0].submit();
		}
		
		function deleteMemberOne() {
			
			const password = document.getElementsByName("password")[0];
			

			if (password.value.length <= 0) {
				alert('비밀번호를 입력해주세요');
				name.focus();
				return false();

			}
			
			const form = document.getElementsByTagName("form");
			form[0].submit();

		}
	</script>
</body>
</html>