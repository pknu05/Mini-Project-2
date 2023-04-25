<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div
			style="width: 600px; margin: 0 auto; padding: 50px; border: 1px solid #green;"></div>
		<h2>회원가입</h2>
		<form action="join.do" method="post" id="form">
			<div class="row">
				<div class="col-sm">
					<div class="form-floating mb-2">
						<input type="text" name="id" id="id" class="form-control"
							onkeyup="ajaxIDCheck(this)" /> <label for="id" id="lbl_check"
							class="form-label">아이디</label>
					</div>
					<div class="form-floating mb-2">
						<input type="password" name="pw" id="pw" class="form-control" />
						<label for="pw" class="form-label">암호</label>
					</div>
					<div class="form-floating mb-2">
						<input type="password" name="pw1" id="pw1" class="form-control" />
						<label for="pw1" class="form-label">암호확인</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="name" id="name" class="form-control" />
						<label for="name" class="form-label">성명</label>
					</div>
					<div class="form-floating mb-2">
						<input type="email" name="email" id="email" class="form-control" />
						<label for="email" class="form-label">이메일 주소를 입력해주세요 ex)a1@gmail.com</label>
					</div>
					<div class="form-floating mb-2">
						<input type="text" name="phone" id="phone" class="form-control"/>
						<label for="phone" class="form-label">전화번호 11자리를 입력해주세요</label>
					</div>
						<div class="form-floating mb-2">
						<input type="text" name="birth" id="birth" class="form-control"/>
						<label for="birth" class="form-label">생년월일 6자리를 입력해주세요</label> 
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value ="M"
							name="gender" id="Man" checked> 
							<label class="form-check-label" for="gender" >남성</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value ="W"
							name="gender" id="Woman" >
							<label class="form-check-label" for="gender" >여성</label>
					</div>
					<div>
						<input type="submit" value="회원가입" class="btn btn-primary"
							onclick="joinAction()">

					</div>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script>
	var idcheck = 0 ;
	
	async function  joinAction(){
	const id = document.getElementById("id");
	const pw = document.getElementById("pw");
	const pw1 = document.getElementById("pw1");
	const name = document.getElementById("name");
	const email = document.getElementById("email");
	const phone = document.getElementById("phone");
	const birth = document.getElementById("birth");
	
	if(id.value.length <= 0) {
		alert('아이디를 입력하세요');
		id.focus();
		return false();
	}
	if(pw.value !== pw1.value){
		alert('비밀번호가 일치하지 않습니다.');
		pw.focus();
		return false();
	}
	if(idcheck === 0 ){
		alert('다른고객이 사용중인 아이디 입니다.');
		id.focus();
		return false();
	}

	const url 		= '${pageContext.request.contextPath}/api/member/join.json';
	const headers 	={"Content-Type":"application/x-www-form-urlencoded"};
	const body 		={id:id.value, pw:pw.value, name:name.value,email:email.value,phone:phone.value , birth:birth.value};
	const {data} 	= await axios.post(url, body, {headers});
	console.log(data);
	if(data.ret === 1 ){
		alert( '회원가입이 완료되었습니다.');
		
	}else{
		alert('회원가입이 실패하였습니다.')
		
		 
	}
		document.getElementById("form").submit();
	}
	
	
	async function ajaxIDCheck(e){
		
		if(e.value.length > 0) {
			const url 		= '${pageContext.request.contextPath}/api/member/idcheck.json?id=' + e.value;
			const headers 	= {"Content-Type":"application/json"};
			const {data} 	= await axios.get(url, {headers});
		console.log(data);
		
		if(data.ret === 1 ){
			idcheck = 0 ;
			document.getElementById("lbl_check").innerText ='사용불가';
		}
		else if(data.ret === 0 ){
			idcheck =1 ;
			document.getElementById("lbl_check").innerText ='사용가능';
		}
	}
		else {
			idcheck = 0;
		    document.getElementById("lbl_check").innerText ='아이디';
	}
}

	
	
	</script>
</body>
</html>