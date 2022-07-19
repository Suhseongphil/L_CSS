<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Gowun+Batang:wght@700&family=Hahmlet:wght@700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

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
				<div class="col-lg-12">
					<div class="hero__search"></div>
					<div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/016.jpg">
						<div class="center" id="text_ls">
        					<a href="#"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></a>
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
									<div class="featured__item__pic set-bg" data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li>
												<a href="#">
													<i class="fa fa-shopping-cart"></i>
												</a>
											</li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" /> 원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when test="${product.pdtype == '소스' || product.pdtype == '파우더'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix sauce">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li>
												<a href="#">
													<i class="fa fa-shopping-cart"></i>
												</a>
											</li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" /> 원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when test="${product.pdtype == '머신' || product.pdtype == '제빙기'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix machine">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li>
												<a href="#">
													<i class="fa fa-shopping-cart"></i>
												</a>
											</li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" /> 원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

						<c:when test="${product.pdtype == '테이블' || product.pdtype == '의자'}">
							<div class="col-lg-3 col-md-4 col-sm-6 mix table">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="${product.pdimg}">
										<ul class="featured__item__pic__hover">
											<li>
												<a href="#">
													<i class="fa fa-shopping-cart"></i>
												</a>
											</li>
										</ul>
									</div>
									<div class="featured__item__text2">
										<h6>
											<a href="#">${product.pdname }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${product.pdprice}" pattern="#,###" /> 원
										</h5>
									</div>
								</div>
							</div>
						</c:when>

					</c:choose>

				</c:forEach>
				<!-- 
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
 -->
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
					<div class="col-lg-3">
						<div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/categories/cat-5.jpg">
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
	<br>

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
	if (checkMsg == "1") {
		alert("결제가 완료되었습니다.");
	}
</script>
</html>