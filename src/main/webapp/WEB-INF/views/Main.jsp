<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									검색
									<span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="검색할 내용..">
								<button type="submit" class="site-btn2">검색</button>
							</form>
						</div>
					</div>
					<div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/banner.jpg">
						<div class="hero__text2">
							<span>BEENS FRESH</span>
							<h2>
								BEENS <br />FAST MATCHING
							</h2>
							<p>Free Matching System</p>
							<a href="#" class="mainshop-btn">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-1.jpg">
							<h5>
								<a href="#">Fresh Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-2.jpg">
							<h5>
								<a href="#">Dried Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-3.jpg">
							<h5>
								<a href="#">Vegetables</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-4.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-5.jpg">
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
							<li data-filter=".oranges">원두&커피</li>
							<li data-filter=".fresh-meat">시럽&파우더</li>
							<li data-filter=".vegetables">커피머신&제빙기</li>
							<li data-filter=".fastfood">테이블&의자</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/featured/feature-1.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
							<ul class="featured__item__pic__hover">
								<li>
									<a href="#">
										<i class="fa fa-heart"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-retweet"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-shopping-cart"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->

	<!-- Banner End -->

	<!-- Latest Product Section Begin -->

	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->

	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<h2>L&CSS</h2>
						</div>
						<ul>
							<li>회사주소: 인천일보아카데미</li>
							<li>전화번호: 032-111-1111</li>
							<li>이메일 : #</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>프로젝트</h6>
						<ul>
							<li>
								<a href="#">팀장 : 서성필</a>
							</li>
							<li>
								<a href="#">엔지니어 : 송영오</a>
							</li>
							<li>
								<a href="#">엔지니어 : 천호태</a>
							</li>
							<li>
								<a href="#">엔지니어 : 이상윤</a>
							</li>

						</ul>

					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">

						<a href="InquirePage">고객문의</a>



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