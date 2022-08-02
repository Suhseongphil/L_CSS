<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>주문목록</title>
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

.btn_none {
	border: none;
	background: #f5f5f5;
}
</style>

<body>
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<div class="container">
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>
	</header>

	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-lg-12" style="margin-left: 200px; margin-right: 100px; margin-top: -20px;">
							<div class="shoping__cart__table">
								<div class="item display" style="padding-top: 30px;">
									<table class="type09" style="margin-left: -200px; width: 1100px; margin-top: 30px;">
										<thead>
											<tr>
												<th>업체</th>
												<th>제품</th>
												<th>가격</th>
												<th>수량</th>
												<th>총가격</th>
												<th>배송</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orList}" var="odList">
												<tr>
													<td>${odList.cmname }</td>
													<td>${odList.pdname }</td>
													<td>${odList.pdprice }</td>
													<td>${odList.reamount }</td>
													<td>${odList.reprice }</td>
													<c:choose>
														<c:when test="${odList.restate == 0}">
															<td>
																<form action="orderCheck" method="get">
																	<button type="submit" name="recode" style="background-color: black; color: white;" value="${odList.recode}">배송</button>
																</form>
																<form action="deleteOrder" method="get">
																	<button type="submit" name="recode" style="background-color: black; color: white; margin-top: 10px;" value="${odList.recode}">취소요청</button>
																</form>
															</td>
														</c:when>
														<c:when test="${odList.restate == 2}">
															<td>
																<h6>배송완료</h6>
															</td>
														</c:when>
														<c:when test="${odList.restate == 4 }">
															<td>
																<h6>배송완료</h6>
															</td>
														</c:when>
														<c:otherwise>
															<td>
																<form action="deleteOrder" method="get">
																	<button type="submit" name="recode" style="background-color: black; color: white; margin-top: 10px;" value="${odList.recode}">취소요청</button>
																</form>
															</td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__btns">
								<a href="orderList" class="primary-btn cart-btn cart-btn-right" style="background-color: black; color: white;"> 새로고침</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<!-- ALL JS FILES -->
	<footer class="footer" style="margin-top: 220px;">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}'
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>

</html>