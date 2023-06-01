<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<title>신청 상태 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container">
		<div style="width: 500px; margin-top: 10px;">
			<form class="row g-2">
				<div class="col-auto">
					<input type="text" name="text" class="form-control"
						placeholder="검색어" style="width: 300px;" />
				</div>
				<div class="col-auto">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
			</form>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">신청번호</th>
					<th scope="col">신청 처리상태(1:결제완료, 2:결제취소, 3:참여완료)</th>
					<th scope="col">상태등록일자</th>
				</tr>
			</thead>
			   <tbody>
				<c:forEach var="obj" items="${list}">
					<tr>
						<td>${obj.no}</td>
						<td>${obj.applyno}</td>
						<td>${obj.chk}</td>
						<td>${obj.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a class="btn btn-sm btn-primary" href="home.do">홈화면으로</a> <a
			class="btn btn-sm btn-primary" href="apply.do">이전화면으로</a>
	</div>


	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


	<script>
	function
	document.getElementByid("display").innerHTML = 100 / 20;
	</script>

</body>
</html>