<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내카페 등록 페이지</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
</head>


<body>

<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>

	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/AdminMiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<form action="createCafeInfo" enctype="multipart/form-data">

				<div class="row cafeInsert">

					<div class="row">

						<div class="col-2">
							<span class="font-weight-bold">카페이름</span>

							<br>
							<input type="text" id="cfname" name="cfname" placeholder="카페 이름">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">주소</span>
							<br>
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<br>
							<input type="text" id="sample6_postcode" name="cfPostCode" placeholder="우편번호">
							<input type="text" id="sample6_address" name="cfAddr" placeholder="주소">
							<br>
							<input type="text" id="sample6_detailAddress" name="cfDetailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="cfExtraAddress" placeholder="참고항목">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">카페 전화번호</span>
							<br>
							<input type="text" id="cftel" name="cftel" placeholder="전화번호 - 포함">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">카페링크</span>
							<br>
							<input type="text" id="cflink" name="cflink">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">카페 이미지</span>
							<br>
							<input type="file" id="cfimgs" name="cfimgs" multiple="multiple">
							<br><br>
							<span class="font-weight-bold">시그니처 이미지</span>
							<br>
							<input type="file" id="cfsigimgs" name="cfsigimgs">
						</div>
						<div class="col-2">
							<button class="cafeInsert-btn" type="button" id="cafeSend">카페추가</button>
						</div>
					</div>


				</div>
			</form>
		</div>
	</section>



</body>
</html>