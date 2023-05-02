<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div
			style="width: 600px; margin: 10 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>로그인</h3>
			<form action="${pageContext.request.contextPath}/member/login.do"
				method="post" id="form">
				<div class="row">
					<div class="col-sm">
						<div class="form-floating mb-2">
							<input type="text" name="id" id="id" class="form-control" /> <label
								for="id" class="form-label">아이디</label>
						</div>
						<div class="form-floating mb-2">
							<input type="password" name="pw" id="pw" class="form-control" />
							<label for="pw" class="form-label">암호</label>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/home.do"><button type="button" class="btn btn-primary">홈</button></a>
							<input type="button" value="로그인" class="btn btn-primary"
								onclick="loginAction()" /> 
								<a href="join.do" class="btn btn-primary">회원가입</a> 
								<!-- 아이디찾기 자리 -->
								<button class ="btn btn-primary" type="button" onclick="searchId()">아이디찾기</button>
								<button class ="btn btn-primary" type="button" onclick="resetPW()">비밀번호재설정</button>
								
						</div>
						
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="findid.do" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">아이디찾기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-2">
							<input type="text" name="name" id="name" class="form-control" /> 
							<label for="name" class="form-label">등록하신 이름을 입력해주세요</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="email" id="email" class="form-control" />
							 <label for="email" class="form-label">등록하신 이메일을 입력해주세요</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="phone" id="phone" class="form-control" />
							 <label for="phone" class="form-label">등록하신 전화번호를 입력해주세요</label>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="확인" />
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="resetpw.do" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호재설정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-2">
							<input type="text" name="name" id="name" class="form-control" /> 
							<label for="name" class="form-label">등록하신 아이디를 입력해주세요</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="email" id="email" class="form-control" />
							 <label for="email" class="form-label">등록하신 이메일을 입력해주세요</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" name="phone" id="phone" class="form-control" />
							 <label for="phone" class="form-label">등록하신 전화번호를 입력해주세요</label>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="확인" />
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src = "${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script>
		function loginAction() {
			const id = document.getElementById("id");
			const pw = document.getElementById("pw");
			const form = document.getElementById("form");

			if (id.value.length <= 0) {
				alert('아이디를 입력하세요');
				id.focus();
				return false;

			}
			if (pw.value.length <= 0) {
				alert('비밀번호를 입력하세요');
				pw.focus();
				return false;

			}
			
			form.submit();
			
		}
		function searchId(){
			const name = document.getElementById("name");
			const email = document.getElementById("email");
			const phone = document.getElementById("phone");
			
			const modal = new bootstrap.Modal(document.getElementById("exampleModal"),{});
			 modal.show();
		}
	</script>
</body>
</html>