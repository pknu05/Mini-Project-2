<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl - format 만들때 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<form action="delete.do" method="post" id="form">
		<table class="table table-striped">
			<thead class="table table-success  ">
				  <tr>
				    <th scope="col">대분류</th>
				    <th scope="col">소분류</th>
				    <th scope="col">타이틀</th>
				    <th scope="col">클래스일자</th>
				    <th scope="col">시작시각</th>
				    <th scope="col">종료시각</th>
				    <th scope="col">수강료</th>
				    <th scope="col">결제금액</th>
				    <th scope="col">처리상태</th>
				    <th scope="col"></th>
				  </tr>
			</thead>
			<tbody>
				 <c:forEach var="obj" items="${applylist}">
			   		<tr>
				   		 <th>${obj.actcate}</th>
				   		 <td>${obj.actdetailcate}</td>
					     <td>${obj.title}</td>
					     <td>${obj.classdate}</td>
					     <td>${obj.classstart}</td>
					     <td>${obj.classend}</td>
					     <td><fmt:formatNumber value="${obj.totalprice}" pattern="#,###"/></td>
					     <td><fmt:formatNumber value="${obj.payment}" pattern="#,###"/></td>
					     <c:if test="${obj.chk == 1}">
					     	<td>결제완료</td>
					     	<td><a href="#" class="btn btn-danger btn-sm">승인하기</a></td>
					     </c:if>
					     <c:if test="${obj.chk == 2}">
					     	<td>결제취소</td>
					     </c:if>
					     <c:if test="${obj.chk == 3}">
					     	<td>참여완료</td>
					     	<td><button type="button" class="btn btn-secondary btn-sm" disabled="disabled">승인완료</button></td>
					     </c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
	<div class="row justify-content-center">
		<div class="col-4">
			<ul id="pagination-demo" class="pagination"></ul>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>	

<script>
</script>