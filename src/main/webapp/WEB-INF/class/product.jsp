<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>클래스 상세 정보</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap"
	rel="stylesheet">
<!-- sources -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<!-- 부트스트랩 아이콘  CDN-->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<hr />
	<div class="container mb-5" id="container_main">
		<div class="row mt-5 mb-5 d-flex flex-nowrap">
			<div class="row col-6 mx-1 " id="main_image" style="height: 600px;">
				<div >
				<img class="images mt-3 mx-1" src="${pageContext.request.contextPath}/resources/images/design.jpg" >
				</div>
					<div class= "mt-3 d-flex flex-row justify-content-between" style=" width:600px;  height: 150px;">
						<div class="images2">
						<img class="images1 mt-2 " src="${pageContext.request.contextPath}/resources/images/design.jpg" >
						</div >
						<div class="images2">
						<img class="images1 mt-2 " src="${pageContext.request.contextPath}/resources/images/design.jpg" >
						</div>
						<div class="images2">
						<img class="images1 mt-2 " src="${pageContext.request.contextPath}/resources/images/design.jpg" >
						</div>	
						</div>
			</div>
			<div class="col-5 mt-3 mx-3" id="calendar"  >
			<div class="row">
			<div class="mt-3">
				<!-- <button type="button" class="btn btn-primary float-end mx-1" data-bs-toggle="modal"
						data-bs-target="#exampleModal">신청하기</button> -->
					
				</div>
				<div style="height: 240px; text-align: center;"> 달력</div></div>
				<hr />
				<div id="scroll">
					<table class="table table-hover" id="table1">
						<thead>
							<tr>
								<th scope="col">날짜</th>
								<th scope="col">현재인원</th>
								<th scope="col">최소인원</th>
								<th scope="col">최대인원</th>
								<th scope="col">시작</th>
								<th scope="col">종료</th>
								<th scope="col">난이도</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="obj" items="${list1}">
								<tr onclick="modalAction(${obj.no}, ${obj.maximum}, ${obj.cnt}, '${obj.classdate}', 
								'${obj.classstart}', '${obj.classend}', ${obj.discount}, ${obj.addprice}, ${obj.totalprice})">
									<td>${obj.classdate}</td>
									<td>${obj.cnt}명</td>
									<td>${obj.minimum}명</td>
									<td>${obj.maximum}명</td>
									<td>${obj.classstart}</td>
									<td>${obj.classend}</td>
									<td>${obj.classlevel}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<hr/>

		<!-- 클래스 소개 -->
		<div class=" mt-3" style=" height: 400px;">
			<h5 class="mt-5 mx-1">클래스 소개</h5>

			<div class="row d-flex flex-nowrap">
				<div class="col-8 mx-1">
					<div style="width: 500px; height: 50px; margin-left: 10px; margin-bottom : 5px;">
						<h6>■ 제목 : ${product.title}</h6>
					</div>
					<div style="width: 700px; height: 250px; margin-left: 10px;">
						<h6>■ 소개글 : ${product.intro}</h6>
					</div>
				</div>
				<div class="col-4 " style="position: relative; top: -20px; left: -20px;">
					<div style="width: 600px; margin-right: 100px;">
						<h6><i class="bi bi-universal-access mx-1"></i>
						난이도 :</h6>
					</div>
					<div style="width: 600px; margin-right: 100px;">
						<h6><i class="bi bi-clock mx-1"></i>
						시간 :</h6>
					</div>
					
					<div style="width: 600px; margin-right: 100px;">
						<h6><i class="bi bi-cash-coin mx-1"></i>
						가격 :</h6>
					</div>
					
					<div style="width: 600px; height: 100px; margin-right: 100px;">
						<h6> <i class="bi bi-geo-alt-fill mx-1"></i>
						주소 : ${product.address1} ${product.address2} ${product.address3}</h6>  
					</div>
					<div style="width: 600px; height: 50px; margin-right: 100px;">
						<h6> <i class="bi bi-calendar3-event mx-1"></i>
						등록날짜 :</h6>
					</div>
				</div>
	
			</div>
		</div>
		<hr/>

		<!-- 커리큘럼 -->
		<div class="col mt-1 " style = "height: 400px;">
			<h5 class="mt-5 mx-1">커리큘럼</h5>
			<h6 class="mx-1">Step1. ${product.curriculum}</h6>
		</div>
		
		<hr/>
		<div class="row d-flex flex-nowrap">
		<div class="col-6 mx-1 mt-1 mb-2 " style="height: 500px;">
			<h5 class="mt-1 mb-4" >위치</h5>
			<h6> <i class="bi bi-geo-alt-fill mx-1"></i>
			주소 : ${product.address1} ${product.address2} ${product.address3}</h6>
			<div class="mt-1 mx-1" id="map" style="weight:540px; height:300px; border: 1px solid; #cccccc;"></div>
			<div class="mt-1" style="width: 550px; height: 100px;">
			<h6 class="mt-3 mx-1" id="rode">
			<i class="bi bi-car-front-fill"></i>
			찾아오는길</h6>
			<h6 class="mb-3"> 망원역 2번 출구에서239m </h6>
			</div>
		</div>
		<div style="width:10px; height: 480px; border-left: 1px solid lightgray;"></div>
		<div class="col-5 mt-1 mb-2 " style= "height: 500px;">
			<h5 class="mt-1" >리뷰테이블</h5>
			<div class= "table_class">
			<table class="table table-hover" id="table2">
			<thead>
				<tr >
					<th scope="col">신청번호</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
					<th scope="col">평점</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${list}">
					<tr>
						<td scope="row">${obj.no}</td>
						<td><a href="#">${obj.title}</a></td>
						<td>${obj.content}</td>
						<td>${obj.rating}</td>
						<td>${obj.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<div class="row justify-content-center">
			<div class="col-4">
				<ul id="pagination-demo" class="pagination"></ul>
			</div>
		</div>
		</div>
		</div>
		</div>
	</div>
	
<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>


<!-- Modal -->
<form action="${pageContext.request.contextPath}/apply/insert.do" method="get">
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title " id="exampleModalLabel">세션정보</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					
					<h6 class="mt-3">최대인원 : <input id="modal_max" name="maximum" type="text"> </h6>
					<h6>현재 신청 인원 : <input id="modal_cnt" name="cnt" type="text"> </h6>
					<h6>신청 가능 인원 : <input id="modal_pre" type="text"> </h6>
					<hr/>
					<h6 class="mt-3">날짜 : <input id="modal_date" type="text"></h6>
					<h6> 시작 시간 : <input id="modal_start" type="text"> </h6>
					<h6> 종료 시간 : <input id="modal_end" type="text"> </h6>
					<hr/>
					<h6 class="mt-3" >할인 : <input id="modal_dc" type="text"> </h6>
					<h6>추가금액 : <input id="modal_ap" type="text"> </h6>
			
					<h4 class="float-end price">총 금액 : <input id="modal_total" name="totalprice" type="text"> </h4>
					
					<input type="text" name="sessionno" id="modal_no">
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-warning">신청하기</button>
				</div>
			</div>
		</div>
	</div>
</form>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5f1e914e5a27b778530448bed230f5e"></script>
	<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(${product.latitude}, ${product.longitude}), // 지도의 중심 위치, 경도
		level: 6 //지도의 레벨
	};
	
	// 실제로 맵이 생성되는 시점
	var map = new kakao.maps.Map(container, options);
	// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    // 클릭한 위치에 마커를 표시합니다 
	    addMarker(mouseEvent.latLng);             
	});

	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];

	// 마커 하나를 지도위에 표시합니다 
	addMarker(new kakao.maps.LatLng(33.450701, 126.570667));

	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: position
	    });

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}
	
	function modalAction() {
		console.log(1)
	
	}
	
function modalAction(no, max, cnt, date, start, end, discount, addprice, total) {
		
		/* console.log(no);
		console.log(total); */
		
		console.log(date);
		
		const max1 = document.getElementById("modal_max");
		const cnt1 = document.getElementById("modal_cnt");
		const pre1 = document.getElementById("modal_pre");
		const date1 = document.getElementById("modal_date");
		const start1 = document.getElementById("modal_start");
		const end1 = document.getElementById("modal_end");
		const dc1 = document.getElementById("modal_dc");
		const ap1 = document.getElementById("modal_ap");
		const total1 = document.getElementById("modal_total");
		const no1 = document.getElementById("modal_no");
		
		console.log(max1);
		
		max1.value = max;
		cnt1.value = cnt;
		modal_pre.value = max-cnt;
		modal_date.value = date;
		modal_start.value = start;
		modal_end.value = end;
		dc1.value = discount;
		ap1.value = addprice;
		total1.value = total;
		no1.value = no;
		
		
		/* var form = document.createElement("form");
				form.setAttribute("action", "product.do");
				form.setAttribute("method", "post");
				form.style.display="block";
		
		var input = document.createElement("input");
				input.setAttribute("type", "hidden");
				input.setAttribute("name", "sessionno");
				input.setAttribute("value", Number(no));
				
				document.body.appendChild(form);
				form.appendChild(input);
				form.submit(); */
		// rest 로 번호 => 값받기
		// const {data} = await ();
				
		const modal = new bootstrap.Modal(document.getElementById("exampleModal"),{});
		modal.show();
		
		
	}
	</script>

</body>

</html>

