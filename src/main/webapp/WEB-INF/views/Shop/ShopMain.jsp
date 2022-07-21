<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/handmade.css"
	type="text/css">
<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<!-- Header Section End -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<section class="product spad">
		<div class="container">
			<div class="row">



				<div class="col-xs-12 section-container-spacer">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>카테고리</h4>
						</div>
					</div>
				</div>



			</div>
		</div>
		<div class="container" style="padding-left: 10px;">





			<div class="col-lg-7 col-md-3">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>추천 상품</h2>
					</div>
					<div class="row">
						<div class="product__discount__slider owl-carousel">

							<c:forEach items="${selectPro}" var="pro">

								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pro.pdimg }"></div>
										<div class="product__discount__item__text">
											<a href="#">
													<i class="fa fa-shopping-cart"></i>
												</a>
											<span>${pro.pdname}</span>
											<h5>
												<a href="#">${pro.pdtype}</a>
											</h5>
											<div class="product__item__price">${pro.pdprice}</div>
										</div>
									</div>
								</div>
							</c:forEach>





						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="filter__item">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="filter__sort">
						<span>상품목록</span> <select>
							<option value="0">Default</option>
							<option value="0">Default</option>
						</select>
					</div>
				</div>


			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="img/product/product-1.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="img/product/product-2.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>

				</div>
			</div>






		</div>
		<div class="product__pagination">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
				class="fa fa-long-arrow-right"></i></a>
		</div>

	</section>
</body>

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

<script type="text/javascript">
	function sauceCategory() {
		console.log('호출');
		var con = document.getElementById('sauce');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function tumblerCategoru() {
		console.log('호출');
		var con = document.getElementById('tumbler');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function furnitureCategoru() {
		console.log('호출');
		var con = document.getElementById('furniture');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>

<script type="text/javascript">
	function machineCategoru() {
		console.log('호출');
		var con = document.getElementById('machine');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function disposableCategoru() {
		console.log('호출');
		var con = document.getElementById('disposable');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>

<script type="text/javascript">
	function productCategory() {
		console.log('호출');
		var con = document.getElementById('productNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function cafeCategory() {
		console.log('호출');
		var con = document.getElementById('cafeNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function companyCategory() {
		console.log('호출');
		var con = document.getElementById('comNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function inquireCategory() {
		console.log('호출');
		var con = document.getElementById('inquireNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
</html>