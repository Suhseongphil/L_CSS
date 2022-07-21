<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 글작성</title>
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
	<!-- Page Preloder -->
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

	<section class="featured spad">
		<div class="text-center">
			<h2>게시글 작성</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-4" id="pdtype">
					<span>상품</span>
				</div>
				<div class="col-8" id="pdname"></div>
			</div>
			<form action="">
				<div>
					<span>제목</span>
					<input type="text" name="gbtitle" placeholder="제목을 입력해주세요...">
				</div>
				<div>
					<span>내용</span>
					<textarea name="gbcomment" placeholder="내용을 입력해주세요..."></textarea>
				</div>
			</form>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<h2>L&CSS</h2>
						</div>
						<ul>
							<li>회사주소: 인천일보아카데미</li>
							<li>전화번호: 032-111-1111</li>
							<li>이메일 : #</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>프로젝트</h6>
						<ul>
							<li>
								<a href="#">팀장 : 서성필</a>
							</li>
							<li>
								<a href="#">엔지니어 : 송영오</a>
							</li>
							<li>
								<a href="#">엔지니어 : 천호태</a>
							</li>
							<li>
								<a href="#">엔지니어 : 이상윤</a>
							</li>

						</ul>

					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<a href="InquirePage">고객문의</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright"></div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>
</body>
<script type="text/javascript">
	var checkMsg = '${msg}'
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
</html>