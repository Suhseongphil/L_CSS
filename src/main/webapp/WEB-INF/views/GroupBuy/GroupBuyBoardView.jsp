<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 글 상세보기</title>
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
.scroll {
	overflow: scroll;
	width: auto;
	height: 370px;
}

.row {
	margin-bottom: 3px;
}

.row div {
	padding: 0;
}

input {
	width: 100%;
}

.bd_none {
	border: none;
}
</style>
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
			<h2>게시글 상세보기</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="row">
						<div class="col-12">
							<img alt="" src="${gbreserve.pdimg}">
						</div>
					</div>
					<div class="row">
						<div class="col-2 font-weight-bold">
							<span>제품</span>
						</div>
						<div class="col-10">
							<span>${gbreserve.pdname}</span>
						</div>
					</div>
					<div class="row">
						<div class="col-2 font-weight-bold">
							<span>가격</span>
						</div>
						<div class="col-10">
							<span>
								<fmt:formatNumber value="${gbreserve.pdprice}" pattern="#,###" />
								원
							</span>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
				<div class="col-6">
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">작성자</span>
						</div>
						<div class="col-11">
							<input type="text" value="${gbreserve.gbmid}" class="bd_none" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">제목</span>
						</div>
						<div class="col-11">
							<input type="text" name="gbtitle" value="${gbreserve.gbtitle}" class="bd_none" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">내용</span>
						</div>
						<div class="col-11">
							<textarea id="gbcomment" name="gbcomment" class="bd_none" readonly="readonly" rows="7" style="width: 100%; resize: none;">${gbreserve.gbcomment}</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">지역</span>
						</div>
						<div class="col-11">
							<input name="gbregion" class="bd_none" readonly="readonly" type="text" value="${gbreserve.gbregion}">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">기간</span>
						</div>
						<div class="col-11">
							<input name="gbfdate" type="text" class="bd_none" readonly="readonly" value="${gbreserve.gbsdate} ~ ${gbreserve.gbfdate}">
						</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>

		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer">
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