<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row mb-2">
		<div class="col d-flex">
			<div class="d-flex">
				<div class="input-group me-3">
					<input id="keyword_map" type="search" class="form-control" placeholder="검색어를 입력하세요."
						aria-label="Text input with dropdown button" onkeyup="if(window.event.keyCode==13){searchClassActionMap()}"/>
					<button class="btn btn-primary" type="button" onclick="searchClassActionMap()">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
			<div class="d-flex me-3">
				<div class="searchhead me-3">지역</div>
				<div>
					<select class="form-select" aria-label="Default select example" onchange="getLocalcate_map(this.value)">
					<c:forEach var="obj" items="${list2}">
						<option value="${obj.code}">${obj.cate}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="d-flex me-3">
				<div class="searchhead me-3">카테고리</div>
				<div>
					<select class="form-select" aria-label="Default select example" onchange="getActcate_map(this.value)">
					<c:forEach var="obj" items="${list1}">
						<option value="${obj.code}">${obj.cate}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="d-flex">
				<div class="searchhead me-3">날짜</div>
				<div>
					<input id="classdate_map" type="search" class="form-control datepicker" placeholder="날짜를 선택하세요">
				</div>
			</div>
			<div class="ms-auto">
				<button class="btn btn-outline-success" onclick="searchClassActionMap()"><i class="bi bi-search me-2"></i>검색</button>
				<a href="select.do?search=list">
					<button class="btn btn-outline-success"><i class="bi bi-card-list me-2"></i>목록 보기</button>
				</a>
			</div>
		</div>
	</div>

	<hr class="divider">
</div>
<div class="container-fluid">
	<div class="row mb-3">
		<div id = "classlist_map" class="col-3" style="height:750px; overflow-y: scroll;">
			<!-- 동적 생성 -->
		
 			<%-- <c:forEach var="obj" items="${list3}">
 				<a href="product.do?classcode=${obj.classcode}">
  			
  				<div class="card shadow-sm mb-3">
  					<c:if test="${obj.imageNo eq 0}">
  						<img src="${pageContext.request.contextPath}/resources/assets/default.png" width="100%" height="225" focusable="false">
  					</c:if>
  					<c:if test="${obj.imageNo ne 0}">
  						<img src="${pageContext.request.contextPath}/item/image?no=${obj.imageNo}" width="100%" height="225" focusable="false">
  					</c:if>
                           <div class="card-body">
                           	<h4 class="card-text text-center">${obj.title}</h4>
                               <div>${obj.content}</div>
                               <p class="card-text">가격 : ${obj.price}</p>
                               <p class="card-text">주소 : ${obj.address1}</p>
                               <div class="d-flex justify-content-between align-items-center">
                                   <div>
                                       <button class="btn btn-sm btn-outline-secondary">상세 조회</button>
                                       <c:if test = "${sessionScope.UID ne null}">
                                       	<button class="btn btn-sm btn-outline-primary" onclick="modalOrder('${obj.no}', '${obj.price}', '${obj.imageNo}' )">물품 주문</button>
                                  		</c:if>
                                   </div>
                               </div>
                           </div>
  				</div>
  			
  			 </a>
 			</c:forEach> --%>

	 	</div>
		<div class="col-9">
			<div id="map" style="width: 100%; height: 750px;"></div>
		</div>
	</div>
</div>
<!--axios library-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js">
</script>
<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- kakao map library -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4847ab83c2fe2a7607fbdad0614a758b"></script>
<script>
	var citycode_map = 0;
	var activitycode_map = 0;
	var classdate_map = null;

	var localcode_map = 0;
	var actcode_map = 0;
	var classlevel_map = 0;
	var minprice_map = 0;
	var maxprice_map = 0;
	var keyword_map = null;

	searchClassActionMap();
	
	function getLocalcate_map(code) {
		
		if(code==1) {
			citycode_map = 0;
		}
		else {
			citycode_map = code;
		}
	}
	
	function getActcate_map(code) {
			
		if(code==1) {
			activitycode_map = 0;
		}
		else {
			activitycode_map = code;
		}
	}
	
async function searchClassActionMap() {
		
		if($('#classdate_map').val().length !== 0) {
			classdate_map = $("#classdate_map").val();
		}
		else {
			classdate_map = null;
		}
		if($('#keyword_map').val().length !== 0) {
			keyword_map = $('#keyword_map').val();
		}
		else {
			keyword_map = null;
		}
		
		const url = "${pageContext.request.contextPath}/api/class/selectclasslist.json";
		const headers = {"Content-Type":"application/json"};
		
		const {data} = await axios.get(url, 
				{ params: 
				{ 
					citycode : citycode_map, activitycode : activitycode_map,
					localcode : localcode_map, actcode : actcode_map,
					classlevel : classlevel_map, classdate : classdate_map,
					minprice : minprice_map, maxprice : maxprice_map, keyword : keyword_map
				} 
				}, 
				{headers});
		console.log(data);
		
		const classlist_map = $('#classlist_map')[0];
		classlist_map.innerHTML = '';
		for(let obj of data.list) {
			classlist_map.innerHTML +=
				'<div class="col mb-3">' +
					'<div class="card shadow-sm">' + 
						'<div class="card-header text-center">' + obj.title + '</div>' +
						'<div class="card-body">' +
							'<p class="card-text"> 날짜 : ' + obj.classdate + '</p>' +
							'<p class="card-text"> 가격(1인) : ' + obj.price + '원' + '</p>' +
							'<p class="card-text"> 주소 : ' + obj.address1 + " " + obj.address2 + " " + obj.address3 + '</p>' +
							'<div class="d-flex justify-content-between align-items-center">' + 
								'<div>' +
									'<button class="btn btn-sm btn-outline-success">' + '<a href="product.do?classcode=' 
											+ obj.classcode + '" class="nav-link">' + '상세 정보 조회' + '</a>' + '</button>' +
								'<div>' +
							'</div>' +
						'</div>'
					'</div>'
				'</div>';
		}
	}
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.180182599322045, 129.07538647683208), // 위도, 경도
		level : 8
	// 지도의 레벨
	};
	// 지도 생성 함수
	var map = new kakao.maps.Map(container, options);

	/* 마커 생성 */
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker1 = new kakao.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker1.setMap(map);
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '해운대', 
	        latlng: new kakao.maps.LatLng(35.15883991156001, 129.15806348324026)
	    },
	    {
	        title: '광안리', 
	        latlng: new kakao.maps.LatLng(35.15265316306549, 129.1164692011284)
	    },
	    {
	        title: '부산시민공원', 
	        latlng: new kakao.maps.LatLng(35.16837731809186, 129.05743946619899)
	    },
	    {
	        title: '오륙도',
	        latlng: new kakao.maps.LatLng(35.11478574223503, 129.12167452064705)
	    },
	    {
	        title: '수변공원',
	        latlng: new kakao.maps.LatLng(35.15736441845954, 129.13147040804157)
	    }
	];
	
	var contents = [
		{
			content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원1' + 
            '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>'
		},
		{
			content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원2' + 
            '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>'
		},
		{
			content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원3' + 
            '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>'
		},
		{
			content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원4' + 
            '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>'
		},
		{
			content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원5' + 
            '            <div class="close" onclick="closeOverlay(this)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>'
		},
	] 
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
	 	// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		
	    // 마커 위에 커스텀오버레이를 표시합니다
	    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	    var overlay = new kakao.maps.CustomOverlay({
	        content: contents[i].content,
	        map: map,
	        position: marker.getPosition()       
	    });

	 	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        overlay.setMap(map);
	    });
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	    function closeOverlay(e) {
	        overlay.setMap(null);     
	    }
	}
	
	
	
	            
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker1.setPosition(latlng);
	    
	    console.log(latlng.getLat());
		console.log(latlng.getLng());
	});
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
</script>