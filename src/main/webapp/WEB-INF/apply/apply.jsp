<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>클래스 신청</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
    
    <main class="container">
        <div class="py-5 text-center">
            <h2>클래스신청</h2> 
            <!-- <p class="lead">신청하실 페이지를 선택하세요.</p> -->
        </div>

         <div class="col-md-7 col-lg-8">
             <h4 class="mb-3">신청한 페이지를 골라주십오</h4>
             <form action="apply.do" method="post" id="form1">
	             <input type="text" name="memberid" /><!-- 유효성 검사때문에 넣은것 값 확인 할때 지워햐함 -->
	             <input type="text" name="session" /><!-- 유효성 검사때문에 넣은것 값 확인 할때 지워햐함 -->
	              <label for="person" class="form-label">신청 가능한 인원</label>
	              <div class="row g-3">                   
	                  <div class="col-12">                        
	                          <label for="person" class="form-label">참여인원</label> 
	                        <input type="text" name="person" class="form-control" id="person" size="15" placeholder="최대 인원은 30명 입니다."  value="" required>
	  	                   <!--   <input type="text"  class="form-control" id="person" placeholder="참여인원수 x 가격."  value="" required> -->
	  	                    <div class="invalid-feedback">Valid first name is required.</div>
	  	                    <form name='sumform'>
								<input type='text'  id='person1' max="30" min="1" placeholder="참여인원수" size="15" onkeyup='call()'> x
								<input type='text'  id='price2' placeholder="가격" size="15" onkeyup='call()'> =
								<input type='text'  placeholder="참여인원수 x 가격." size="20" id='total price' >(원)
							</form>
	                  </div>
	              </div>    
	               
	                
	                  	
				  <input type="button" value="신청완료" class="btn btn-sm btn-primary" onclick="ApplyInsertAction()"/> 
                  <a class="btn btn-sm btn-primary" href="home.do">홈화면으로</a>
              </form>
         </div>
    </main>
    
    <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 
	<script>
	function ApplyInsertAction(){ //함수
		/*
		const id   = document.getElementById("MemberId");
		const person   = document.getElementById("person");
		const sessionno  = document.getElementById("sessionno");
		
		if( id.value <= 0 ){
			alert('모두 입력하였는지 확인 부탁드립니다.');
			id.focus();
			return false; // 함수 종료, 전송하지 않음
		}
		*/
	
		document.getElementById('form1').submit();
	}
	
	function call()
	{
	 if(document.getElementById("person1").value && document.getElementById("price2").value){
	  document.getElementById('total price').value =parseInt(document.getElementById('person1').value) * parseInt(document.getElementById('price2').value);
	 }
	}
	</script>
</body>
</html>