<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/handmade.css"
	type="text/css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
	<!-- Start Main Top -->

	<!-- End Main Top -->

	<!-- Start Main Top -->
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<!-- Start Navigation -->

		<div class="container">
			<!-- Start Header Navigation -->

			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu"></div>
			<!-- /.navbar-collapse -->

			<!-- Start Atribute Navigation -->
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
			<!-- End Atribute Navigation -->
		</div>
		<!-- Start Side Menu -->

		<!-- End Side Menu -->

		<!-- End Navigation -->
	</header>


	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">


				<!--<section class="shoping-cart spad">  -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">

								<div class="item display" style="padding-top: 30px;">
									<div class="row"
										style="padding-bottom: 20px; text-align: center;">
										<div class="col-3">
											<h5>업체</h5>
										</div>
										<div class="col-3">
											<h5>제품</h5>
										</div>
										<div class="col-2">
											<h5>가격</h5>
										</div>
										<div class="col-1">
											<h5>수량</h5>
										</div>
										<div class="col-2">
											<h5>총가격</h5>
										</div>
										<div class="col-1">
											<h5>주문취소</h5>
										</div>
									</div>


								</div>
								<form action="deleteOrder" method="get">
									<c:forEach items="${orList}" var="odList">
										<div class="row px">
											<div class="col-3">
												<h5>${odList.cmname }</h5>
											</div>
											<div class="col-3">
												<h5>${odList.pdname }</h5>
											</div>
											<div class="col-2">
												<h5>${odList.pdprice }</h5>
											</div>
											<div class="col-1">
												<h5>${odList.reamount }</h5>
											</div>
											<div class="col-2">
												<h5>${odList.reprice }</h5>
											</div>
											<c:choose>
												<c:when test="${odList.restate == 0}">
													<div class="col-1">
														<button type="submit" name="recode"
															value="${odList.recode}">주문확인</button>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-1">
														<button type="submit" name="recode"
															value="${odList.recode}">취소요청</button>
													</div>
												</c:otherwise>


											</c:choose>
										</div>
										<hr>
									</c:forEach>

								</form>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__btns">
								<a href="shopMain" class="primary-btn cart-btn">더 쇼핑하기</a> <a
									href="orderhistory" class="primary-btn cart-btn cart-btn-right">
									새로고침</a>
							</div>
						</div>




					</div>
				</div>
				<!--</section>  -->
			</div>


		</div>
	</div>
	<!-- End Cart -->

	<!-- Start Instagram Feed  -->

	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->

	<!-- End Footer  -->

	<!-- Start copyright  -->

	<!-- End copyright  -->


	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<!-- ALL JS FILES -->
	<footer class="footer" style="margin-top: 220px;">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
</body>

<script type="text/javascript">
	/*
	 function ordercancel(btnObj,recode,restate){
	
	 console.log(recode);
	 console.log(restate);
	 console.log($(btnObj).text());
	 $.ajax({
	 type : "get",
	 url : "orderCancel",
	 data : {"recode" : recode,"restate" : restate},
	 dataType : "json",
	 async : false,
	 success : function(result){
	 console.log(result);
	
	 if(restate == 0 ){
	 $(btnObj).text("주문취소");
	 }else if(restate == 1){
	 $(btnObj).text("취소대기");
	 }else if(restate == 2){
	 $(btnObj).text("취소완료");
	 }
	 }
	
	
	 });
	 }
	 */
</script>

</html>