<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>관리자 고객문의</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
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
<style>
.but_css {
	height: 20px;
	width: 20px;
	border: none;
	font-size: 10;
	font-weight: 800;
	text-align: center;
}

.item display {
	display: flex;
	flex-direction: column;
}

.item {
	padding-bottom: 30px;
}

.px {
	padding-bottom: 30px;
}

.divpadding {
	padding-top: 36px;
}

.center {
	text-align: center;
}

h7 {
	text-align: center;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 10px 20px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-brown {
	background-color: #ce6d39;
	color: #ffeee4;
}
</style>

<body>
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<div class="container">
			<div class="row">
				<%@ include file="../includes/AdminMiddleBar.jsp"%>
			</div>
		</div>
	</header>
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">
								<div class="item display" style="padding-top: 10px;">
									<hr>
									<div class="row">
										<table class="type09">
											<thead>
												<tr>
													<th>작성자</th>
													<th>문의 제목</th>
													<th>문의 유형</th>
													<th>시간</th>
													<th>상태</th>
													<th>상세 보기</th>
												</tr>
											</thead>
										</table>
									</div>
									<table class="type09">
										<thead>
											<c:forEach items="${inquireList}" var="iqList">
												<tr>
													<th style="vertical-align: middle;">${iqList.iqmid }</th>
													<th style="vertical-align: middle;">${iqList.iqtitle }</th>
													<th style="vertical-align: middle;">${iqList.iqcategory }</th>
													<th style="vertical-align: middle;">${iqList.iqdate }</th>
													<c:choose>
														<c:when test="${iqList.iqstate == 0 }">
															<th style="vertical-align: middle;">답변대기</th>
														</c:when>
														<c:otherwise>
															<th style="vertical-align: middle;">답변완료</th>
														</c:otherwise>
													</c:choose>
													<th>
														<c:choose>
															<c:when test="${iqList.iqstate == 0 }">
																<button class="w-btn w-btn-brown" onclick="InquireInfo('${iqList.iqcode}')">보기</button>
															</c:when>
															<c:otherwise>
																<button disabled class="w-btn w-btn-brown" onclick="InquireInfo('${iqList.iqcode}')">답변완료</button>
															</c:otherwise>
														</c:choose>
													</th>
											</c:forEach>
										<thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

	<!-- ALL JS FILES -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>
<script type="text/javascript">
	function InquireInfo(iqcode) {
		console.log(iqcode);
		location.href = "AdminInquireInfo?iqcode=" + iqcode;
	}
</script>

</html>