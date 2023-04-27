<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Review</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap"
	rel="stylesheet">
<!-- sources -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reviewlist.css" />
</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<hr />
	<div class="container">
		<h2 class="float-start mb-4">리뷰게시판</h2>
		<div class="text-right float-end"
			style="width: 395px; margin-top: 10px;"></div>
		<div>
			<form action="${pageContext.request.contextPath}/review/selectreview.do" method="post">
				<table class="table table-hover" style="margin-bottom: 110px;">
					<thead>
						<tr>
							<th scope="col">신청번호</th>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
							<th scope="col">평점</th>
							<th scope="col">날짜</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${list}">
							<tr>
								<td scope="row" id="no">${obj.no}</td>
								<td><a href="#">${obj.title}</a></td>
								<td>${obj.content}</td>
								<td>${obj.rating}</td>
								<td>${obj.regdate}</td>

								<td style="width: 8px;">
								<input type="text" name="no" value="${obj.no}" style="display: none;"/><input type="submit"
									class="btn btn-primary" value="삭제" ></td>

								<!--<td style="width: 8px;"><input type="button" class="btn btn-primary" value="수정"></td>-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<a href="insertreview.do" class="btn btn-primary float-end"
				style="position: relative; top: -80px;">글쓰기</a>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>



	<!-- <script>
		// $(document).ready(function(){
		$(function() {
			$('#pagination-demo').twbsPagination({
				totalPages : Number('${pages}'),
				visiblePages : 10,
				first : '처음',
				last : '마지막',
				prev : '이전',
				next : '다음',
				initiateStartPageClick : false,
				startPage : Number('${param.page}'),
				onPageClick : function(event, page) {
					window.location.href = "selectlist.do?page=" + page;
				}
			});
		});
	</script> -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

<script>
function deletereview() {
	const form = document.getElementById("form1");
	form.submit();
}


</script>



</body>



</html>