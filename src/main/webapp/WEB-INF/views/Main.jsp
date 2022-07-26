<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Gowun+Batang:wght@700&family=Hahmlet:wght@700&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
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
	href="${pageContext.request.contextPath }/resources/css/mainHover.css"
	type="text/css">
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<%@ include file="includes/TopBar.jsp"%>

	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<div class="container">
		<div class="row">
			<%@ include file="includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__search"></div>
					<div class="hero__item set-bg"
						data-setbg="${pageContext.request.contextPath }/resources/img/hero/016.jpg">
						<div class="center">
							<a href="#" style="font-family: text_ls;"> <span
								data-attr="Buy">Buy</span><span data-attr="Now">Now</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>상품 종류</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">모든상품</li>
							<li data-filter=".beens">원두&커피</li>
							<li data-filter=".sauce">소스&파우더</li>
							<li data-filter=".machine">커피머신&제빙기</li>
							<li data-filter=".table">테이블&의자</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row featured__filter">

				<c:forEach items="${productList}" var="product">

					<c:choose>

						<c:when test="${product.pdtype == '원두' }">
							<div class="col-lg-3 col-md-4 col-sm-6 mix beens">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li><a href="#"> <i class="fa fa-shopping-cart"></i>
											</a></li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when
							test="${product.pdtype == '소스' || product.pdtype == '파우더'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix sauce">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li><a href="#"> <i class="fa fa-shopping-cart"></i>
											</a></li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when
							test="${product.pdtype == '머신' || product.pdtype == '제빙기'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix machine">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li><a href="#"> <i class="fa fa-shopping-cart"></i>
											</a></li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when
							test="${product.pdtype == '테이블' || product.pdtype == '의자'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix table">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li><a href="#"> <i class="fa fa-shopping-cart"></i>
											</a></li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-1.jpg">
							<h5>
								<a href="#">Fresh Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-2.jpg">
							<h5>
								<a href="#">Dried Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-3.jpg">
							<h5>
								<a href="#">Vegetables</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-4.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-5.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-5.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-5.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->
	<br>

	<!-- Banner Begin -->

	<!-- Banner End -->

	<!-- Latest Product Section Begin -->

	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->

	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<%@ include file="includes/FooterBar.jsp"%>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
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
	<script
		src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
</html>