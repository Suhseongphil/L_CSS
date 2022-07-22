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
							<h4>카테고리</h4>

							<ul id="nav-v2" style="margin-left: -30px;">
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									음료
									<ul class="submenu">
										<li value="원두"><a href="#">원두</a></li>
										<li value="소스"><a href="#">소스</a></li>
										<li value="파우더"><a href="#">파우더</a></li>

									</ul></li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									머신</a>
									<ul class="submenu">
										<li value="그라인더"><a href="#">그라인더</a></li>
										<li value="커피머신"><a href="#">커피머신</a></li>
										<li value="제빙기"><a href="#">제빙기</a></li>

									</ul></li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									일회용품
									<ul class="submenu">
										<li value="아이스컵"><a href="#">아이스컵</a></li>
										<li value="스트로우"><a href="#">스트로우</a></li>
										<li value="종이컵"><a href="#">종이컵</a></li>
										<li value="냅킨"><a href="#">냅킨</a></li>
										<li value="컵홀더"><a href="#">컵홀더</a></li>
									</ul></li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									컵
									<ul class="submenu">
										<li value="머그잔"><a href="#">머그잔</a></li>
										<li value="텀블러"><a href="#">텀블러</a></li>
									</ul></li>
								<li
									style="background-color: white-space; margin: 10px; padding: 1px; padding-bottom: -30px; font-weight: bold;"
									class="menu-v2 card o-hidden border-0 shadow-lg my-4 card-body p-0">
									가구
									<ul class="submenu">
										<li value="의자"><a href="#">의자</a></li>
										<li value="테이블"><a href="#">테이블</a></li>
									</ul></li>
							</ul>
							<div class="clear"></div>

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
											<option value="pdname">이름</option>
											<option value="pdtype">종류</option>

										</select> <input type="text" placeholder="검색어 입력.." name="searchText">&nbsp;&nbsp;&nbsp;
										<button type="submit">검색</button>

									</div>
								</div>

							</div>
						</form>

					</div>
					<div class="row">
						<div class="row">

							<c:forEach items="${searchList}" var="pro">
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pro.pdimg }"></div>
										<div class="product__discount__item__text">
											<a
												href="cartIn?pdcode=${pro.pdcode }&pdcmcode=${pro.pdcmcode}">
												<i class="fa fa-shopping-cart"></i>
											</a> <span>${pro.pdname}</span>
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
	</section>

	<!-- 
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
 -->

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
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
	function sauceCategory() {
		console.log('호출');
		var con = document.getElementById('sauce');
		console.log(con);
		if (con.style.display == 'block') {

			con.style.display = 'none';
		} else {
			con.style.display = 'block';
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

<script>
	$(document).ready(function() {
		//menu v1 
		$(".menu-v1").mouseover(function() {
			$(this).children(".submenu").stop().slideDown();
		});
		$(".menu-v1").mouseleave(function() {
			$(this).children(".submenu").stop().slideUp();
		});

		//menu v2
		$(".menu-v2").mouseover(function() {
			$(this).children(".submenu").show(200);
		});
		$(".menu-v2").mouseleave(function() {
			$(this).children(".submenu").hide(200);
		});

	});
</script>
</html>