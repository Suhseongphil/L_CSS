<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html" />

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


<style>
#nav-v2 {
	width: 150px;
	text-align: center;
}

.menu-v2 {
	line-height: 2;
	position: relative;
}

.menu-v2 .submenu {
	position:;
	width: 130px;
	left: 149px;
	background-color: white;
	color: black;
	top: -1px;
	display: none;
}

.menu-v2:hover {
	background-color: #8b4513;
	color: white;
}

.menu-v2 .submenu>li:hover {
	background-color: white;
	color: black;
}
</style>

<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<!-- Header Section End -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>

		</div>
	</div>
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 section-container-spacer"
					style="margin-top: -30px;">
					<div class="sidebar">
						<div class="sidebar__item" id="category">
							<h4>????????????</h4>

							<ul id="nav-v2"
								style="margin-left: -30px; padding-bottom: -30px;">
								<li
									style="background-color: white-space; margin: 10px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									??????
									<ul  class="submenu" >
										<li value="??????"><a href="#">??????</a></li>
										<li value="??????"><a href="#">??????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>

									</ul>
								</li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									??????
									<ul class="submenu">
										<li value="????????????"><a href="#">????????????</a></li>
										<li value="????????????"><a href="#">????????????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>

									</ul>
								</li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									????????????
									<ul class="submenu">
										<li value="????????????"><a href="#">????????????</a></li>
										<li value="????????????"><a href="#">????????????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>
										<li value="??????"><a href="#">??????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>
									</ul>
								</li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									???
									<ul class="submenu">
										<li value="?????????"><a href="#">?????????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>
									</ul>
								</li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									??????
									<ul class="submenu">
										<li value="??????"><a href="#">??????</a></li>
										<li value="?????????"><a href="#">?????????</a></li>
									</ul>
								</li>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>

		<div class="container" style="padding-left: 80px;">
			<div class="col-lg-7 col-md-3" style="margin-left: 250px;">
				<div class="product__discount">
					<div class="section-title product__discount__title"
						style="text-align: center; margin-top: -450px;">
						<form action="searchProduct" method="get">
							<div id="search" class="row">
								<div class="col-lg-8">
									<div class="shoping__cart__btns">
										<select name="pdcategory" id="pdcategory">
											<option value="pdname">??????</option>
											<option value="pdtype">??????</option>

										</select> <input type="text" placeholder="????????? ??????.." name="searchText">&nbsp;&nbsp;&nbsp;
										<button type="submit">??????</button>

									</div>
								</div>

							</div>
						</form>
						<h2>?????? ??????</h2>
					</div>
					<div class="row">
						<div class="row">

							<c:forEach items="${searchType}" var="pro" >
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pro.pdimg }"></div>
										<div class="product__discount__item__text">
											<a href="cartIn?pdcode=${pro.pdcode }&pdcmcode=${pro.pdcmcode}"> <i class="fa fa-shopping-cart"></i>
											</a> <span>${pro.pdname}</span>
											<h5>
												<a href="productInfo?pdcode=${pro.pdcode}">${pro.pdtype}</a>
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
	</section>

	<!-- 
		<div class="filter__item">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="filter__sort">
						<span>????????????</span> <select>
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
 -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<h2>L&CSS</h2>
						</div>
						<ul>
							<li>????????????: ????????????????????????</li>
							<li>????????????: 032-111-1111</li>
							<li>????????? : #</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>????????????</h6>
						<ul>
							<li><a href="#">?????? : ?????????</a></li>
							<li><a href="#">???????????? : ?????????</a></li>
							<li><a href="#">???????????? : ?????????</a></li>
							<li><a href="#">???????????? : ?????????</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<a href="InquirePage">????????????</a>
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
	$(".submenu li a").click(function() {
		console.log($(this).text());
		var type = $(this).text();
		location.href="searchType?type="+type
	});
</script>

<script>
	$(document).ready(function() {

		//menu v2
		$(".menu-v2").mouseover(function() {
			$(this).children(".submenu").show(150);
		});
		$(".menu-v2").mouseleave(function() {
			$(this).children(".submenu").hide(150);
		});

	});
</script>


</html>