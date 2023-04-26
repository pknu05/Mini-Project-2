<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>클래스 등록 페이지</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/menumain.css">

</head>
<style>
.main {
	height: 100%;
	display: flex;
}
</style>

<body>
	<!-- Header 영역 -->
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- main 영역 -->
	
		<div class="main col-10">
			<div class="left col-3 m-5">
				<button class="btn btn-outline-success m-3" onclick="pagecate()">카테고리</button>
				<br />
				<button class="btn btn-outline-success m-3"
					onclick="pageinstructor()">강사소개</button>
				<br />
				<button class="btn btn-outline-success m-3" onclick="pageintro()">클래스소개</button>
				<br />
				<button class="btn btn-outline-success m-3" onclick="pagecorri()">커리큘럼</button>
				<br />
				<button class="btn btn-outline-success m-3" onclick="pageprice()">가격</button>
				<br />
			</div>

			<div class="right col-9 m-5">
				<!-- 메뉴 1 -->
				<div id="menu1" style="display: block;">
					<div class="m_1 mt-6">
						<div class="row">
							<div class="col-4 p-3">
								<label for="cate1">지역</label> <select id="cate1"
									class="form-select" onchange="getLocalcate(this.value)">
									<option value="">지역을 선택하세요</option>
									<c:forEach var="obj" items="${list}">
										<c:if test="${obj.code ne 1}">
											<option value="${obj.code}">${obj.cate}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-4 p-3">
								<label for="cate2">세부 지역</label> <select id="localselect"
									class="form-select" onchange="setLocalcate(this.value)">
									<option value="">세부 지역을 선택하세요</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-4 p-3">
								<label for="cate3">종류</label> <select id="cate3"
									class="form-select" onchange="getActivitycate(this.value)">
									<option value="">종류를 선택하세요</option>
									<c:forEach var="obj" items="${list1}">
										<c:if test="${obj.code ne 1}">
											<option value="${obj.code}">${obj.cate}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-4 p-3">
								<label for="cate4">세부 종류</label> <select id="actdetailselect"
									class="form-select" onchange="setActcate(this.value)">
									<option value="">세부 종류를 선택하세요</option>
								</select>
							</div>
						</div>
						<br />

						<div class="post">
							<section>
								<input type="text" class="mb-3" id="sample6_postcode"
									placeholder="우편번호" name="postcode"> <input
									type="button" class="btn btn-sm btn-primary m-2"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소"
									name="address"><br>
								<br> <input type="text" id="sample6_detailAddress"
									placeholder="상세주소" name="detailaddress"> <input
									type="text" id="sample6_extraAddress" placeholder="참고항목"
									name="extraAddress">
							</section>
						</div>

						<div class="changepage">
							<div class="btn_1">
								<button class="btn_after btn" onclick="nextMenu1()">다음&raquo;</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 메뉴2 -->
				<div id="menu2" style="display: none;">
					<div class="m2">
						<section>
							<p>프로필 이미지</p>
							<div id="input-image" class="mb-3 col-4">
								<img id="insert-img"
									src="${pageContext.request.contextPath}/resources/image/default.png"
									style="width: 200px; height: 150px; curosr: pointer;"
									class="mb-3" onclick="clickItemImage()" /> <input type="file"
									name="file" id="file" class="form-control"
									onchange="changeItemImage(this)">
							</div>

							<div>
								<input type="button" value="등록" class="btn_image"
									onclick="insertItemImage()" />
							</div>
						</section>
						<br>
						<br>

						<section>
							<p>상호명 및 닉네임(필수)</p>
							<p>
								<input type="text" id="name" name="name" maxlength="50"
									autofocus required>
							</p>
						</section>
						<br>
						<br>

						<section>
							<p>강사 소개 (필수)</p>
							<!-- Create the editor container -->
							<div style="margin-bottom: 5px; background-color: white;">
								<div id="editor" style="height: 300px;">
									<p>자신의 경험,경력을 소개해주세요.</p>
								</div>
							</div>
						</section>
						<br>

						<section>
							<div class="sns">
								<p class="sns_2">SNS 링크 (선택)</p>
								<!-- 가이드 라인 작성 -->
								<div class="tool">
									<span> <img id="insert-img"
										src="${pageContext.request.contextPath}/resources/image/물음표.png"
										style="width: 20px; height: 20px; curosr: pointer;"> 도움말
									</span>
									<div class="tooltip-content">
										<p>• 강사님의 SNS 링크를 작성해 주세요.</p>
										<p>• 클래스 홍보와 정보제공에 도움이 됩니다.</p>
									</div>
								</div>
							</div>

							<input placeholder="https://instagram.com/sample" type="text"
								class="link" style="width: 350px; height: 35px;"><br>
							<input placeholder="https://blog.com/sample" type="text"
								class="link" style="width: 350px; height: 35px;">
						</section>

						<div class="changepage">
							<div class="btn_1">
								<button class="btn_before btn" onclick="prevMenu2()">&laquo;이전</button>
								<button class="btn_after btn" onclick="nextMenu2()">다음&raquo;</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 메뉴3 -->
				<div id="menu3" style="display: none;">
					<div class="m_3">
						<section>
							<p>클래스 제목(필수)</p>
							<p>
								<input type="text" id="title" name="title" maxlength="50"
									autofocus required>
							</p>
						</section>
						<br>
						<br>

						<section>
							<p>클래스 소개글(필수)</p>
							<!-- Create the editor container -->
							<div style="margin-bottom: 5px; background-color: white;">
								<div id="editor2" style="height: 300px;">
									<p>클래스를 소개해주세요.</p>

								</div>
							</div>
						</section>

						<div class="changepage">
							<div class="btn_1">
								<button class="btn_before btn" onclick="prevMenu3()">&laquo;이전</button>
								<button class="btn_after btn" onclick="nextMenu3()">다음&raquo;</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 메뉴4 -->
				<div id="menu4" style="display: none;">
					<div class="m_4">
						<section>
							<p>커리큘럼 내용(필수)</p>
							<!-- Create the editor container -->
							<div style="margin-bottom: 5px; background-color: white;">
								<div id="editor3" style="height: 300px;">
									<p>
										커리큘럼을 최소 2단계 이상 소개해주세요.<br />예시)<br />STEP1. 수업 소개<br />STEP2.
										수업 내용<br />STEP3. 수업 마무리
									</p>
									<br>
								</div>
							</div>
						</section>

						<div class="changepage">
							<div class="btn_1">
								<button class="btn_before btn" onclick="prevMenu4()">&laquo;이전</button>
								<button class="btn_after btn" onclick="nextMenu4()">다음&raquo;</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 메뉴5 -->
				<div id="menu5" style="display: none;">
					<div class="col-10" style="margin-top:50px;">
						<div class="won_1">
							<h5 style="display:inline; padding-right:50px;">가격</h5>
							<div class="tool">
								<span> <img id="insert-img"
									src="${pageContext.request.contextPath}/resources/image/물음표.png"
									style="width: 20px; height: 20px; curosr: pointer;"> 도움말
								</span>
								<div class="tooltip-content">
									<p>• 입문자를 기준으로 초기값을 입력하세요.</p>
									<p>• 이후 추가금액 설정이 가능합니다.</p>
								</div>
							</div><br><br>
							
							<input id="price" name="price" type="text"
								placeholder="금액을 입력하세요" maxlength="10" onkeyup="addCommas(this)"
								autofocus> <span
								style="font-size: 20px; margin-left: 2px;">원</span>
						</div>
					</div>

					<div class="changepage">
						<div class="btn_1">
							<button class="btn_before btn" onclick="prevMenu5()">&laquo;
								이전</button>
							<button class="btn_after btn" onclick="insertClass()">등록</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- Footer 영역 -->
		<jsp:include page="../footer.jsp"></jsp:include>


		<!--axios library-->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
		<!--jQuery-->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<!-- daum post bundle -->
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- Include the Quill library -->
		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>


		<script>
/* postcode */
	function sample6_execDaumPostcode() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress")
				.focus();
			}
		}).open();
	}

 	function nextMenu1() {
		//const memberid = document.getElementById("id");
		
		const postcode = document.getElementById("sample6_postcode");
		const detailAddress = document.getElementById("sample6_detailAddress");
		
		// 1. 유효성 검사
		
		if ( postcode.value.length <= 0 ) {
			alert('우편번호를 입력하세요.');
			return false;
		}
		if ( detailAddress.value.length <= 0 ) {
			alert('상세주소를 입력하세요.');
			return false;
		}
		
		// 2. 전송
		document.getElementById("form5_update").submit();
	} 

	// 지역 카테고리 함수
	async function getLocalcate(code){
		console.log(code);

		if( code==1 || code=="" ){
			$('#localselect').children('option').remove();
			$('#localselect').append('<option>전체</option>');
		}
		else{
			const url =  '${pageContext.request.contextPath}/api/class/selectcatelist.json?refcode='+code+'&chk=local';
			const headers =  {"Content-Type":"application/json"};
			
			const{data} = await axios.get(url, {headers});
			
			$('#localselect').children('option').remove();
			
			$('#localselect').append('<option>세부 지역을 선택하세요</option>');
			
			var options = "";
			for(let obj of data.list){
				console.log(obj.code);
				if(obj.code%100 != 1) {
					options += "<option value=" + obj.code + ">" + obj.localcate + "</option>";
				}
			}
			$('#localselect').append(options);
		}
		
	}
	
	function setLocalcate(code) {
		console.log(code);
		code = document.getElementById("localselect").value;
	} 
	
	// 종류 카테고리 함수
	async function getActivitycate(code){
		console.log(code);
		
		if( code==1 || code==""){
			$('#actdetailselect').children('option').remove();
			$('#actdetailselect').append('<option>전체</option>');
		}
		else{
			const url =  '${pageContext.request.contextPath}/api/class/selectcatelist.json?refcode='+code+'&chk=act';
			const headers =  {"Content-Type":"application/json"};
			
			const{data} = await axios.get(url, {headers});
			
			$('#actdetailselect').children('option').remove();
			
			var options = "";
			for(let obj of data.list1){
				console.log(obj.code);
				if(obj.code%100 != 1){
					options += "<option value=" + obj.code + ">" + obj.actcate + "</option>";
				}
			}
			$('#actdetailselect').append(options);
		}
	}
	
	function setActcate(code) {
		console.log(code);
		code = document.getElementById("actdetailselect").value;
	} 
	
/* 강사소개 Quill */
	var toolbarOptions = [ [ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
	[ 'blockquote', 'code-block' ],

	[ {
		'header' : 1
	}, {
		'header' : 2
	} ], // custom button values
	[ {
		'list' : 'ordered'
	}, {
		'list' : 'bullet'
	} ], [ {
		'script' : 'sub'
	}, {
		'script' : 'super'
	} ], // superscript/subscript
	[ {
		'indent' : '-1'
	}, {
		'indent' : '+1'
	} ], // outdent/indent
	[ {
		'direction' : 'rtl'
	} ], // text direction

	[ {
		'size' : [ 'small', false, 'large', 'huge' ]
	} ], // custom dropdown
	[ {
		'header' : [ 1, 2, 3, 4, 5, 6, false ]
	} ],

	[ {
		'color' : []
	}, {
		'background' : []
	} ], // dropdown with defaults from theme
	[ {
		'font' : []
	} ], [ {
		'align' : []
	} ],

	[ 'clean' ] // remove formatting button
	];

	// 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbarOptions의 값으로 대체하고 태마를 snow로 해서 변경
	const quill = new Quill('#editor', {
		modules : {
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
	
	function getEditorContent() {
    	const content = quill.root.innerHTML;  // 위쪽의 editor객체를 통해서 가져오기

    	var input2  = document.createElement("input");
    	input2.type = "text";
    	input2.name = "content";
    	input2.value = content;
    	form.appendChild(input2);
    	
    	document.body.appendChild(form);
    	form.submit();
    	
    } 
	
//클래스소개 Quill
	var toolbarOptions = [ [ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
	[ 'blockquote', 'code-block' ],

	[ {
		'header' : 1
	}, {
		'header' : 2
	} ], // custom button values
	[ {
		'list' : 'ordered'
	}, {
		'list' : 'bullet'
	} ], [ {
		'script' : 'sub'
	}, {
		'script' : 'super'
	} ], // superscript/subscript
	[ {
		'indent' : '-1'
	}, {
		'indent' : '+1'
	} ], // outdent/indent
	[ {
		'direction' : 'rtl'
	} ], // text direction

	[ {
		'size' : [ 'small', false, 'large', 'huge' ]
	} ], // custom dropdown
	[ {
		'header' : [ 1, 2, 3, 4, 5, 6, false ]
	} ],

	[ {
		'color' : []
	}, {
		'background' : []
	} ], // dropdown with defaults from theme
	[ {
		'font' : []
	} ], [ {
		'align' : []
	} ],

	[ 'clean' ] // remove formatting button
	];
	
	const quill2 = new Quill('#editor2', {
		modules : {
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
	
	function getEditorContent2() {
    	const content2 = quill2.root.innerHTML;  // 위쪽의 editor객체를 통해서 가져오기

    	var input2  = document.createElement("input");
    	input2.type = "text";
    	input2.name = "content";
    	input2.value = content2;
    	form.appendChild(input2);
    	
    	document.body.appendChild(form);
    	form.submit();
    	
    } 
	
//커리큘럼 Quill
	var toolbarOptions = [ [ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
	[ 'blockquote', 'code-block' ],

	[ {
		'header' : 1
	}, {
		'header' : 2
	} ], // custom button values
	[ {
		'list' : 'ordered'
	}, {
		'list' : 'bullet'
	} ], [ {
		'script' : 'sub'
	}, {
		'script' : 'super'
	} ], // superscript/subscript
	[ {
		'indent' : '-1'
	}, {
		'indent' : '+1'
	} ], // outdent/indent
	[ {
		'direction' : 'rtl'
	} ], // text direction

	[ {
		'size' : [ 'small', false, 'large', 'huge' ]
	} ], // custom dropdown
	[ {
		'header' : [ 1, 2, 3, 4, 5, 6, false ]
	} ],

	[ {
		'color' : []
	}, {
		'background' : []
	} ], // dropdown with defaults from theme
	[ {
		'font' : []
	} ], [ {
		'align' : []
	} ],

	[ 'clean' ] // remove formatting button
	];
	
	const quill3 = new Quill('#editor3', {
		modules : {
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
	
	function getEditorContent3() {
    	const content2 = quill3.root.innerHTML;  // 위쪽의 editor객체를 통해서 가져오기
    	
    	var form    = document.createElement("form");
    	form.action = "write.do" 
    	form.method = "post";
    	form.style.display = "none";
    	
    	var input1  = document.createElement("input");
    	input1.type = "text";
    	input1.name = "title";
    	input1.value = title2.value;
    	form.appendChild(input1);
    	
    	var input2  = document.createElement("input");
    	input2.type = "text";
    	input2.name = "content";
    	input2.value = content2;
    	form.appendChild(input2);
    	
    	var input3  = document.createElement("input");
    	input3.type = "text";
    	input3.name = "writer";
    	input3.value = writer2.value;
    	form.appendChild(input3);
    	
    	document.body.appendChild(form);
    	form.submit();
    	
    } 
	
	
	/* 이미지 함수 */
	function clickItemImage() {
		document.getElementById("file").click();
	}
	function changeItemImage(e) {
		const img = document.getElementById("insert-img");
		console.log(e.files);
		if(e.files.length > 0) {
			
			img.src= URL.createObjectURL(e.files[0]);
			
			console.log(URL.createObjectURL(e.files[0]));
		}
		else {
			// 이미지 첨부 취소 시, 이미지 제거
			img.src = '${pageContext.request.contextPath}/resources/images/default.png';
		}
	}
	
	function insertItemImage() {
		const file = document.getElementById("file").value;
		console.log(file);
		if(file === "") {
			alert("이미지 파일을 첨부하세요.");
			return false;
		}
		else {
			const form = document.getElementById("form");
			form.submit();
		}
	}
	
/* 세자리 단위 콤마입력 함수 */
	function addCommas(x) {
		console.log(x);
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$("#price:text").on("keyup", function() {
	    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
	
/* 페이지 이동 함수 */	
	function pagecate(){
		$('#menu1').css('display', 'block');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	function pageinstructor(){
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'block');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	function pageintro(){
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'block');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	function pagecorri(){
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'block');
		$('#menu5').css('display', 'none');
	}
	function pageprice(){
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'block');
	}

	
/* 다음,이전 함수 */
	function nextMenu1() {
		const cate1 = $('#cate1');
		const cate2 = $('#cate2');
		const cate3 = $('#cate3');
		const cate4 = $('#cate4');
		const postcode = document.getElementById("sample6_postcode");
		const detailAddress = document.getElementById("sample6_detailAddress");

		console.log(cate1.val());
		//console.log(cate2.val());
		
		if(cate1.val() <= 1){
			alert('지역을 선택하세요');
			cate1.focus();
			return false; 	// 함수 종료
		}
		
		if(cate2.val() === ""){
			alert('세부 지역을 선택하세요');
			$('#cate2').focus();
			return false; 	// 함수 종료
		}  //??세부지역은??

		if(cate3.val() <= 1){
			alert('종류를 선택하세요');
			cate3.focus();
			return false; 	// 함수 종료
		}
		
		if ( postcode.value.length <= 0 ) {
			alert('우편번호를 입력하세요.');
			return false;
		}
		if ( detailAddress.value.length <= 0 ) {
			alert('상세주소를 입력하세요.');
			return false;
		} 
		
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'block');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	
	function prevMenu2() {
		$('#menu1').css('display', 'block');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	
	function nextMenu2() {
		const file = document.getElementById("file");
		const name = document.getElementById("name").value;
		const content = quill.root.innerHTML;
		const content_length = quill.getLength();
		console.log(content_length);
		console.log(content);
		
		if(file.value === "") {
			alert("이미지 파일을 첨부하세요.");
			return false;
		}
		if(name.value === "") {
			alert("상호명을 작성하세요.");
			return false;
		}
		if( content_length.value < 2) {
			alert("강사소개를 작성하세요.");
			return false;
		} 
		
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'block');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	
	function prevMenu3() {
		
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'block');
		$('#menu3').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu5').css('display', 'none');
	}
	
	function nextMenu3() {
		const title = document.getElementById("title");
		const content = quill2.root.innerHTML;
		const content_length = quill2.getLength();
		
		if(title.value === "") {
			alert("클래스 제목을 작성하세요.");
			title.focus();
			return false;
		}
		if( content_length < 2) {
			alert("클래스 소개를 작성하세요.");
			content.focus();
			return false;
		} 
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'block');
		$('#menu5').css('display', 'none');
	}
	
	function prevMenu4() {
		$('#menu3').css('display', 'block');
		$('#menu4').css('display', 'none');
	}
	
	function nextMenu4() {
		const content = quill3.root.innerHTML;
		const content_length = quill3.getLength();
		
		if( content_length < 2) {
			alert("커리큘럼 내용을 작성하세요.");
			content.focus();
			return false;
		} 
		$('#menu1').css('display', 'none');
		$('#menu2').css('display', 'none');
		$('#menu3').css('display', 'none');
		$('#menu4').css('display', 'none');
		$('#menu5').css('display', 'block');
	}
	
	function prevMenu5() {
		$('#menu4').css('display', 'block');
		$('#menu5').css('display', 'none');
	}
	
 	function insertClass() {
 		
 		const title = document.getElementById("title");
 		const postcode = document.getElementById("sample6_postcode");
 		const address1 = document.getElementById("sample6_address");
 		const address2 = document.getElementById("sample6_detailAddress");
 		const address3 = document.getElementById("sample6_extraAddress");
 		const price = document.getElementById("price");
 		//const instructor = document.getElementById("instructor");
 		//const intro = document.getElementById("intro");
 		//const curriculum = document.getElementById("curriculum");
 		const localcode = document.getElementById("localcode");
 		const actcode = document.getElementById("actcode");
 		
 		console.log(title.value);
 		console.log(postcode.value);
 		console.log(address1.value);
 		console.log(address2.value);
 		console.log(address3.value);
 		console.log(price.value.replace(/[^\d]+/g, ''));
 		console.log(localcode.value);
 		console.log(actcode.value);
 		
 		if( price.value.length <= 0) {
			alert("금액을 입력하세요.");
			price.focus();
			return false;
		} 
 		
 		
 		

	}
	 

		</script>
	</form>
</body>
</html>