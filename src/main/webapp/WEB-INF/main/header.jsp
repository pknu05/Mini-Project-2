<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">

            <!-- (1) 로고 -->
            <a class="navbar-brand d-flex align-items-center lh-1 me-10 transition-opacity opacity-75-hover" href="./index.html">
                <!-- 로고 아이콘 추가예정 -->
                <div class="logo">Special Day</div>
            </a>
            <!-- / 로고 -->
            
            <!-- (2) 메뉴 항목 -->
            <div class="collapse navbar-collapse justify-content-center align-items-center" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown position-static">
                        <a class="nav-link" href="${pageContext.request.contextPath}/class/select.do">조회하기</a>
                        
                        <!--  드롭다운 메뉴
                        <div class="dropdown-menu dropdown-megamenu">
                            <div class="container">
                            
                                <div class=""></div>
                            </div>
                        </div>
                       드롭다운 메뉴-->
                       
                    </li>    
                    <li class="nav-item">
                        <a class="nav-link" href="">공지사항</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">이용안내</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">FAQ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/member/mypage.do">마이페이지</a>
                    </li>
                </ul>           
                 
            </div>
            <!-- / 메뉴 항목 -->

            <!-- (3) 클래스등록&로그인 -->
            <div class="d-none d-lg-flex">
            	<c:if test="${sessionScope.id eq null}">
            		<a href="${pageContext.request.contextPath}/class/insert.do" class="btn btn-outline-success" role="button">클래스 등록</a>
                	<a href="${pageContext.request.contextPath}/member/login.do" class="btn btn-outline-secondary" role="button">로그인</a>
            	</c:if>
            	
            	<c:if test="${sessionScope.id ne null}">
            		<a href="${pageContext.request.contextPath}/class/insert.do" class="btn btn-outline-success" role="button">클래스 등록</a>
            		<a href="#" class="btn btn-outline-secondary" onclick="logoutAction()">로그아웃</a>
            	</c:if>
                
            </div>
            <!-- / 클래스등록&로그인 -->
        </div>
    </nav>
</header>

<script>
   	function logoutAction() {
   		var form = document.createElement("form");
		form.setAttribute("action", "logout.do");
		form.setAttribute("method", "post");
		form.style.display="none";
		document.body.appendChild(form);
		form.submit();	
   	}
</script>