<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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


<style type="text/css">
.imgZ {
	width: 250px;
	height: 250px;
}

.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: saddlebrown;
}

.product__discount__item__text span {
	color: black;
}
</style>


</head>

<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>

	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 50px; margin-left: auto; margin-right: auto;">
				<h3>공동구매 게시판</h3>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row product__discount__item__text" style="background-color: #ffffff; margin-top: 2px;">
			<div class="col-12">
				<a class="btn text-white" href="gbBoardWrite_form" style="background-color: black; margin-left: 85%; margin-bottom: 20px;">게시글 작성</a>
			</div>
			<c:forEach items="${groupBuyList}" var="board" varStatus="num">
				<div class="col-lg-4 col-md-4" style="background-color: #f8f9fa; padding: 20px; border:2px solid white;">
					<div>
						<a href="groupBuyBoardView?gbcode=${board.gbcode}">
							<img class="imgZ" alt="" src="${board.pdimg}">
						</a>
					</div>
					<div>
						<a href="groupBuyBoardView?gbcode=${board.gbcode}">
							<span class="text-black">${board.gbsdate} ~ ${board.gbfdate}</span>
						</a>
					</div>
					<a href="groupBuyBoardView?gbcode=${board.gbcode}">
						<span>${board.pdname }</span>
					</a>
					<h5>
						<a href="groupBuyBoardView?gbcode=${board.gbcode}">
							<span style="font-weight: bold; font-size: 18px;">${board.gbtitle}</span>
						</a>
					</h5>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer class="footer" style="margin-top: 200px;">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

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