<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Home</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/main.css">
</head>

<body>
	<!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <div>
         <!-- 슬라이드쇼 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/resources/images/painting.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/cooking.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/design.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
         <!-- / 슬라이드쇼 -->

        <!-- 카테고리-->
        <div id="category" class="bg-success py-10">
            <div class="container">
                <div class="row g-5">

                    <!-- Post-->
                    <div class="col-12 col-sm-6 col-lg-4 post">
                        <div class="d-flex h-100 bg-white rounded card overflow-hidden shadow-lg position-relative hover-lift">
                            <picture>
                                <img class="img-fluid" src="" alt="">
                            </picture>
                        </div>
                    </div>
                    <!-- / Post-->
                    <!-- Post-->
                    <div class="col-12 col-sm-6 col-lg-4 post">
                        <div
                            class="d-flex h-100 bg-white rounded card overflow-hidden shadow-lg position-relative hover-lift">
                            <picture>
                                <img class="img-fluid" src="" alt="">
                            </picture>

                            <div class="card-body p-4 p-lg-5">
                                <p class="card-title fw-medium mb-4"></p>
                                <a href="#"></a>
                            </div>
                        </div>
                    </div>
                    <!-- / Post-->
                    <!-- Post-->
                    <div class="col-12 col-sm-6 col-lg-4 post">
                        <div
                            class="d-flex h-100 bg-white rounded card overflow-hidden shadow-lg position-relative hover-lift">
                            <picture>
                                <img class="img-fluid" src="" alt="">
                            </picture>

                            <div class="card-body p-4 p-lg-5">
                                <p class="card-title fw-medium mb-4"></p>
                                <a href="#"></a>
                            </div>
                        </div>
                    </div>
                    <!-- / Post-->

                </div>

                
            </div>
        </div>
        <!-- / 카테고리-->
    </div>
    
    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>