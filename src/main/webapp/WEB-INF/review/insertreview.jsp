<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Review</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Permanent+Marker&display=swap"
	rel="stylesheet">
<!-- sources -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review.css" />
<!-- quill -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet" />
</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="container">
		<div
			style="width: 1000px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<div>
				<h3>리뷰작성</h3>
				<span class="h3span">여러분들의 수강 후기를 들려주세요.</span>
			</div>
			<hr />
			<div class="row">
				<div class="col-sm">
				<form action="${pageContext.request.contextPath}/review/insertreview.do" 
						class="mb-3" name="myform" id="myform" method="post">
						<input type="number" name ="no"  style= " width: 50px; margin-bottom:5px"/>
					<div class="form-floating mb-2">
						<input type="text" id="title" name="title" class="form-control" placeholder="제목"
							autofocus required />
					</div>
					<div style="margin-bottom: 10px;">
						<div id="editor" style="height: 300px;"></div>
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
									name="reviewStar" value="5" id="rate1"><label
									for="rate1">★</label> <input type="radio" name="reviewStar"
									value="4" id="rate2"><label for="rate2">★</label> <input
									type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label> <input type="radio" name="reviewStar"
									value="2" id="rate4"><label for="rate4">★</label> <input
									type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
						<hr />
					</div>				
					<div class="twobutton" style="float: right;">
						<a href="${pageContext.request.contextPath}/review/home.do" class="btn btn-primary" >홈으로</a>
							<input class="btn btn-primary" type="button" value="등록하기" onclick="writeReview()" />
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

	<!-- Initialize Quill editor -->
	<script>
		const toolbarOptions = [ [ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
		[ 'blockquote', 'code-block' ], [ {
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
		} ], // text direction[ {'size' : [ 'small', false, 'large', 'huge' ]} ], // custom dropdown
		[ {
			'header' : [ 1, 2, 3, 4, 5, 6, false ]
		} ], [ {
			'color' : []
		}, {
			'background' : []
		} ], // dropdown with defaults from theme
		[ {
			'font' : []
		} ], [ {
			'align' : []
		} ], ];
		// 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbarOptions 값으로 대체하고 테마를 snow로 해서 변경
		const quill = new Quill('#editor', {
			modules : {
				toolbar : toolbarOptions
			},
			theme : 'snow'
		});
	</script>


	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>


<script>
	function cancellReview() {
		
	}
</script>


  
<script>
	function writeReview() {
		const content = quill.root.innerHTML;
		const form1 = document.getElementById("myform");
		
		var input1 = document.createElement("input");
		input1.type = "text";
		input1.name = "content";
		input1.value = content;
		form1.appendChild(input1);
			
		form1.submit();
	}
</script>


</html>