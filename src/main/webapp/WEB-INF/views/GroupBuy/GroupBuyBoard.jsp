<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 게시판</title>
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
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->

	<section class="featured spad">
		<div class="text-center">
			<h2>공동구매 게시판</h2>
		</div>
		<div class="container">
			<div class="row font-weight-bold text-center">
				<div class="col-1">
					
				</div>
				<div class="col-4">
					
				</div>
				<div class="col-5">
					
				</div>
				<div class="col-2">
					<a class="cafeStateMod-blue-btn text-white" href="gbBoardWrite_form">게시글 작성</a>
				</div>
			</div>
			<div class="row font-weight-bold text-center">
				<div class="col-1">
					<span></span>
				</div>
				<div class="col-4">
					<span>기간</span>
				</div>
				<div class="col-5">
					<span>제목</span>
				</div>
				<div class="col-2">
					<span>작성자</span>
				</div>
			</div>
			<c:forEach items="${groupBuyList}" var="board" varStatus="num">
				<div class="row text-center" style="border: 1px solid black; margin-top: 2px;">
					<div class="col-1">
						<span>${fn:length(groupBuyList) - num.index}</span>
					</div>
					<div class="col-4">
						<span>${board.gbsdate} ~ ${board.gbfdate}</span>
					</div>
					<div class="col-5">
						<span><a href="groupBuyBoardView?gbcode=${board.gbcode}">${board.gbtitle}</a></span>
					</div>
					<div class="col-2">
						<span>${board.gbmid}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer" style="margin-top: 200px;">
		<%@ include file="../includes/FooterBar.jsp"%>
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