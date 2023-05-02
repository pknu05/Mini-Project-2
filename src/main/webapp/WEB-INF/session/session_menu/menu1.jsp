<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl - format 만들때 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<form action="delete.do" method="post" id="form">
		<table class="table table-hover">
			<thead class="table table-success ">
				  <tr>
				  	<th scope="col"></th>
				    <th scope="col">번호</th>
				    <th scope="col">클래스일자</th>
				    <th scope="col">시작시간</th>
				    <th scope="col">종료시간</th>
				    <th scope="col">기본금액</th>
				    <th scope="col">신청인원</th>
				    <th scope="col"></th>
				  </tr>
			</thead>
			<tbody>
				 <c:set var="total" value="${0}"/> <!-- 변수 만들기 (초기값은 0) -->
				 <c:forEach var="obj" items="${list}">
			   		<tr>
			   		 <th><input type="checkbox" name="chk[]" value="${obj.no}"></th>
			   		 <th>${obj.no}</th>
				     <td>${obj.classdate}</td>
				     <td>${obj.classstart}</td>
				     <td>${obj.classend}</td>
				     <td><fmt:formatNumber value="${obj.addprice}" pattern="#,###"/></td>
				     <td>${obj.cnt}</td>
				     <td><a href="update.do?no=${obj.no}&classcode=${obj.classcode}" class="btn btn-light">조회하기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<a href="write.do?classcode=${param.classcode}" class="btn btn-outline-success register-btn0">일정등록하기</a>
	<input type="button" class="btn btn-outline-danger register-btn0" value="일정삭제하기" onclick="deleteSessionAction()" />
	
	<div class="row justify-content-center">
		<div class="col-4">
			<ul id="pagination-demo" class="pagination"></ul>
		</div>
	</div>
</div>

<script>
	function deleteSessionAction() {
		const ret = confirm('주문을 취소할까요?');
	      if (ret) {
	         // name값이 chk[]인 것을 n개 찾음
	         const chk = document.getElementsByName("chk[]");
	         
	         let isCheck = 0;
	         for (let i=0; i<chk.length; i++) { // 찾은 개수만큼 반복함
	            if (chk[i].checked === true) { // 체크된게 있다면
	               isCheck = 1;
	               break;
	            } 
	         }
	         
	         // 체크된 것이 있는지 확인
	         if (isCheck === 1) {
	            if (confirm('주문을 취소할까요?')) {
	               document.getElementById("form").submit();
	            }
	         }
	         else {
	            alert('항목을 체크하세요.');
	            return false;
	         }
	      }
	}
</script>
