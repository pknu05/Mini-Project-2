<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl - format 만들때 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
   <form action="deletepurchase.do" method="post" id="form4">
      <table class="table mt-2">
             <thead style="background-color: lightgray;">
                     <tr>
                        <th>클래스 제목</th>
                        <th>클래스 참여일자</th>
                        <th>클래스 시작시간</th>
                        <th>클래스 종료시간</th>
                        <th>신청 날짜</th>
                        <th>참여 신청 인원</th>
                        <th>총 결제 금액</th>
                        <th>신청 상태</th>
                     </tr>
               </thead>
               <tbody>
                     <c:forEach var="obj" items="${applylist}">
                           <tr>
                            <th><input type="checkbox" name="chk[]" value="${obj.no}"> ${obj.title}</th>
                            <td>${obj.classdate}</td>
                            <td>${obj.classstart}</td>
                            <td>${obj.classend}</td>
                            <td><fmt:formatDate value="${obj.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                            <td>${obj.person}명</td>
                            <td><fmt:formatNumber value="${obj.payment}" pattern="#,###"/></td>
                            <c:if test="${obj.chk == 1}">
					     		<td>결제완료</td>
					     	</c:if>
					     	<c:if test="${obj.chk == 2}">
					     		<td>결제취소</td>
					     	</c:if>
					     	<c:if test="${obj.chk == 3}">
					     		<td>참여완료</td>
					     	</c:if>
                         </tr>
                     </c:forEach>
                </tbody>
      </table>
      <input type="button" class="btn btn-sm btn-primary" value="주문취소" onclick="deletePurchaseAction()" />
   </form>
</div>

<script>
   function deletePurchaseAction() {
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
               document.getElementById("form4").submit();
            }
         }
         else {
            alert('항목을 체크하세요.');
            return false;
         }
      }
   }
</script>