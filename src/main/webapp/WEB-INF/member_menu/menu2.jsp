<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>
<div>
   <form action="selectclass.do" method="post" id="form4">
      <table class="table table-hover mt-2">
             <thead style="background-color: lightgray;">
                     <tr>
                        <th>클래스번호</th>
                        <th>클래스명</th>
                        <th>상호명</th>
                        <th>주소</th>
                        <th>클래스 가격</th>
                        <th>등록일자</th>
                        <th>클래스 관리</th>
                        <th>일정 관리</th>
                     </tr>
               </thead>
               <tbody>
                     <c:set var="total" value="${0}"/> <!-- 변수 만들기 (초기값은 0) -->
                     <c:forEach var="obj" items="${list}">
                         <tr>
                            <th>${obj.classcode}</th>
                            <td>${obj.title}</td>
                            <td>${obj.nickname}</td>
                            <td>${obj.address1}</td>
                            <td><fmt:formatNumber value="${obj.price}" pattern="#,###"/></td>
                            <td><fmt:formatDate value="${obj.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						    <td><input type="button" class="btn btn-sm btn-outline-success" value="클래스 관리" onclick="location.href='${pageContext.request.contextPath}/class/updateone.do '" /></td>
						    <td><input type="button" class="btn btn-sm btn-outline-success" value="일정 관리" onclick="location.href='${pageContext.request.contextPath}/session/select.do?menu=1&classcode=${obj.classcode}'" /></td>
                         </tr>
                     </c:forEach>
                   
               </tbody>
      </table>
      
		<div class="row justify-content-md-center">
			<div class="col-4">
			<ul id="pagination-demo" class="pagination-sm"></ul>
			</div>
		</div>
		
   </form>
</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
<script>

	 $(function() {
		$('#pagination-demo').twbsPagination({
			totalPages : Number('${pages}'),
			visiblePages : 5,
			first : '처음',
			last : '마지막',
			prev : '이전',
			next : '다음',
			initiateStartPageClick : false,
			startPage : Number('${param.page}'),
			onPageClick : function(event, page) {
				$('#page-content').text('Page ' + page);
				//window.location.href = "select.do?page=" + page;
			}
		});
	});

</script>
</body>
</html>